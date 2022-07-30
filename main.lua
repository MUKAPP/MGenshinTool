require "import"

import "android.os.Build"
import "android.content.Intent"
import "android.content.ComponentName"
import "android.net.Uri"

local function 图标(n)
  return "res/shortcut_"..n..".png"
end

local function todo()
  if not 文件是否存在(MUKAPP文件()) then
    创建文件夹(MUKAPP文件())
  end

  if not 文件是否存在(新内置存储文件()) then
    创建文件夹(新内置存储文件())
  end

  if not 文件是否存在(内置存储("Pictures/MUKGenshinTool")) then
    创建文件夹(内置存储("Pictures/MUKGenshinTool"))
  end

  if not 文件是否存在(新内置存储文件("Download")) then
    创建文件夹(新内置存储文件("Download"))
  end

  if 文件是否存在(内置存储文件("Cache")) then
    删除文件(内置存储文件("Cache"))
  end
  创建文件夹(内置存储文件("Cache"))
end

if Build.VERSION.SDK_INT >= 25 then
  import "android.content.pm.ShortcutInfo"
  import "android.graphics.drawable.Icon"

  --创建Intent对象
  local intent1 = Intent(Intent.ACTION_MAIN)
  .setComponent(ComponentName(activity.getPackageName(),"com.androlua.LuaActivity"))
  .setData(Uri.parse("file://"..activity.getLuaDir().."/tools/daily.lua"))

  local intent2 = Intent(Intent.ACTION_MAIN)
  .setComponent(ComponentName(activity.getPackageName(),"com.androlua.LuaActivity"))
  .setData(Uri.parse("file://"..activity.getLuaDir().."/tools/relicscore.lua"))

  local intent3 = Intent(Intent.ACTION_MAIN)
  .setComponent(ComponentName(activity.getPackageName(),"com.androlua.LuaActivity"))
  .setData(Uri.parse("file://"..activity.getLuaDir().."/tools/gacha_export.lua"))

  local intent4 = Intent(Intent.ACTION_MAIN)
  .setComponent(ComponentName(activity.getPackageName(),"com.androlua.Main"))
  .setData(Uri.parse("shortcut:signin"))

  local SHORTCUT_TABLE={
    {"ID4","米游社签到",intent4,activity.getLuaDir(图标("signin"))},
    {"ID1","今日素材",intent1,activity.getLuaDir(图标("today"))},
    {"ID2","圣遗物评分",intent2,activity.getLuaDir(图标("relic"))},
    {"ID3","抽卡记录分析",intent3,activity.getLuaDir(图标("gacha"))},
  }

  --动态的Shortcut,获取ShortcutManager,快捷方式管理器
  --提供了添加,移除,更新,禁用,启动,获取静态快捷方式,获取动态快捷方式,获取固定在桌面的快捷方式等方法
  local scm = activity.getSystemService(activity.SHORTCUT_SERVICE);

  local infos = ArrayList();
  for k,v in pairs(SHORTCUT_TABLE) do
    local si = ShortcutInfo.Builder(this,v[1])
    .setIcon(Icon.createWithBitmap(loadbitmap(v[4])))
    --快捷方式添加到桌面显示的标签文本
    .setShortLabel(v[2])
    --长按图标快捷方式显示的标签文本(既快捷方式名字)
    .setLongLabel(v[2])
    .setIntent(v[3])
    .build();
    infos.add(si);
  end

  --添加快捷方式
  scm.setDynamicShortcuts(infos);

  --移除快捷方式
  --scm.removeDynamicShortcuts(infos);

  function onNewIntent(intent)
    local uriString = tostring(intent.getData())
    if uriString=="shortcut:signin" then
      activityed=true
      --print(1)
      --_subtitle.setText("给时光以生命，给岁月以文明。")
      local subtitle="给时光以生命，给岁月以文明。"

      activity.newActivity("home",android.R.anim.fade_in,android.R.anim.fade_out,{subtitle,"signin"})
      activity.finish()
      System.gc()
    end
  end
end

function onCreate()
  if xpcall(function()
      import "mods.muk"

      local layout={
        RelativeLayout;
        layout_width="-1";
        layout_height="-1";
        backgroundColor=backgroundc;
        id="_root";
        {--标题外布局
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          gravity="center";
          paddingTop="6px",
          layout_marginBottom=导航栏高度,
          {
            ImageView;
            ColorFilter=viewshaderc;
            src="tranicon.png",
            id="icon";
            layout_height="50%w";
            layout_width="50%w";
          };
        };
      };

      设置视图(layout)
      end,function(e)
      print(e)
    end) then

    --沉浸状态栏()

    activityed=false

    ti=Ticker()
    ti.Period=600
    ti.onTick=function()
      pcall(function()
        ti.stop()
      end)
      ti=nil
      if activityed==false then
        activityed=true
        --print(1)
        --_subtitle.setText("给时光以生命，给岁月以文明。")
        local subtitle="给时光以生命，给岁月以文明。"

        activity.newActivity("home",android.R.anim.fade_in,android.R.anim.fade_out,{subtitle})
        activity.finish()
        System.gc()

      end
    end
    ti.start()

    Http.get("https://v2.jinrishici.com/one.json","utf8",function(code,content)
      if activityed==false then
        activityed=true
        --print(2)
        local content=content:gsub("\n","")
        local subtitle
        if code==200 then
          content=JSON.decode(content).data.content
          --_subtitle.setText(content)
          subtitle=content
         else
          --_subtitle.setText("给时光以生命，给岁月以文明。")
          subtitle="给时光以生命，给岁月以文明。"
        end

        activity.newActivity("home",android.R.anim.fade_in,android.R.anim.fade_out,{subtitle})
        activity.finish()
        System.gc()

      end
    end)

    todo()

    --print(getLanguage("main","正在加载"))
   else
    if newIntent~=nil then
      activity.newActivity("main",{newIntent})
      activity.finish()
      System.gc()
     else
      activity.newActivity("main")
      activity.finish()
      System.gc()
    end
  end

end

function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    return true
  end
end
