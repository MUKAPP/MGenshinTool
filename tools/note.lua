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

activity.Title="实时便笺"

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

波纹({fh},"圆主题")


tool_list_item={
  LinearLayout;
  layout_width="-1";
  layout_height="-2";
  onClick=function()end;
  {--原粹树脂 实时便笺
    CardView;
    CardElevation="0dp";
    CardBackgroundColor=cardbackc;
    Radius="8dp";
    layout_width="-1";
    layout_height="-2";
    layout_margin="8dp";
    {
      LinearLayout,
      orientation="vertical",
      --layout_marginTop="20dp",
      layout_width="-1",
      layout_height="-2",

      {
        LinearLayout,
        layout_width="-1",
        layout_height="-2",
        paddingBottom="8dp",
        orientation="vertical",
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
          paddingBottom="7dp";
          id="memo",
        };
        {
          LinearLayout,
          layout_width="-1",
          layout_height="-1",
          orientation="vertical",
          id="memo_in",
          {
            CardView;
            layout_width="-1";
            layout_height="-2";
            radius="6dp";
            background=cardbackc;
            layout_marginTop="8dp";
            layout_marginRight="16dp";
            layout_marginBottom="4dp";
            layout_marginLeft="16dp",
            Elevation="0";
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              {
                TextView;
                text="原粹树脂",
                textColor=textc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.粗体;
                paddingLeft="12dp";
                paddingTop="8dp",
                layout_width="-1",
                layout_height="-1",
                id="strength_num",
              };
              {
                TextView;
                text="恢复时间",
                textColor=stextc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.标准;
                paddingLeft="12dp";
                paddingBottom="8dp",
                layout_width="-1",
                layout_height="-1",
                id="strength_time",
              };
            },
          },
          {
            CardView;
            layout_width="-1";
            layout_height="-2";
            radius="6dp";
            background=cardbackc;
            layout_marginTop="4dp";
            layout_marginRight="16dp";
            layout_marginBottom="4dp";
            layout_marginLeft="16dp",
            Elevation="0";
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              {
                TextView;
                text="每日委托",
                textColor=textc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.粗体;
                paddingLeft="12dp";
                paddingTop="8dp",
                paddingBottom="8dp",
                layout_width="-1",
                layout_height="-1",
                id="task_num",
              };
            },
          },
          {
            CardView;
            layout_width="-1";
            layout_height="-2";
            radius="6dp";
            background=cardbackc;
            layout_marginTop="4dp";
            layout_marginRight="16dp";
            layout_marginBottom="4dp";
            layout_marginLeft="16dp",
            Elevation="0";
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              {
                TextView;
                text="探索派遣",
                textColor=textc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.粗体;
                paddingLeft="12dp";
                paddingTop="8dp",
                layout_width="-1",
                layout_height="-1",
                id="expedition_num",
              };
              {
                TextView;
                text="剩余时间",
                textColor=stextc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.标准;
                paddingLeft="12dp";
                paddingBottom="8dp",
                layout_width="-1",
                layout_height="-1",
                id="expedition_time",
              };
            },
          },
          {
            LinearLayout,
            layout_width="-1",
            layout_height="-2",
            {
              CardView;
              layout_width="-1";
              layout_height="-2";
              layout_weight="1",
              radius="6dp";
              background=cardbackc;
              layout_marginTop="4dp";
              layout_marginRight="4dp";
              layout_marginBottom="8dp";
              layout_marginLeft="16dp",
              Elevation="0";
              {
                LinearLayout,
                layout_width="-1",
                layout_height="-1",
                orientation="vertical",
                {
                  TextView;
                  text="洞天宝钱",
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  Typeface=AppFont.粗体;
                  paddingLeft="12dp";
                  paddingTop="8dp",
                  paddingBottom="8dp",
                  layout_width="-1",
                  layout_height="-1",
                  id="coin_num",
                };
              },
            },
            {
              CardView;
              layout_width="-1";
              layout_height="-2";
              layout_weight="1",
              radius="6dp";
              background=cardbackc;
              layout_marginTop="4dp";
              layout_marginRight="16dp";
              layout_marginBottom="8dp";
              layout_marginLeft="4dp",
              Elevation="0";
              {
                LinearLayout,
                layout_width="-1",
                layout_height="-1",
                orientation="vertical",
                {
                  TextView;
                  text="周本减半",
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  Typeface=AppFont.粗体;
                  paddingLeft="12dp";
                  paddingTop="8dp",
                  paddingBottom="8dp",
                  layout_width="-1",
                  layout_height="-1",
                  id="discount_num",
                };
              },
            },
          },
          {
            CardView,
            layout_width = "-1",
            layout_height = "-2",
            radius = "6dp",
            background = cardbackc,
            layout_marginTop = "4dp",
            layout_marginRight = "16dp",
            layout_marginBottom = "4dp",
            layout_marginLeft = "16dp",
            Elevation = "0",
            {
              LinearLayout,
              layout_width = "-1",
              layout_height = "-1",
              orientation = "vertical",
              paddingBottom = "8dp",
              {
                TextView,
                text = "参量质变仪",
                textColor = textc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.粗体,
                paddingLeft = "12dp",
                paddingTop = "8dp",
                layout_width = "-1",
                layout_height = "-1",
                id = "transformer_num"
              },
              {
                TextView,
                text = "剩余时间",
                textColor = stextc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.标准,
                paddingLeft = "12dp",
                layout_width = "-1",
                layout_height = "-1",
                id = "transformer_time"
              }
            }
          },
        },
      },

    },
  },

};

