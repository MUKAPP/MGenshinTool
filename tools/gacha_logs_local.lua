require "import"
import "mods.muk"

import "androidx.recyclerview.widget.GridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

activity.Title="本地记录"

layout={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
  Gravity="center|top",
  background=backgroundc;
  {
    LinearLayout,
    layout_width="fill",
    layout_height="56dp",
    gravity="center|left";
    id="mActionBar";
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="56dp";
      layout_width="56dp";
      gravity="center";
      {
        ImageView;
        ColorFilter=primaryc;
        src=图标("arrow_back");
        layout_height="32dp";
        layout_width="32dp";
        padding="4dp";
        id="fh";
        onClick=function()activity.finish()end;
      };
    };
    {
      TextView;
      text="本地记录";
      textColor=primaryc;
      textSize="20sp";
      id="_title";
      SingleLine=true;
      layout_width="-1",
      gravity="center|left";
      paddingLeft="16dp";
      layout_weight="1",
      Typeface=AppFont.特粗;
    };
  };

  {
    RelativeLayout,
    {
      RecyclerView,
      --layout_marginTop="20dp",
      layout_width="-1",
      layout_height="-1",
      id="rv",
      paddingLeft="8dp",
      paddingRight="8dp",
    },
  },
}

activity.setContentView(loadlayout(layout))

