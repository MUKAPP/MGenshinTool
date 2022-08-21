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

activity.Title="签到结果"

data=JSON.decode(mukactivity.getData("signresult"))
--print(#data)

layout={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
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
        onClick=function()关闭页面()end;
      };
    };
    {
      TextView;
      text=activity.Title;
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

波纹({fh,_save,_more,_copy},"圆主题")

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
      paddingBottom="16dp",
      {
        TextView;
        text="UID",
        textColor=primaryc;
        textSize="16sp";
        gravity="center|left";
        Typeface=AppFont.特粗;
        padding="16dp";
        paddingBottom="0";
        layout_width="-1",
        layout_height="-2",
        id="uid",
      };
      {
        TextView;
        text="正在获取",
        textColor=textc;
        textSize="14sp";
        gravity="center|left";
        Typeface=AppFont.标准;
        paddingTop="4dp";
        paddingLeft="16dp";
        paddingRight="16dp";
        layout_width="-1",
        layout_height="-2",
        id="memo",
      };
      {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        gravity = "right|center",
        {
          CardView,
          layout_width = "-2",
          layout_height = "-1",
          radius = "4dp",
          background = cardbackc,
          --layout_marginTop = "8dp",
          layout_marginRight = "16dp",
          --layout_marginBottom = "8dp",
          Elevation = "0dp",
          {
            TextView,
            layout_width = "-1",
            layout_height = "-1",
            textSize = "14sp",
            paddingRight = "12dp",
            paddingLeft = "12dp",
            Typeface = AppFont.粗体,
            padding = "8dp",
            id = "button",
            textColor = textc,
          }
        }
      }
    };
  };
};

--tladp=LuaAdapter(activity,tool_list_item)

--gv.setAdapter(tladp)

默认提示="点击账号可设置为默认账号，长按账号可 复制Cookies 或 删除账号。（默认账号用于实时便笺，签到会给所有账号签到）\n注：在米游社客户端或在网页端退出登录会导致本软件内登录失效。"

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
    控件隐藏(view.button.getParent())
    view.uid.Text=data[position+1][1]
    view.memo.Text=data[position+1][2]
    if data[position+1][3] then
      波纹({view.button},"方自适应")
      if data[position+1][2]:find("验证码") then
        view.button.onClick=function()
        end
       else
        view.button.onClick=function()
          local url="https://webstatic.mihoyo.com/bbs/event/signin-ys/index.html?bbs_auth_required=true&act_id="..mukactivity.getData("sign_act_id").."&utm_source=bbs&utm_medium=mys&utm_campaign=icon"
          activity.newActivity("web",{
            url,
            nil,
            nil,
            nil,
            "hoyobbscapacha",
            data[position+1][3]
          })
        end
      end
      --[[if data[position+1][2]:find("验证码") then
        控件可见(view.button.getParent())
        view.button.text="验证码"
       elseif tointeger(data[position+1][2]:match("漏签: (.-) 天"))
        if tointeger(data[position+1][2]:match("漏签: (.-) 天"))>=0 then
          控件可见(view.button.getParent())
          view.button.text="手动补签"
        end
      end]]
    end
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