function getNewDS(q,b)
  local b=b or ""
  local q=q or ""

  local i = tostring(tointeger(os.time()))

  local r = tostring(math.random(100000, 200000))

  local c = string.lower(MD5("salt=xV8v4Qu54lUKrEYFZkJhB8cuOh9Asafs&t="..i.."&r="..r.."&b="..b.."&q="..q))
  return i..","..r..","..c
end

function secondtostring(n)
  local day
  local dif=tointeger(os.date("%d",os.time()+n))-tointeger(os.date("%d"))
  if dif~=0 then
    if dif==1 then
      day="明天 "
     elseif dif==2 then
      day="后天 "
     else
      day=tostring(os.date("%m月%d日 ",os.time()+n))
    end
   else
    day="今天 "
  end
  return day..os.date("%H时%M分",os.time()+n)
end

function addt(name,cookie)

  Http.get("https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
  cookie,nil,nil,
  function(code,content)
    if code~=200 then
      data_[#data_+1]={"error","获取失败："..code}
      更新adp()
      return true
    end

    local content=JSON.decode(content)

    if content.message~="OK" then
      data_[#data_+1]={"error","获取失败："..content.message}
      更新adp()
      return true
    end

    for i=1,#content.data.list do
      local serverid=content.data.list[i].region
      local uid=content.data.list[i].game_uid

      local ds=getNewDS("role_id="..uid.."&server="..serverid)

      --print(ds)

      local map = HashMap()
      map.put("DS",ds)
      map.put("Origin","https://webstatic.mihoyo.com")
      map.put("x-rpc-app_version","2.11.1")
      map.put("User-Agent","Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBS/2.11.1")
      map.put("x-rpc-client_type","5")
      map.put("Referer","https://webstatic.mihoyo.com/")
      --map.put("x-rpc-device_id",string.upper(tostring(UUID.randomUUID()):gsub("%-","")))
      map.put("X-Requested-With","com.mihoyo.hyperion")

      Http.get("https://api-takumi-record.mihoyo.com/game_record/app/genshin/api/dailyNote?server="..serverid.."&role_id="..uid,
      cookie,nil,map,
      function(code,content,_,header)
        if code~=200 then
          --("请求失败，错误码："..code)
          data_[#data_+1]={"error","获取失败："..code}
          return true
        end

        local content=JSON.decode(content)

        if content.message=="OK" then

          local data=content.data

          local strength_num="原粹树脂 "..data.current_resin.."/"..data.max_resin
          local strength_time
          if data.resin_recovery_time=="0" then
            strength_time="树脂溢出了呜呜呜"
           else
            strength_time="将于 "..secondtostring(tointeger(data.resin_recovery_time)).." 全部恢复"
          end
          local task_num="每日委托 "..data.finished_task_num.."/"..data.total_task_num
          local expedition_num="探索派遣 "..data.current_expedition_num.."/"..data.max_expedition_num

          local expedition_stime=0

          for i,v in pairs(data.expeditions) do
            if tointeger(v.remained_time)>expedition_stime then
              expedition_stime=tointeger(v.remained_time)
            end
          end

          local expedition_time
          if expedition_stime==0 then
            expedition_time="派遣已经全部完成了"
           else
            expedition_time="将于 "..secondtostring(tointeger(expedition_stime)).." 全部完成"
          end
          local coin_num="洞天宝钱\n"..data.current_home_coin.."/"..data.max_home_coin
          local discount_num="周本减半\n"..data.remain_resin_discount_num.."/"..data.resin_discount_num_limit

          local transformer_num
          local transformer_time=""
          local transformer_time_visible
          if data.transformer.obtained
            if data.transformer.recovery_time.reached
              transformer_num = "参量质变仪 可使用"
              transformer_time_visible=View.GONE
             else
              transformer_num = "参量质变仪 "
              local transformertime=data.transformer.recovery_time
              transformer_time = "将在 "..transformertime.Day.."天 后恢复"
              transformer_time_visible=View.VISIBLE
            end
           else
            transformer_num = "参量质变仪 未获得"
            transformer_time_visible=View.GONE
          end

          data_[#data_+1]={
            strength_num,
            strength_time,
            task_num,
            expedition_num,
            expedition_time,
            coin_num,
            discount_num,
            "UID："..uid,
            transformer_num,
            transformer_time,
            transformer_time_visible,
          }
          更新adp()
         else
          data_[#data_+1]={
            "原粹树脂",
            "恢复时间",
            "每日委托",
            "探索派遣",
            "剩余时间",
            "洞天宝钱",
            "周本减半",
            "获取失败",
            "参量质变仪",
            "剩余时间",
            View.GONE,
          }

          if content.message:find("not public") then
            data_[#data_+1]={"error","获取失败："..content.message.."\n请到米游社内找到 我的-我的角色-实时便笺 开启实时便笺功能"}
            更新adp()
            return true
          end
          data_[#data_+1]={"error","获取失败："..content.message}
          更新adp()
        end
      end)
    end

  end)

end

data_={}

function 更新()
  data_={}

  local data2={}
  xpcall(function()
    data2=JSON.decode(mukactivity.getData("myscookies"))
    end,function(e)
    mukactivity.setData("myscookies",JSON.encode({}))
    data2=JSON.decode(mukactivity.getData("myscookies"))
  end)

  for i,v in pairs(data2) do
    addt(i,v)
  end
end

rholder=function(parent,viewType)
  local views={}
  holder=LuaRecyclerHolder(loadlayout(tool_list_item,views))
  holder.view.setTag(views)
  return holder
end

adp=LuaRecyclerViewAdapter(LuaAdapterCreator({
  getItemCount=function()
    return #data_
  end,
  getItemViewType=function(position)
    return 0
  end,
  onCreateViewHolder=rholder,
  onBindViewHolder=function(holder,position)
    view=holder.view.getTag()
    local adata=data_[position+1]
    if adata[1]=="error" then
      控件隐藏(view.memo_in)
      控件可见(view.memo)
      view.memo.Text=adata[2]
     else
      控件可见(view.memo_in)
      控件隐藏(view.memo)
      view.strength_num.Text=adata[1]
      view.strength_time.Text=adata[2]
      view.task_num.Text=adata[3]
      view.expedition_num.Text=adata[4]
      view.expedition_time.Text=adata[5]
      view.coin_num.Text=adata[6]
      view.discount_num.Text=adata[7]
      view.uid.Text=adata[8]
      printLog(nil,adata)
      view.transformer_num.Text=adata[9]
      view.transformer_time.Text=adata[10]
      view.transformer_time.visibility=adata[11]
    end

  end,
}))

rv.setAdapter(adp)
function 更新adp()
  adp.notifyDataSetChanged()
end

local gvmanager=GridLayoutManager(activity,1)
.setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup{
  getSpanSize=function(position)
    return int(1)
  end
}))

rv.setLayoutManager(gvmanager)

更新()

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