function onCreate()
  波纹({cv1_lay},"方主题")
  波纹({fh},"圆主题")

  tool_list_item={
    LinearLayout;
    layout_width="-1";
    layout_height="-2";
    onClick=function()end;
    {
      CardView;
      CardElevation="0dp";
      CardBackgroundColor=cardbackc;
      Radius="8dp";
      layout_width="-1";
      layout_height="-2";
      layout_margin="8dp";
      id="tlb";
      {
        LinearLayout,
        orientation="vertical",
        layout_width="-1",
        layout_height="-1",
        padding="16dp",
        onClick=function(v)
          local v=v.getChildAt(0)
          if v.Text==默认提示 then
            return true
          end
          if 文件是否存在(内置存储文件("gacha_export.tmp")) then
            删除文件(内置存储文件("gacha_export.tmp"))
          end
          创建文件(内置存储文件("gacha_export.tmp"))
          写入文件(内置存储文件("gacha_export.tmp"),读取文件(新内置存储文件("GachaLogs/"..v.Text..".json")))
          activity.newActivity("tools/gacha_export_result")
        end;
        OnLongClickListener=function(v)
          local v=v.getChildAt(0)
          if v.Text==默认提示 then
            return true
          end

          local dann = {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-1",
            {
              LinearLayout,
              orientation = "vertical",
              layout_width = "-1",
              layout_height = "-2",
              id = "ztbj",
              {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = "操作记录 "..v.Text,
                Typeface = AppFont.特粗,
                textColor = primaryc
              },
              {
                CardView,
                CardElevation = "0dp",
                CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                Radius = "8dp",
                layout_width = "-1",
                layout_height = "-2",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                layout_marginTop = "12dp",
                layout_marginBottom = "8dp",
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-1",
                  textSize = "14sp",
                  paddingRight = "16dp",
                  paddingLeft = "16dp",
                  Typeface = AppFont.特粗,
                  paddingTop = "12dp",
                  paddingBottom = "12dp",
                  gravity = "center",
                  Text = "导出JSON",
                  textColor = primaryc,
                  background=波纹2("方主题"),
                  onClick=function()
                    关闭对话框()
                    local fileName = "抽卡记录导出_" .. os.date("%Y-%m-%d_%H-%M-%S") .. "_UIGF.json"
                    创建文件(新内置存储文件(fileName))
                    写入文件(新内置存储文件(fileName), 读取文件(新内置存储文件("GachaLogs/"..v.Text..".json")))
                    提示("保存成功：" .. 新内置存储文件(fileName))
                  end,
                }
              },
              {
                CardView,
                CardElevation = "0dp",
                CardBackgroundColor = 0x21F44336,
                Radius = "8dp",
                layout_width = "-1",
                layout_height = "-2",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                layout_marginTop = "8dp",
                layout_marginBottom = "24dp",
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-1",
                  textSize = "14sp",
                  paddingRight = "16dp",
                  paddingLeft = "16dp",
                  Typeface = AppFont.标准,
                  paddingTop = "12dp",
                  paddingBottom = "12dp",
                  gravity = "center",
                  Text = "删除记录",
                  textColor = "#F44336",
                  background=波纹2("方",0xffF44336),
                  onClick=function()
                    关闭对话框()
                    双按钮对话框("确认要删除 "..v.Text.." 的全部记录吗","删除之后无法找回",
                    "确认删除","取消",function()
                      关闭对话框()
                      删除文件(新内置存储文件("GachaLogs/"..v.Text..".json"))
                      更新()
                      提示("删除成功：" .. 新内置存储文件(fileName))
                      end,function()
                      关闭对话框()
                    end)
                  end,
                },
              },
            }
          }

          dl = BottomDialog(activity)
          dl.setView(loadlayout(dann))
          dl.setGravity(Gravity.BOTTOM)
          dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
          dl.setMinHeight(0)
          dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
          --设置圆角
          dl.setRadius(dp2px(16), 转0x(backgroundc))
          if gb == 0 then
            dl.setCancelable(false)
            dl.setCanceledOnTouchOutside(false)
            dl.onDismiss = function()
              an = dl.show()
            end
           else
            dl.setCanceledOnTouchOutside(true)
          end
          an = dl.show()
          return true
        end;
        {
          TextView;
          id="tladp_text";
          textSize="16sp";
          gravity="left|center";
          Typeface=AppFont.粗体;
          layout_width="-1";
          layout_height="-1";
          textColor=textc,
        };
        {
          TextView;
          id="tladp_info";
          textSize="14sp";
          gravity="left|center";
          Typeface=AppFont.标准;
          layout_width="-1";
          layout_height="-1";
          paddingTop="2dp";
          textColor=textc,
        };
        {
          LinearLayout,
          gravity="right",
          layout_width="-1",
          layout_height="-2",
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = 转0x(primaryc) - 0xde000000,
            Radius = "6dp",
            layout_width = "-2",
            layout_height = "-2",
            {
              TextView,
              layout_width = "-1",
              layout_height = "-1",
              textSize = "14sp",
              paddingRight = "12dp",
              paddingLeft = "12dp",
              Typeface = AppFont.粗体,
              paddingTop = "8dp",
              paddingBottom = "8dp",
              gravity = "center",
              Text = "更新记录",
              textColor = primaryc,
              id="refresh",
            }
          },
        },
      };
    };
  };

  --tladp=LuaAdapter(activity,tool_list_item)

  --gv.setAdapter(tladp)

  默认提示="点击查看本地记录，通过抽卡链接分析记录和导入JSON分析记录都会自动合并至本地记录。\n在软件内登录获取过链接的账号可以直接更新记录。"

  function addt(name,num)
    data[#data+1]={name,num}
  end

  data={}

  function 更新()
    data={}
    addt(默认提示)

    local data2=读取文件夹(新内置存储文件("GachaLogs"))

    for i,v in ipairs(data2) do
      local list=JSON.decode(读取文件(tostring(v))).list
      addt(v.name:match("(.+)%.json"),#list)
    end
    adp.notifyDataSetChanged()
  end

  rholder=function(parent,viewType)
    local views={}
    holder=LuaRecyclerHolder(loadlayout(tool_list_item,views))
    holder.view.setTag(views)
    return holder
  end

  adp=LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount=function()
      return #data
    end,
    getItemViewType=function(position)
      return 0
    end,
    onCreateViewHolder=rholder,
    onBindViewHolder=function(holder,position)
      view=holder.view.getTag()
      view.tladp_text.Text=data[position+1][1]
      if data[position+1][1]~=默认提示
        view.tladp_info.Text="共"..data[position+1][2].."抽"
        view.refresh.setBackgroundDrawable(波纹2("方自适应"))
       else
        控件隐藏(view.tladp_info)
        控件隐藏(view.refresh.getParent())
      end
      控件隐藏(view.refresh.getParent())--
      view.tladp_text.getParent().setBackgroundDrawable(波纹2("方自适应"))
    end,
  }))

  rv.setAdapter(adp)

  local gvmanager=GridLayoutManager(activity,1)
  .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup{
    getSpanSize=function(position)
      return int(1)
    end
  }))

  rv.setLayoutManager(gvmanager)

  更新()

end

function 分屏()
  local function setWidth(v,n)
    linearParams = v.getLayoutParams()
    linearParams.width =n
    v.setLayoutParams(linearParams)
  end

  local function setHeight(v,n)
    linearParams = v.getLayoutParams()
    linearParams.height =n
    v.setLayoutParams(linearParams)
  end

  if activity.Height*0.9<activity.Width then
    --横屏
    setHeight(mActionBar,dp2px(48))
   else
    setHeight(mActionBar,dp2px(56))
  end
end

function onConfigurationChanged(newConfig)
  分屏()
end

分屏()
