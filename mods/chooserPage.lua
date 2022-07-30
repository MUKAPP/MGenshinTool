require "import"
import "mods.muk"

activity.Title="选择文件"

local abm={
  LinearLayout;
  layout_width="fill";
  paddingTop="0dp";
  {
    CardView;
    layout_width="fill";
    radius="0dp";
    translationZ="0dp";
    background=backgroundc;
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      layout_height="fill";
      {
        LinearLayout;--标题栏
        orientation="horizontal";
        layout_height="56dp";
        layout_width="-1";
        background=barbackgroundc;
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
            id="back";
            onClick=function()关闭页面()end;
          };
        };
        {
          TextView;--标题
          Typeface=AppFont.特粗;
          textSize="20sp";
          Text=activity.Title;
          ellipsize="end";
          layout_marginLeft="16dp";
          SingleLine=true;
          textColor=primaryc;
          id="title";
          layout_weight="1";
        };
      };
      {
        RelativeLayout;
        layout_width="fill";
        layout_height="fill";
        {
          PageView;
          id="pageview";
          pages={
            {
              LinearLayout;
              layout_width="fill";
              layout_height="fill";
              orientation="vertical";
              {
                TextView;
                layout_width="fill";
                textSize="14sp";
                paddingTop="8dp";
                paddingLeft="24dp";
                paddingRight="24dp";
                paddingBottom="8dp";
                Typeface=AppFont.标准;
                Text="sdcard";
                textColor=stextc;
                id="cp";
              };
              {
                ListView;
                fastScrollEnabled=true;
                id="lva";
                layout_width="fill";
                layout_height="fill";
              };
            };
            {
              ListView;
              fastScrollEnabled=true;
              paddingTop="8dp";
              id="shortcutListId";
              layout_width="fill";
              layout_height="fill";
            };
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          gravity="bottom|center";
          {
            LinearLayout;
            layout_height="2dp";
            layout_width="fill";
            background=barbackgroundc;
            translationZ="0dp";
            Elevation="0";
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          gravity="bottom|center";
          {
            LinearLayout;
            layout_height="2dp";
            layout_width="50%w";
            Gravity="center";
            id="psdm";
            background=primaryc;
          };
          {
            LinearLayout;
            layout_width="50%w";
          };
        };
      };
    };
  };
};

activity.setContentView(loadlayout(abm))

itm={
  LinearLayout;
  layout_height="-2";
  layout_width="-1";
  Gravity="left|center";
  paddingTop="12dp";
  paddingLeft="24dp";
  paddingRight="24dp";
  paddingBottom="12dp";
  {
    ImageView;
    src="res/file";
    layout_height="24dp";
    layout_width="24dp";
    colorFilter=textc;
    id="tb";
  };
  {
    TextView;
    layout_width="-1";
    layout_marginLeft="16dp";
    layout_height="-2";
    textSize="14sp";
    Text="sdcard";
    textColor=textc;
    Typeface=AppFont.标准;
    id="ll";
  };
};

ddp=LuaAdapter(activity,itm)

function SetItem(path)
  path=tostring(path)
  ddp.clear()--清空适配器
  cp.Text=tostring(path)--设置当前路径
  if path~="/sdcard" then--不是根目录则加上../
    ddp.add{ll="<-"..tostring(File(cp.Text).getParentFile()),tb={src=图标("undo")}}
  end
  ls=File(path).listFiles()
  if ls~=nil then
    ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
    table.sort(ls,function(a,b)
      return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
    end)
   else
    ls={}
  end
  for index,c in ipairs(ls) do
    if c.isDirectory() then--如果为文件夹
      ddp.add{ll=c.Name.."/",tb={src=图标("folder")}}
     else
      if c.isFile() then
        --如果为文件
        if c.Name:find("%.js$") or c.Name:find("%.json$") or c.Name:find("%.csv$") then
          ddp.add{ll=c.Name,tb={src=图标("description")}}
         elseif c.Name:find("%.apk$") then
          ddp.add{ll=c.Name,tb={src=图标("android")}}
         else
          ddp.add{ll=c.Name,tb={src=图标("insert_drive_file")}}
        end
      end
    end
  end
end
lva.onItemClick=function(l,v,p,s)
  项目=tostring(v.Tag.ll.Text)
  if tostring(cp.Text)=="/sdcard" then
    路径=ls[p+1]
   else
    路径=ls[p]
  end
  if 项目=="<-"..tostring(File(cp.Text).getParentFile()) then
    SetItem(File(cp.Text).getParentFile())
   elseif 路径.isDirectory() then
    SetItem(路径)
   elseif 路径.isFile() then
    文件路径=cp.Text.."/"..v.Tag.ll.Text
    activity.result({cp.Text.."/"..v.Tag.ll.Text})
  end
end
lva.setAdapter(ddp)

shortcutList={
  LinearLayout;
  layout_height="-2";
  layout_width="-1";
  Gravity="left|center";
  paddingTop="12dp";
  paddingLeft="24dp";
  paddingRight="24dp";
  paddingBottom="12dp";
  {
    ImageView;
    layout_height="24dp";
    layout_width="24dp";
    layout_marginRight="16dp";
    layout_marginTop="8dp";
    layout_marginBottom="8dp";
    colorFilter=textc;
    id="shortcutIcon";
  };
  {
    LinearLayout;
    orientation="vertical";
    layout_width="-1";
    layout_height="-1";
    gravity="center|left";
    {
      TextView;
      layout_width="fill";
      textSize="14sp";
      singleLine="true";
      textColor=textc;
      id="shortcutTitle";
      Typeface=AppFont.标准;
    };
    {
      TextView;
      layout_width="fill";
      textSize="12sp";
      textColor=textc;
      singleLine="true";
      Typeface=AppFont.标准;
      id="shortcutPath";
    };
  };
};
shortcutAdp=LuaAdapter(activity,shortcutList)
if File("/sdcard/download").exists()==true then
  shortcutAdp.add{shortcutTitle="下载",shortcutPath="/sdcard/download",shortcutIcon={src="res/folder.png"}}
end
if File("/sdcard/DCIM/").exists()==true then
  shortcutAdp.add{shortcutTitle="相机",shortcutPath="/sdcard/DCIM",shortcutIcon={src="res/folder.png"}}
end
if File("/sdcard/Pictures").exists()==true then
  shortcutAdp.add{shortcutTitle="图库",shortcutPath="/sdcard/Pictures",shortcutIcon={src="res/folder.png"}}
end
shortcutListId.setAdapter(shortcutAdp)
shortcutListId.onItemClick=function(l,v,p,s)
  local path=tostring(v.Tag.shortcutPath.Text)
  SetItem(path)
  pageShow(0)
end

function pageShow(number)
  pageview.showPage(number)
end
pageview.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    local w=activity.getWidth()/2
    local wd=c/2
    if a==0 then
      psdm.setX(wd)
    end
    if a==1 then
      psdm.setX(wd+w)
    end
  end,
})

SetItem("/sdcard")
