require "import"
import "mods.muk"

import "androidx.core.widget.NestedScrollView"

import "androidx.recyclerview.widget.StaggeredGridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

import "com.michael.*"

import "com.bumptech.glide.request.RequestOptions"

local playerInfo,abyssInfo

playerInfo,abyssInfo,uid=...

playerInfo=JSON.decode(playerInfo).data
abyssInfo=JSON.decode(abyssInfo).data

printLog(nil,data)

activity.Title="查询深渊信息"

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
    {
      LinearLayout;
      layout_width="32dp";
      layout_height="56dp";
      --background=backgroundc;
      gravity="center";
      layout_marginRight="12dp",
      {
        ImageView;
        layout_width="32dp";
        layout_height="32dp";
        padding="4dp";
        ColorFilter=primaryc;
        src=图标("save");
        id="_save";
      };
    };

  };

  {
    NestedScrollView;
    layout_width="-1";
    layout_height="-1";
    fillViewport="true",
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      {
        CardView;
        CardElevation="0dp";
        CardBackgroundColor=backgroundc;
        Radius=parentcardr;
        layout_width="-1";
        layout_height="-1";
        id="main_w",
        {
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          paddingBottom="16dp",
          id="main",
          {
            TextView,
            layout_width="-2",
            layout_height="-2",
            Text=data.role.nickname,
            TextColor=primaryc,
            paddingTop="24dp",
            paddingLeft="24dp",
            Typeface=AppFont.特粗;
            textSize="20sp";
          },
          {
            TextView,
            layout_width="-2",
            layout_height="-2",
            Text="UID: "..uid.." 冒险等级"..playerInfo.role.level,
            TextColor=textc,
            paddingTop="4dp",
            paddingLeft="24dp",
            Typeface=AppFont.标准;
            textSize="14sp";
          },

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius=primarycardr;
            layout_width="-1";
            layout_height="-2";
            layout_margin="8dp";
            layout_marginLeft="24dp";
            layout_marginRight="24dp";
            layout_marginBottom="8dp";
            {
              LinearLayout,
              orientation="vertical",
              --layout_marginTop="20dp",
              layout_width="-1",
              layout_height="-1",
              paddingTop="16dp",
              paddingBottom="16dp",
              {
                TextView;
                text="数据总览",
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                paddingBottom="4dp";
                paddingLeft="16dp",
              };
              {
                LinearLayout,
                layout_width="-1",
                layout_height="-1",
                paddingLeft="8dp",
                paddingRight="8dp",
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.active_day_number),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="活跃天数",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.achievement_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="成就达成",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.avatar_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="获得角色",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.domain_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="解锁秘境",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.way_point_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="解锁传送点",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.luxurious_chest_number),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="华丽宝箱",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.precious_chest_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="珍贵宝箱",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.exquisite_chest_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="精致宝箱",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.common_chest_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="普通宝箱",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.magic_chest_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="奇馈宝箱",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.anemoculus_number),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="风神瞳",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.geoculus_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="岩神瞳",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.electroculus_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="雷神瞳",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.dendroculus_number),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="草神瞳",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.stats.spiral_abyss),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="深境螺旋",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },

              },
            },
          },

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius=primarycardr;
            layout_width="-1";
            layout_height="-2";
            layout_margin="8dp";
            layout_marginLeft="24dp";
            layout_marginRight="24dp";
            layout_marginBottom="8dp";
            {
              LinearLayout,
              orientation="vertical",
              --layout_marginTop="20dp",
              layout_width="-1",
              layout_height="-2",
              paddingTop="16dp",
              paddingBottom="8dp",
              {
                TextView;
                text="世界探索",
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                paddingBottom="4dp";
                paddingLeft="16dp",
              };
              {
                RecyclerView,
                layout_height = "-1",
                layout_width = "-1",
                id="worldgv",
                paddingLeft="8dp",
                paddingRight="8dp",
                NestedScrollingEnabled=false,
                focusableInTouchMode=false,
              },
            },
          },

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius=primarycardr;
            layout_width="-1";
            layout_height="-2";
            layout_margin="8dp";
            layout_marginLeft="24dp";
            layout_marginRight="24dp";
            layout_marginBottom="8dp";
            {
              LinearLayout,
              orientation="vertical",
              --layout_marginTop="20dp",
              layout_width="-1",
              layout_height="-2",
              paddingTop="16dp",
              paddingBottom="16dp",
              {
                TextView;
                text="尘歌壶",
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                paddingBottom="4dp";
                paddingLeft="16dp",
              };
              {
                LinearLayout,
                layout_width="-1",
                layout_height="-1",
                paddingLeft="8dp",
                paddingRight="8dp",
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.homes[1].level),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="信任等阶",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.homes[1].visit_num),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="历史访客",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.homes[1].comfort_num),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="最高洞天仙力",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(homenum),
                    TextColor=textc,
                    paddingTop="4dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="已解锁洞天数",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },
                {
                  LinearLayout,
                  orientation="vertical",
                  layout_width="-1",
                  layout_height="-1",
                  layout_weight="1",
                  gravity="center|top",
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text=tostring(data.homes[1].item_num),
                    TextColor=textc,
                    paddingTop="0dp",
                    Typeface=AppFont.粗体;
                    textSize="18sp";
                  },
                  {
                    TextView,
                    layout_width="-2",
                    layout_height="-2",
                    Text="获得摆设数",
                    TextColor=textc,
                    Typeface=AppFont.标准;
                    textSize="14sp";
                  },
                },
              },
            },
          },

          {
            TextView;
            text="———— 应急食品 ————";
            textColor=stextc;
            textSize="12sp";
            gravity="center";
            Typeface=AppFont.特细;
            id="right",
            layout_width="-1",
            layout_height="-2",
            layout_marginTop="8dp";
          };
        };
      },
    },
  };
}

