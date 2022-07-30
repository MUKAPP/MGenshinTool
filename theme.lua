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

activity.Title="主题"

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
        onClick=function()退出()end;
      };
    };
    {
      TextView;
      text="主题";
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
    RecyclerView,
    --layout_marginTop="20dp",
    layout_width="-1",
    layout_height="-1",
    id="rv",
    paddingLeft="8dp",
    paddingRight="8dp",
  },
}

activity.setContentView(loadlayout(layout))

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
    layout_height="256dp";
    layout_margin="8dp";
    id="tlb";
    {
      ImageView;
      id="img";
      scaleType="centerCrop";
      layout_width="-1";
      layout_height="-1";
      colorFilter=viewshaderc;
    };
    {
      LinearLayout,
      orientation="vertical",
      layout_width="-1",
      layout_height="-1",
      gravity="bottom";
      {
        CardView;
        CardElevation="0dp";
        Radius="4dp";
        layout_width="-1";
        layout_height="-2";
        layout_margin="8dp";
        layout_marginBottom="8dp";
        {
          TextView;
          id="tladp_text";
          textSize="16sp";
          gravity="left|center";
          Typeface=AppFont.粗体;
          layout_width="-1";
          layout_height="-1";
          padding="16dp";
          paddingTop="14dp";
          paddingBottom="14dp";
        };
      };
    };
    {
      TextView;
      id="tladp_activity";
      layout_width="-1";
      layout_height="-1";
      onClick=function(v)
        mukactivity.setData("Setting_Theme",v.Text)
        提示("返回主页生效")
        更改设置=true
      end;
      textColor="#00000000";
    };
  };
};

--tladp=LuaAdapter(activity,tool_list_item)

--gv.setAdapter(tladp)

data={}

function addt(text,imgurl,textcn,bkc,theme)
  data[#data+1]={
    imgurl,
    text,
    textcn,
    bkc,
    theme,
  }
end

addt("璀璨（全屏主题）","res/star.jpeg",0xFFA0B0C0,0xcF101818,"Star")
addt("霞帔（全屏主题）","res/mountain_pink.jpeg",0xFF603838,0xcfffffff,"M_P")
addt("猛男粉","res/defaultbackground.png",0xffcb82be,0xcfffffff,"Pink")
addt("墨海","res/sea.jpg",0xff57a2db,0xcfffffff,"Sea")
addt("熙春","res/spring.jpg",0xffd194c2,0xcfffffff,"Spring")
addt("盛夏","res/summer.jpg",0xffc2ad70,0xcfffffff,"Summer")
addt("袅秋","res/autumn.jpg",0xffd6765c,0xcfffffff,"Autumn")
addt("寒冬","res/winter.jpg",0xff304038,0xcfffffff,"Winter")

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
    Glide.with(this)
    .load(activity.getLuaDir(data[position+1][1]))
    .into(view.img);
    view.tladp_text.setTextColor(data[position+1][3])
    view.tladp_text.Text=data[position+1][2]
    view.tladp_text.getParent().CardBackgroundColor=data[position+1][4]
    view.tladp_activity.Text=data[position+1][5]
    view.tladp_activity.setBackgroundDrawable(波纹2("方自适应"))
  end,
}))

rv.setAdapter(adp)

import "com.lua.*"
import "com.lua.LuaSpanSizeLookUp$LuaInterface"

local gvmanager=GridLayoutManager(activity,1)
.setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup{
  getSpanSize=function(position)
    return int(1)
  end
}))

rv.setLayoutManager(gvmanager)

function 退出()
  if 更改设置 then
    activity.result({})
   else
    关闭页面()
  end
end

function onKeyDown(e)
  if e == 4 then
    退出()
    return true
  end
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