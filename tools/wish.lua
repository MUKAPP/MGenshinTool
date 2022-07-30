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

activity.Title = "抽卡模拟器"

if (screenY / screenX) > (1920 / 1080) then
  --screenp=状态栏高度
  screenp = 0
else
  screenp = 0
end

_height = (activity.Width - dp2px(16 * 2)) / 682 * 1312

function onCreate()
  local layout = {
    RelativeLayout,
    layout_height = "-1",
    layout_width = "-1",
    background = backgroundc,
    {
      LinearLayout,
      layout_height = "-1",
      layout_width = "-1",
      orientation = "vertical",
      {
        LinearLayout, --标题栏
        orientation = "horizontal",
        layout_height = "56dp",
        id = "mActionBar",
        layout_width = "-1",
        background = barbackgroundc,
        gravity = "center|left",
        paddingLeft = screenp,
        paddingRight = screenp,
        {
          LinearLayout,
          orientation = "horizontal",
          layout_height = "56dp",
          layout_width = "56dp",
          gravity = "center",
          {
            ImageView,
            ColorFilter = primaryc,
            src = 图标("arrow_back"),
            layout_height = "32dp",
            layout_width = "32dp",
            padding = "4dp",
            id = "back",
            onClick = function()
              activity.finishAfterTransition()
            end
          }
        },
        {
          TextView, --标题
          Typeface = AppFont.特粗,
          textSize = "20sp",
          Text = "抽卡模拟器",
          textColor = primaryc,
          paddingLeft = "16dp",
          id = "title_a"
        }
      },
      {
        RecyclerView,
        layout_height = "-1",
        layout_width = "-1",
        paddingLeft = screenp,
        paddingRight = screenp,
        id = "rv"
      }
    }
  }

  activity.setContentView(loadlayout(layout))

  波纹({back}, "圆主题")
  波纹({weaponlay, characterlay, indefinitelay}, "方自适应")

  function WishDir(n)
    if n then
      return tostring(activity.getExternalFilesDir("Wish")) .. "/" .. n
    else
      return tostring(activity.getExternalFilesDir("Wish"))
    end
  end

  if 文件是否存在(WishDir()) == false then
    创建文件夹(WishDir())
  end
  if 文件是否存在(WishDir("src")) == false then
    创建文件夹(WishDir("src"))
  end

  gacha_200 = {
    LinearLayout,
    layout_width = "-1",
    layout_height = "-2",
    {
      CardView,
      CardElevation = "0dp",
      CardBackgroundColor = cardbackc,
      Radius = "8dp",
      layout_width = "-1",
      layout_height = _height,
      layout_margin = "8dp",
      {
        ImageView,
        layout_width = "-1",
        layout_height = "-1",
        id = "gacha_200_img",
        scaleType = "centerCrop"
      },
      {
        ImageView,
        layout_width = "-1",
        layout_height = "-1",
        id = "gacha_200_img_4star",
        scaleType = "fitCenter",
        gravity = "right|center"
      },
      {
        LinearLayout,
        orientation = "vertical",
        --layout_marginTop="20dp",
        layout_width = "-1",
        layout_height = "-2",
        paddingLeft = "16dp",
        paddingTop = "24dp",
        {
          TextView,
          textSize = "24sp",
          text = "标题",
          gravity = "center",
          layout_width = "-1",
          layout_height = "-2",
          id = "title"
        },
        {
          TextView,
          textSize = "16sp",
          text = "描述",
          gravity = "center",
          layout_width = "-1",
          layout_height = "-2",
          id = "desc"
        },
        {
          TextView,
          textColor = primaryc,
          textSize = "8sp",
          --Typeface=AppFont.特粗;
          text = "--------------------------------",
          gravity = "center",
          layout_width = "-1",
          layout_height = "-2",
          paddingTop = "8dp",
          paddingBottom = "8dp"
        },
        {
          TextView,
          textSize = "14sp",
          text = "池",
          gravity = "center",
          layout_width = "-1",
          layout_height = "-2",
          id = "pool"
        }
      }
    }
  }

  local all_type = {
    ["character"] = "角色活动祈愿",
    ["character_1"] = "角色活动祈愿-1",
    ["character_2"] = "角色活动祈愿-2",
    ["weapon"] = "武器活动祈愿",
    ["beginner"] = "初行者推荐祈愿",
    ["standard"] = "常驻祈愿"
  }

  --各个版本
  local all_ver = {
    {
      version = "1.0上",
      pools = {
        {
          name = "杯装之诗",
          type = "character_1",
          aid = "A019",
          char5star = "Venti",
           --温迪
          char4star = {
            "Barbara",
             --芭芭拉
            "Fischl",
             --菲谢尔
            "Xiangling"
           --香菱
          }
        },
        {
          type = "weapon",
          aid = "A020",
          weapon5star = {
            "Sword_Falcon",
             --风鹰剑
            "Bow_Amos"
           --阿莫斯之弓
          },
          weapon4star = {
            "Sword_Troupe",
             --笛剑
            "Claymore_Troupe",
             --钟剑
            "Bow_Troupe",
             --绝弦
            "Pole_Zephyrus",
             --西风长枪
            "Catalyst_Troupe"
           --流浪乐章
          }
        }
      }
    },
    {
      version = "1.0下",
      pools = {
        {
          name = "闪焰的驻足",
          type = "character_1",
          aid = "A018",
          char5star = "Klee",
           --可莉
          char4star = {
            "Noel",
             --诺艾尔
            "Sucrose",
             --砂糖
            "Xingqiu"
           --行秋
          }
        },
        {
          type = "weapon",
          aid = "A020",
          weapon5star = {
            "Catalyst_Fourwinds",
             --四风原典
            "Claymore_Wolfmound"
           --狼的末路
          },
          weapon4star = {
            "Claymore_Fossil",
             --祭礼大剑
            "Sword_Fossil",
             --祭礼剑
            "Bow_Fossil",
             --祭礼弓
            "Catalyst_Fossil",
             --祭礼残章
            "Pole_Stardust"
           --匣里灭辰
          }
        }
      }
    }
  }

  data_ = {}

  for i = 1, #all_ver do
    local ver = all_ver[i]
    local ver_data = {}
    for j = 1, #ver.pools do
      local pool = ver.pools[j]
      local pool_data = {}
      if pool.type == "character" then
        for k = 1, #pool.char5star do
          local char5star = pool.char5star[k]
          local char5star_data = {}
          char5star_data.name = char5star
          char5star_data.type = pool.type
          char5star_data.aid = pool.aid
          char5star_data.img = WishDir("src/" .. char5star .. ".png")
          char5star_data.img_4star = WishDir("src/" .. char5star .. "_4star.png")
          table.insert(pool_data, char5star_data)
        end
        for k = 1, #pool.char4star do
          local char4star = pool.char4star[k]
          local char4star_data = {}
          char4star_data.name = char4star
          char4star_data.type = pool.type
          char4star_data.aid = pool.aid
          char4star_data.img = WishDir("src/" .. char4star .. ".png")
          char4star_data.img_4star = WishDir("src/" .. char4star .. "_4star.png")
          table.insert(pool_data, char4star_data)
        end
      elseif pool.type == "weapon" then
        for k = 1, #pool.weapon5star do
          local weapon5star = pool.weapon5star[k]
          local weapon5star_data = {}
          weapon5star_data.name = weapon5star
          weapon5star_data.type = pool.type
          weapon5star_data.aid = pool.aid
          weapon5star_data.img = WishDir("src/" .. weapon5star .. ".png")
          weapon5star_data.img_4star = WishDir("src/" .. weapon5star .. "_4star.png")
          table.insert(pool_data, weapon5star_data)
        end
        for k = 1, #pool.weapon4star do
          local weapon4star = pool.weapon4star[k]
          local weapon4star_data = {}
          weapon4star_data.name = weapon4star
          weapon4star_data.type = pool.type
          weapon4star_data.aid = pool.aid
          weapon4star_data.img = WishDir("src/" .. weapon4star .. ".png")
          weapon4star_data.img_4star = WishDir("src/" .. weapon4star .. "_4star.png")
          table.insert(pool_data, weapon4star_data)
        end
      end
      pool_data.name = pool.name
      pool_data.type = pool.type
      pool_data.aid = pool.aid
      table.insert(ver_data, pool_data)
    end
    ver_data.version = ver.version
    table.insert(data_, ver_data)
  end

  print(dump(data_))

  adp =
    LuaRecyclerViewAdapter(
    LuaAdapterCreator(
      {
        getItemCount = function()
          return #data_
        end,
        getItemViewType = function(position)
          return 0
        end,
        onCreateViewHolder = function(parent, viewType)
          local views = {}
          holder = LuaRecyclerHolder(loadlayout(gacha_200, views))
          holder.view.setTag(views)
          return holder
        end,
        onBindViewHolder = function(holder, position)
          view = holder.view.getTag()
        end
      }
    )
  )

  rv.setAdapter(adp)

  function 更新adp()
    adp.notifyDataSetChanged()
  end

  local gvmanager =
    GridLayoutManager(activity, 1).setSpanSizeLookup(
    LuaSpanSizeLookup(
      luaSpanSizeLookup {
        getSpanSize = function(position)
          return int(1)
        end
      }
    )
  )

  rv.setLayoutManager(gvmanager)

  分屏()
end

function 分屏()
  local function setWidth(v, n)
    linearParams = v.getLayoutParams()
    linearParams.width = n
    v.setLayoutParams(linearParams)
  end

  local function setHeight(v, n)
    linearParams = v.getLayoutParams()
    linearParams.height = n
    v.setLayoutParams(linearParams)
  end

  if activity.Height * 0.9 < activity.Width then
    --横屏
    setHeight(mActionBar, dp2px(48))
  else
    setHeight(mActionBar, dp2px(56))
  end
end

function onConfigurationChanged(newConfig)
  分屏()
end