activity.setContentView(loadlayout(layout))

波纹({fh,_save,_more,_copy},"圆主题")

控件隐藏(right)

--print(dump(tab))

function 获取控件图片(view)
  bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888)
  canvas = Canvas(bitmap)
  view.measure(
  View.MeasureSpec.makeMeasureSpec(
  view.getWidth(), View.MeasureSpec.EXACTLY),
  View.MeasureSpec.makeMeasureSpec(
  view.getHeight(), View.MeasureSpec.EXACTLY)
  );
  view.draw(canvas);
  return bitmap;
end

_save.onClick=function()
  控件可见(right)
  ti=Ticker()
  ti.Period=200
  ti.onTick=function()
    ti.stop()
    local filename="账号信息_"..os.date("%y-%m-%d_%H-%M-%S")..".png"
    保存图片(内置存储("Pictures/MUKGenshinTool/"..filename),获取控件图片(main_w))
    提示("已保存到："..内置存储("Pictures/MUKGenshinTool/"..filename))
    控件隐藏(right)
  end
  ti.start()
end


--[[{
  ["world_explorations"]	= {
      [1]	= {
          ["type"]	= "Offering" ;
          ["cover"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/city_icon/UI_ChapterCover_ChasmsMaw.png" ;
          ["offerings"]	= {
              [1]	= {
                  ["icon"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/city_icon/UI_ChapterOffering_Lumenstone.png" ;
                  ["level"]	= 10 ;
                  ["name"]	= "流明石触媒等级" ;
                  } ;
              } ;
          ["exploration_percentage"]	= 1000 ;
          ["name"]	= "层岩巨渊·地下矿区" ;
          ["parent_id"]	= 6 ;
          ["map_url"]	= "https://webstatic.mihoyo.com/ys/app/interactive-map/index.html?bbs_presentation_style=no_header&lang=zh-cn&_markerFps=24#/map/9?&center=0.00,1.00&zoom=-1.00" ;
          ["background_image"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/city_icon/UI_ChapterBackground_ChasmsMaw.png" ;
          ["inner_icon"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/city_icon/UI_ChapterInnerIcon_ChasmsMaw.png" ;
          ["icon"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/city_icon/UI_ChapterIcon_ChasmsMaw.png" ;
          ["id"]	= 7 ;
          ["level"]	= 10 ;
          ["strategy_url"]	= "https://bbs.mihoyo.com/ys/strategy/channel/map/45/226?bbs_presentation_style=no_header" ;
          } ;]]

local worlditems = {
  LinearLayout,
  layout_width = "-1",
  layout_height = "-2",
  onClick = function()
  end,
  {
    CardView,
    CardElevation = "0dp",
    CardBackgroundColor = cardbackc,
    Radius = "6dp",
    layout_width = "-1",
    layout_height = "-1",
    layout_margin = "8dp",
    {
      ImageView,
      layout_width = "-1",
      layout_height = "-1",
      id="bg",
      scaleType = "centerCrop",
    },
    {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-1",
      padding="8dp",
      paddingBottom="12dp",
      orientation="vertical",
      gravity="center",
      {
        ImageView,
        layout_width = "64dp",
        layout_height = "64dp",
        id="icon",
      },
      {
        TextView,
        id = "worldname",
        textColor = "#ffffff",
        textSize = "14sp",
        gravity = "center",
        Typeface = AppFont.粗体,
        gravity = "center",
        layout_width = "-1",
        layout_height = "-2",
      },
      {
        TextView,
        id = "exploration",
        textColor = "#ffffff",
        textSize = "12sp",
        gravity = "center",
        Typeface = AppFont.标准,
        gravity = "center",
        layout_width = "-2",
        layout_height = "-2",
        paddingTop="2dp",
      },
      {
        LinearLayout,
        layout_width = "-2",
        layout_height = "-2",
        gravity="center|left",
        paddingTop="2dp",
        id="exploration_w",
        {
          ImageView,
          layout_width = "14dp",
          layout_height = "14dp",
          id="icon2",
        },
        {
          TextView,
          id = "name2",
          textColor = "#ffffff",
          textSize = "12sp",
          gravity = "center",
          Typeface = AppFont.标准,
          gravity = "center",
          layout_width = "-2",
          layout_height = "-2",
          paddingLeft="2dp",
        },
      },
      {
        LinearLayout,
        layout_width = "-2",
        layout_height = "-2",
        gravity="center",
        paddingTop="2dp",
        id="Reputation",
        {
          ImageView,
          layout_width = "14dp",
          layout_height = "14dp",
          id="icon3",
        },
        {
          TextView,
          id = "name3",
          textColor = "#ffffff",
          textSize = "12sp",
          gravity = "center",
          Typeface = AppFont.标准,
          gravity = "center",
          layout_width = "-2",
          layout_height = "-2",
          paddingLeft="2dp",
        },
      },
    },
  },
}

data_={}

rholder=function(parent,viewType)
  local views={}
  holder=LuaRecyclerHolder(loadlayout(worlditems,views))
  holder.view.setTag(views)
  return holder
end

worldadp=LuaRecyclerViewAdapter(LuaAdapterCreator({
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

    Glide.with(this).load(adata[3])
    .transform({CenterCrop(), RoundedCorners(dp2px(6))})
    --.apply(RequestOptions.bitmapTransform(RoundedCorners(dp2px(8))))
    --.centerCrop()
    .into(view.bg)
    Glide.with(this).load(adata[1]).into(view.icon)
    view.worldname.text=adata[2]
    view.exploration.text=adata[4]
    if #adata[5]~=0
      Glide.with(this).load(adata[5][1]).into(view.icon2)
      view.name2.text=adata[5][2]
      if adata[2]=="层岩巨渊"
        view.exploration_w.visibility=View.GONE
      end
     else
      view.exploration_w.visibility=View.GONE
    end
    if #adata[6]~=0
      Glide.with(this).load(base64ToBitmap(adata[6][1])).into(view.icon3)
      view.name3.text=adata[6][2]
     else
      view.Reputation.visibility=View.GONE
    end
  end,
}))

worldgv.setAdapter(worldadp)
function 更新adp()
  worldadp.notifyDataSetChanged()
end

local gvmanager=StaggeredGridLayoutManager(2,StaggeredGridLayoutManager.VERTICAL)

worldgv.setLayoutManager(gvmanager)

for i, v in ipairs(data.world_explorations) do
  if #v.offerings~=0 and v.type=="Reputation" then
    data_[#data_+1]={
      v.icon,
      v.name,
      v.cover,
      "探索度: "..tostring(v.exploration_percentage/10).."%",
      {
        v.offerings[1].icon,
        v.offerings[1].name.."等级: "..v.offerings[1].level,
      },
      {
        ("iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAACTUExURUdwTPX19VdXV/v7+wUFBQ0NDQoKCgAAAAwMDAoKCvLy8iIiIgsLCwoKCggICD8/P3BwcMXFxYSEhOfn59fX16SkpJaWluzs7NDQ0LS0tLa2tt/f32dnZzQ0NDMzM////zExMSYmJiwsLOfn52VlZTY2Nk1NTcTExNjY2KmpqT8/P39/f46Ojl1dXZqamm1tbXV1dYXITUEAAAAvdFJOUwD7hP0EXA0BGU/uayo7SHeSx5zm2bCm7tL9vt7u/P/////////////////////+eks6ZgAAAwpJREFUSMfFVtl2ozAMjTHG7GsCWToEm5CwZPv/rxsJQyCdacvDnDN6Sm1fpHutK3e1+j+hG6Zp6JwvO8257lqM+aa+GGBaTqg5vrHw/MrwnPiw1phrrPiygliwpXTvWCZfBDB8Z2NTmoTMW5CiTxCuSXMhUcDcJRlMK9iTy/lUZiny5ksYJ6STVUPWIXN/khavINhCAilvNdk7vsl/SuA7qV0/ZVEU11Lx/r4nXKYB41bmhTwjb+v7FNwESUl9kkWey6Irs/jbFMiYhUl5zRFQyLYhWw158y/4cgMYR8BYwHlIIU412TgWIP7QiuuGAS3tMWBcdlLi+bwSxZ0kMbM8aHXYn4MMz/I9z2LaJqO7ViWAosStpkkaAMTzfdd408YJgkDbrMmRXIcECKh29GhHqQabzlwvBKRRtLaPRwAIWQ0IUTX0eKTZNtrHbwAO6sQJ7L0DKgWAoOCOub4c9d+PgFdJeV9Sv5jC+TnpPoWtPtZU4sXhfFGAgwbifmoJK8z6vWN9G1WSsivV2jrwP7lPN60w6ZOX5b2VPQK6aVeW9AsA2AwykMv9+XicoVURkJ8fj66pCQC0z/4GDimh9f1cCAGcB0AhhahOTYn+fuPQ2yai9TMXUI36PiIwpGivJbTUvCaOIkETPcWoD37+9UtIaCm00ojg+mCbSsyOvX5WqC5a6eXv/to2NspZvY637QSWYrDSkILrYJsDuRZTQbLqnnJCiHY3WEmleLNNfwFgHfhbTkWdaht5T5JmvW2KQRd5u1DSnIUoesWKXP66k8M4pdQkAsZjyLa7wGWR3aN9rSHv/fAA4CQi5f12GuN6Uf1Ay103LH18fOx6afH2YJZuYXMKojoUIWRcyzIbHwAfAYblbA72LOaA+fohVoDe0Nos0q2tSkqieL4eOGr8QyPBTLCmYEG8BdJ2FDpstuz7nnomOQ4lcwrXsxwtomQP48WdrZvG+BBzBVOBM830mXaA9we/qPPXzurvjwvHjPCowDUZw7klDzVzFr6hkwHRYssBK1BB/0f/t/wGEfNrsc3p5ZIAAAAASUVORK5CYII="),
        "声望等级: "..v.level,
      },
    }
   elseif #v.offerings~=0 then
    local offeringname=v.offerings[1].name
    if offeringname:find("等级") then
      offeringname=offeringname..": "
     else
      offeringname=offeringname.."等级: "
    end
    data_[#data_+1]={
      v.icon,
      v.name,
      v.cover,
      "探索度: "..tostring(v.exploration_percentage/10).."%",
      {
        v.offerings[1].icon,
        offeringname..v.offerings[1].level,
      },
      {
      },
    }
   elseif v.type=="Reputation" then
    data_[#data_+1]={
      v.icon,
      v.name,
      v.cover,
      "探索度: "..tostring(v.exploration_percentage/10).."%",
      {
      },
      {
        ("iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAACTUExURUdwTPX19VdXV/v7+wUFBQ0NDQoKCgAAAAwMDAoKCvLy8iIiIgsLCwoKCggICD8/P3BwcMXFxYSEhOfn59fX16SkpJaWluzs7NDQ0LS0tLa2tt/f32dnZzQ0NDMzM////zExMSYmJiwsLOfn52VlZTY2Nk1NTcTExNjY2KmpqT8/P39/f46Ojl1dXZqamm1tbXV1dYXITUEAAAAvdFJOUwD7hP0EXA0BGU/uayo7SHeSx5zm2bCm7tL9vt7u/P/////////////////////+eks6ZgAAAwpJREFUSMfFVtl2ozAMjTHG7GsCWToEm5CwZPv/rxsJQyCdacvDnDN6Sm1fpHutK3e1+j+hG6Zp6JwvO8257lqM+aa+GGBaTqg5vrHw/MrwnPiw1phrrPiygliwpXTvWCZfBDB8Z2NTmoTMW5CiTxCuSXMhUcDcJRlMK9iTy/lUZiny5ksYJ6STVUPWIXN/khavINhCAilvNdk7vsl/SuA7qV0/ZVEU11Lx/r4nXKYB41bmhTwjb+v7FNwESUl9kkWey6Irs/jbFMiYhUl5zRFQyLYhWw158y/4cgMYR8BYwHlIIU412TgWIP7QiuuGAS3tMWBcdlLi+bwSxZ0kMbM8aHXYn4MMz/I9z2LaJqO7ViWAosStpkkaAMTzfdd408YJgkDbrMmRXIcECKh29GhHqQabzlwvBKRRtLaPRwAIWQ0IUTX0eKTZNtrHbwAO6sQJ7L0DKgWAoOCOub4c9d+PgFdJeV9Sv5jC+TnpPoWtPtZU4sXhfFGAgwbifmoJK8z6vWN9G1WSsivV2jrwP7lPN60w6ZOX5b2VPQK6aVeW9AsA2AwykMv9+XicoVURkJ8fj66pCQC0z/4GDimh9f1cCAGcB0AhhahOTYn+fuPQ2yai9TMXUI36PiIwpGivJbTUvCaOIkETPcWoD37+9UtIaCm00ojg+mCbSsyOvX5WqC5a6eXv/to2NspZvY637QSWYrDSkILrYJsDuRZTQbLqnnJCiHY3WEmleLNNfwFgHfhbTkWdaht5T5JmvW2KQRd5u1DSnIUoesWKXP66k8M4pdQkAsZjyLa7wGWR3aN9rSHv/fAA4CQi5f12GuN6Uf1Ay103LH18fOx6afH2YJZuYXMKojoUIWRcyzIbHwAfAYblbA72LOaA+fohVoDe0Nos0q2tSkqieL4eOGr8QyPBTLCmYEG8BdJ2FDpstuz7nnomOQ4lcwrXsxwtomQP48WdrZvG+BBzBVOBM830mXaA9we/qPPXzurvjwvHjPCowDUZw7klDzVzFr6hkwHRYssBK1BB/0f/t/wGEfNrsc3p5ZIAAAAASUVORK5CYII="),
        "声望等级: "..v.level,
      },
    }
   else
    data_[#data_+1]={
      v.icon,
      v.name,
      v.cover,
      "探索度: "..tostring(v.exploration_percentage/10).."%",
      {
      },
      {
      },
    }
  end
end
更新adp()

worldgv.requestLayout()

function 分屏()
  local giwidth=tointeger((activity.width-dp2px(24*2+16*2))/dp2px(128))


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