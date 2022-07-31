require "import"

local _debug_last_clock=os.clock()
local _debug_last_name="openapp"

local function _debug_clock(name)
  if 开发者模式 == "true" then
    local ch=string.format("%.6f",os.clock()-_debug_last_clock).."s"
    printLog("_debug_clock",_debug_last_name.." → "..name,ch)
    _debug_last_clock=os.clock()
    _debug_last_name=name
  end
end

import "android.os.Build"
import "android.content.Intent"
import "android.content.ComponentName"

import "com.mukapp.CalendarUtils"

import "mods.muk"

_debug_clock("import_1")

import "androidx.recyclerview.widget.GridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

import "com.mukapp.observablescrollview.*"
import "com.michael.*"

import "jp.wasabeef.glide.transformations.BlurTransformation"

import "mods.tanutai"

_debug_clock("import_end")

local subtitle,
intentstr = ...
if subtitle == "" or subtitle == nil then
  subtitle = "给时光以生命，给岁月以文明。"
end

if mukactivity.getData("guide_done") == nil then
  activity.newActivity("guide")
  activity.finish()
  return true
end

function onCreate()
  _debug_clock("oncreate_start")
  xpcall(
  function()
    状态栏颜色(0xFF424242)
    activity.getWindow().addFlags(
    WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION
    )
    沉浸状态栏(true)

    导航栏高度2 = 导航栏高度
    if Boolean.valueOf(mukactivity.getData("Navigation_Bar_Height")) == false then
      导航栏高度 = 0
    end

    function 返回顶部()
      local scrollYu = ObjectAnimator.ofInt(obs_1, "scrollY", {obs_1.scrollY, 0})
      scrollYu.setDuration(512)
      scrollYu.setInterpolator(DecelerateInterpolator())
      scrollYu.start()
    end

    function 返回底部()
      local scrollYu =
      ObjectAnimator.ofInt(obs_1, "scrollY", {obs_1.scrollY, activity.Height * 0.618 - dp2px(56 - 8) - 状态栏高度})
      scrollYu.setDuration(512)
      scrollYu.setInterpolator(AccelerateDecelerateInterpolator())
      scrollYu.start()
    end
    _debug_clock("setContentView_start")

    local obs_global

    local layout = {
      RelativeLayout,
      layout_height = "-1",
      layout_width = "-1",
      id = "groot",
      {
        LinearLayout,
        layout_height = "-1",
        layout_width = "-1",
        id = "_root",
        orientation = "vertical",
        {
          RelativeLayout,
          layout_height = "-1",
          layout_width = "-1",
          background = backgroundc,
          {
            RelativeLayout,
            layout_height = "-1",
            layout_width = "-1",
            {
              ImageView,
              layout_height = "-1",
              layout_width = "-1",
              --src=themebackground;
              scaleType = "centerCrop",
              id = "pho_full"
              --colorFilter=viewshaderc;
            },
            {
              ImageView,
              layout_height = "-1",
              layout_width = "-1",
              scaleType = "centerCrop",
              id = "pho_full_blur1"
              --colorFilter=viewshaderc;
            },
            {
              ImageView,
              layout_height = "-1",
              layout_width = "-1",
              scaleType = "centerCrop",
              id = "pho_full_blur2"
              --colorFilter=viewshaderc;
            },
            {
              ImageView,
              layout_height = "-1",
              layout_width = "-1",
              scaleType = "centerCrop",
              id = "pho_full_blur"
              --colorFilter=viewshaderc;
            },
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              id = "pho_full_z"
            },
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              id = "pho_full_filter"
            }
          },
          {
            LinearLayout,
            layout_height = "-1",
            layout_width = "-1",
            orientation = "vertical",
            {
              PageView,
              layout_height = "-1",
              layout_width = "-1",
              layout_weight = "1",
              id = "jc",
              --currentItem=1;
              pages = {
                {
                  RelativeLayout,
                  layout_width = "-1",
                  layout_height = "-1",
                  {
                    ObservableScrollView,
                    layout_width = "-1",
                    layout_height = "-1",
                    id = "obs_1",
                    overScrollMode = 2,
                    verticalScrollBarEnabled = false,
                    onGlobalLayout = function()
                      --print(a)
                      if obs_global == nil then
                        scrollYEvent(1.0)
                        obs_global = true
                      end
                    end,
                    {
                      RelativeLayout,
                      layout_height = "-1",
                      layout_width = "-1",
                      paddingBottom = dp2px(136) + 导航栏高度,
                      {
                        RelativeLayout,
                        layout_height = activity.Height - dp2px(8) - 状态栏高度,
                        layout_width = "-1",
                        --background=primaryc;
                        layout_marginTop = activity.Height * 0.618,
                        id = "dym1"
                      },
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        {
                          RelativeLayout,
                          layout_height = "61.8%h",
                          layout_width = "-1",
                          layout_marginBottom = "8dp",
                          id = "dym2",
                          --background=backgroundc;
                          {
                            ImageView,
                            layout_height = "-1",
                            layout_width = "-1",
                            --src=themebackground;
                            scaleType = "centerCrop",
                            id = "pho_top"
                            --colorFilter=viewshaderc;
                          },
                          {
                            ImageView,
                            layout_height = "-1",
                            layout_width = "-1",
                            scaleType = "centerCrop",
                            id = "pho_top_blur1"
                            --colorFilter=viewshaderc;
                          },
                          {
                            ImageView,
                            layout_height = "-1",
                            layout_width = "-1",
                            scaleType = "centerCrop",
                            id = "pho_top_blur2"
                            --colorFilter=viewshaderc;
                          },
                          {
                            ImageView,
                            layout_height = "-1",
                            layout_width = "-1",
                            scaleType = "centerCrop",
                            id = "pho_top_blur"
                            --colorFilter=viewshaderc;
                          },
                          {
                            LinearLayout,
                            layout_height = "-1",
                            layout_width = "-1",
                            id = "pho_top_z"
                          },
                          {
                            LinearLayout,
                            layout_height = "-1",
                            layout_width = "-1",
                            id = "pho_top_filter",
                            background = backgroundc
                          }
                        },
                        {
                          --原粹树脂 实时便笺
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "8dp",
                          layout_marginLeft = "16dp",
                          layout_marginRight = "16dp",
                          layout_marginBottom = "16dp",
                          {
                            LinearLayout,
                            orientation = "vertical",
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-2",
                            id = "strength_p",
                            {
                              LinearLayout,
                              layout_width = "-1",
                              layout_height = "-2",
                              paddingBottom = "8dp",
                              orientation = "vertical",
                              {
                                TextView,
                                text = "实时便笺",
                                textColor = primaryc,
                                textSize = "16sp",
                                gravity = "center|left",
                                Typeface = AppFont.特粗,
                                padding = "16dp",
                                paddingBottom = "0",
                                layout_width = "-1",
                                layout_height = "-2"
                                --id="strength",
                              },
                              {
                                TextView,
                                text = "正在获取",
                                textColor = textc,
                                textSize = "14sp",
                                gravity = "center|left",
                                Typeface = AppFont.标准,
                                paddingTop = "4dp",
                                paddingLeft = "16dp",
                                paddingRight = "16dp",
                                layout_width = "-1",
                                layout_height = "-2",
                                paddingBottom = "7dp",
                                id = "memo"
                              },
                              {
                                LinearLayout,
                                layout_width = "-1",
                                layout_height = "-1",
                                orientation = "vertical",
                                id = "memo_in",
                                {
                                  CardView,
                                  layout_width = "-1",
                                  layout_height = "-2",
                                  radius = "6dp",
                                  background = cardbackc,
                                  layout_marginTop = "8dp",
                                  layout_marginRight = "16dp",
                                  layout_marginBottom = "4dp",
                                  layout_marginLeft = "16dp",
                                  Elevation = "0",
                                  {
                                    LinearLayout,
                                    layout_width = "-1",
                                    layout_height = "-1",
                                    orientation = "vertical",
                                    {
                                      TextView,
                                      text = "原粹树脂",
                                      textColor = textc,
                                      textSize = "14sp",
                                      gravity = "center|left",
                                      Typeface = AppFont.粗体,
                                      paddingLeft = "12dp",
                                      paddingTop = "8dp",
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      id = "strength_num"
                                    },
                                    {
                                      TextView,
                                      text = "恢复时间",
                                      textColor = stextc,
                                      textSize = "14sp",
                                      gravity = "center|left",
                                      Typeface = AppFont.标准,
                                      paddingLeft = "12dp",
                                      paddingBottom = "8dp",
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      id = "strength_time"
                                    }
                                  }
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
                                    {
                                      TextView,
                                      text = "每日委托",
                                      textColor = textc,
                                      textSize = "14sp",
                                      gravity = "center|left",
                                      Typeface = AppFont.粗体,
                                      paddingLeft = "12dp",
                                      paddingTop = "8dp",
                                      paddingBottom = "8dp",
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      id = "task_num"
                                    }
                                  }
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
                                    {
                                      TextView,
                                      text = "探索派遣",
                                      textColor = textc,
                                      textSize = "14sp",
                                      gravity = "center|left",
                                      Typeface = AppFont.粗体,
                                      paddingLeft = "12dp",
                                      paddingTop = "8dp",
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      id = "expedition_num"
                                    },
                                    {
                                      TextView,
                                      text = "剩余时间",
                                      textColor = stextc,
                                      textSize = "14sp",
                                      gravity = "center|left",
                                      Typeface = AppFont.标准,
                                      paddingLeft = "12dp",
                                      paddingBottom = "8dp",
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      id = "expedition_time"
                                    }
                                  }
                                },
                                {
                                  LinearLayout,
                                  layout_width = "-1",
                                  layout_height = "-2",
                                  {
                                    CardView,
                                    layout_width = "-1",
                                    layout_height = "-2",
                                    layout_weight = "1",
                                    radius = "6dp",
                                    background = cardbackc,
                                    layout_marginTop = "4dp",
                                    layout_marginRight = "4dp",
                                    layout_marginBottom = "8dp",
                                    layout_marginLeft = "16dp",
                                    Elevation = "0",
                                    {
                                      LinearLayout,
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      orientation = "vertical",
                                      {
                                        TextView,
                                        text = "洞天宝钱",
                                        textColor = textc,
                                        textSize = "14sp",
                                        gravity = "center|left",
                                        Typeface = AppFont.粗体,
                                        paddingLeft = "12dp",
                                        paddingTop = "8dp",
                                        paddingBottom = "8dp",
                                        layout_width = "-1",
                                        layout_height = "-1",
                                        id = "coin_num"
                                      }
                                    }
                                  },
                                  {
                                    CardView,
                                    layout_width = "-1",
                                    layout_height = "-2",
                                    layout_weight = "1",
                                    radius = "6dp",
                                    background = cardbackc,
                                    layout_marginTop = "4dp",
                                    layout_marginRight = "16dp",
                                    layout_marginBottom = "8dp",
                                    layout_marginLeft = "4dp",
                                    Elevation = "0",
                                    {
                                      LinearLayout,
                                      layout_width = "-1",
                                      layout_height = "-1",
                                      orientation = "vertical",
                                      {
                                        TextView,
                                        text = "周本减半",
                                        textColor = textc,
                                        textSize = "14sp",
                                        gravity = "center|left",
                                        Typeface = AppFont.粗体,
                                        paddingLeft = "12dp",
                                        paddingTop = "8dp",
                                        paddingBottom = "8dp",
                                        layout_width = "-1",
                                        layout_height = "-1",
                                        id = "discount_num"
                                      }
                                    }
                                  }
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
                              }
                            }
                          },
                          {
                            LinearLayout,
                            orientation = "horizontal",
                            layout_height = "-2",
                            layout_width = "-1",
                            gravity = "right|center",
                            padding = "8dp",
                            paddingTop = "10dp",
                            {
                              ImageView,
                              ColorFilter = primaryc,
                              src = 图标("swap_horiz"),
                              layout_height = "32dp",
                              layout_width = "32dp",
                              padding = "4dp",
                              layout_marginRight = "4dp",
                              id = "switch_memo"
                            },
                            {
                              ImageView,
                              ColorFilter = primaryc,
                              src = 图标("keyboard_arrow_right"),
                              layout_height = "32dp",
                              layout_width = "32dp",
                              padding = "4dp"
                            }
                          }
                        },
                        {
                          --今日素材
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "0dp",
                          layout_marginLeft = "16dp",
                          layout_marginRight = "16dp",
                          layout_marginBottom = "16dp",
                          {
                            LinearLayout,
                            orientation = "vertical",
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            id = "daily",
                            onClick = function(view)
                              local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
                              path = activity.getLuaDir() .. "/tools/daily.lua"
                              intent.setData(Uri.parse("file://" .. path))
                              xpcall(
                              function()
                                activity.startActivity(
                                intent,
                                ActivityOptions.makeClipRevealAnimation(
                                view,
                                0,
                                0,
                                view.getWidth(),
                                view.getHeight()
                                ).toBundle()
                                )
                              end,
                              function()
                                xpcall(
                                function()
                                  activity.newActivity("tools/daily")
                                end,
                                function(e)
                                  提示("打开失败：" .. e)
                                  printLog("Error 1", e)
                                end
                                )
                              end
                              )
                            end
                          },
                          {
                            LinearLayout,
                            orientation = "vertical",
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            paddingBottom = "16dp",
                            {
                              TextView,
                              text = "今日素材",
                              textColor = primaryc,
                              textSize = "16sp",
                              gravity = "center|left",
                              Typeface = AppFont.特粗,
                              padding = "16dp",
                              paddingBottom = "0",
                              layout_width = "-1",
                              layout_height = "-2"
                            },
                            {
                              TextView,
                              text = "天赋突破素材",
                              textColor = primaryc,
                              textSize = "14sp",
                              gravity = "center|left",
                              Typeface = AppFont.特粗,
                              paddingTop = "8dp",
                              paddingLeft = "16dp",
                              layout_width = "-1",
                              layout_height = "-2",
                              paddingBottom = "8dp"
                            },
                            {
                              RecyclerView,
                              layout_width = "-1",
                              layout_height = "-2",
                              horizontalScrollBarEnabled = false,
                              id = "talent",
                              paddingLeft = "8dp",
                              paddingRight = "8dp",
                            },
                            {
                              TextView,
                              text = "武器突破素材",
                              textColor = primaryc,
                              textSize = "14sp",
                              gravity = "center|left",
                              Typeface = AppFont.特粗,
                              paddingTop = "12dp",
                              paddingLeft = "16dp",
                              layout_width = "-1",
                              layout_height = "-2",
                              paddingBottom = "8dp"
                            },
                            {
                              RecyclerView,
                              layout_width = "-1",
                              layout_height = "-2",
                              horizontalScrollBarEnabled = false,
                              id = "weapon",
                              paddingLeft = "8dp",
                              paddingRight = "8dp"
                            }
                          },
                          {
                            LinearLayout,
                            orientation = "horizontal",
                            layout_height = "-2",
                            layout_width = "-1",
                            gravity = "right|center",
                            padding = "8dp",
                            paddingTop = "10dp",
                            {
                              ImageView,
                              ColorFilter = primaryc,
                              src = 图标("keyboard_arrow_right"),
                              layout_height = "32dp",
                              layout_width = "32dp",
                              padding = "4dp"
                            }
                          }
                        },
                        {
                          --公告
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "0dp",
                          layout_marginLeft = "16dp",
                          layout_marginRight = "16dp",
                          layout_marginBottom = "16dp",
                          {
                            LinearLayout,
                            orientation = "vertical",
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            paddingBottom = "16dp",
                            {
                              TextView,
                              text = "公告",
                              textColor = primaryc,
                              textSize = "16sp",
                              gravity = "center|left",
                              Typeface = AppFont.特粗,
                              padding = "16dp",
                              paddingBottom = "0",
                              layout_width = "-1",
                              layout_height = "-2"
                            },
                            {
                              TextView,
                              textSize = "14sp",
                              textColor = textc,
                              text = "正在获取…",
                              Typeface = AppFont.标准,
                              paddingTop = "8dp",
                              paddingLeft = "16dp",
                              paddingRight = "16dp",
                              layout_width = "-1",
                              layout_height = "-2",
                              id = "post"
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    --顶栏布局（背景)
                    LinearLayout,
                    layout_height = "-2",
                    layout_width = "-1",
                    orientation = "vertical",
                    id = "_topbar",
                    onClick = function()
                    end,
                    {
                      --状态栏占位布局
                      TextView,
                      layout_height = 状态栏高度,
                      layout_width = "-1",
                      background = backgroundc,
                      id = "hztl"
                    },
                    {
                      --标题栏布局（背景)
                      LinearLayout,
                      layout_height = "56dp",
                      layout_width = "-1",
                      background = backgroundc,
                      id = "_topbar_top"
                    },
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "8dp",
                      BackgroundDrawable = GradientDrawable(
                      GradientDrawable.Orientation.TOP_BOTTOM,
                      {
                        转0x(backgroundc) - 0xcf000000,
                        转0x(backgroundc) - 0xff000000
                      }
                      )
                    }
                  },
                  {
                    --顶栏布局（标题）
                    LinearLayout,
                    layout_height = "61.8%h",
                    layout_width = "-1",
                    elevation = "4dp",
                    orientation = "vertical",
                    id = "_topbar2",
                    {
                      --状态栏占位布局
                      TextView,
                      layout_height = 状态栏高度,
                      layout_width = "-1"
                    },
                    {
                      --标题栏布局
                      LinearLayout,
                      layout_height = "-1",
                      layout_width = "-1",
                      gravity = "left|bottom",
                      orientation = "vertical",
                      paddingBottom = "16dp",
                      --background="#00000000";
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        gravity = "top",
                        layout_weight = "1",
                        elevation = "1",
                        --[[{
                ImageView;
                src=图标("menu");
                ColorFilter=primaryc;
                layout_width="32dp",
                layout_height="32dp",
                padding="4dp";
                layout_margin="12dp";
                onClick=function()jc.showPage(0)end;
                id="_menu";
              };]]
                        {
                          TextView,
                          layout_height = "-2",
                          layout_width = "-1",
                          layout_weight = "1"
                        },
                        {
                          RelativeLayout,
                          layout_width = "56dp",
                          layout_height = "56dp",
                          --[[{
                          LinearLayout;
                          layout_width="-1";
                          layout_height="-1";
                          --background=backgroundc;
                          gravity="right|top";
                          padding="14dp";
                          {
                            CardView;
                            CardElevation="0dp";
                            CardBackgroundColor="#7fFF5252";
                            Radius="4dp";
                            layout_width="8dp";
                            layout_height="8dp";
                            id="update_point",
                          },
                        },]]
                          {
                            LinearLayout,
                            layout_width = "-1",
                            layout_height = "-1",
                            --background=backgroundc;
                            gravity = "center",
                            {
                              ImageView,
                              layout_width = "32dp",
                              layout_height = "32dp",
                              padding = "4dp",
                              ColorFilter = primaryc,
                              src = 图标("more_vert"),
                              id = "_more",
                              onClick = function()
                                --pop.showAsDropDown(_more_lay,dp2px(-8-192),dp2px(8))
                                pop.showAsDropDown(_more_lay)
                              end,
                            },
                            {
                              TextView,
                              id = "_more_lay",
                              layout_width = "0",
                              layout_height = "0",
                              layout_gravity = "top"
                            }
                          }
                        }
                      },
                      {
                        --标题外布局
                        LinearLayout,
                        layout_height = "56dp",
                        layout_width = "-1",
                        gravity = "left|center",
                        orientation = "vertical",
                        --[[paddingLeft="56dp";]]
                        PivotX = "0dp",
                        PivotY = "56dp",
                        ScaleX = 2,
                        ScaleY = 2,
                        gravity = "left|center",
                        id = "_title_w",
                        {
                          TextView,
                          Text = activity.Title,
                          textColor = primaryc,
                          textSize = "18sp",
                          layout_marginLeft = "16dp",
                          layout_height = "-2",
                          layout_width = "-2",
                          id = "_title",
                          Typeface = AppFont.特粗,
                          gravity = "left|center",
                          transitionName = "title"
                        },
                        {
                          TextView,
                          id = "_subtitle",
                          Text = "给时光以生命，给岁月以文明。",
                          textColor = primaryc,
                          textSize = "10sp",
                          layout_marginLeft = "16dp",
                          layout_height = "-2",
                          layout_width = "-1",
                          Typeface = AppFont.标准,
                          gravity = "left|center",
                          maxLines = 1,
                          ellipsize = "end",
                          layout_marginTop = "2dp"
                        }
                      }
                    }
                  },
                  {
                    LinearLayout,
                    layout_height = "-1",
                    layout_width = "-1",
                    orientation = "vertical",
                    gravity = "bottom|right",
                    paddingBottom = "56dp",
                    layout_marginBottom = 导航栏高度,
                    {
                      CardView,
                      CardElevation = "0",
                      CardBackgroundColor = 转0x(ctbackc),
                      --outlineSpotShadowColor=转0x(primaryc),
                      Radius = "24dp",
                      layout_width = "48dp",
                      layout_height = "48dp",
                      layout_margin = "24dp",
                      id = "xf2",
                      translationZ = "4dp",
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        id = "cv2_lay",
                        gravity = "center",
                        onClick = function()
                          返回底部()
                        end,
                        {
                          ImageView,
                          layout_width = "-1",
                          layout_height = "-1",
                          padding = "12dp",
                          ColorFilter = primaryc,
                          src = 图标("keyboard_arrow_down"),
                          id = "_bottom"
                        }
                      }
                    }
                  },
                  {
                    LinearLayout,
                    layout_height = "-1",
                    layout_width = "-1",
                    orientation = "vertical",
                    gravity = "bottom|right",
                    paddingBottom = "56dp",
                    layout_marginBottom = 导航栏高度,
                    {
                      CardView,
                      CardElevation = "0",
                      CardBackgroundColor = 转0x(ctbackc),
                      --outlineSpotShadowColor=转0x(primaryc),
                      Radius = "24dp",
                      layout_width = "48dp",
                      layout_height = "48dp",
                      layout_margin = "24dp",
                      id = "xf1",
                      translationZ = "4dp",
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        id = "cv1_lay",
                        gravity = "center",
                        onClick = function()
                          返回顶部()
                        end,
                        {
                          ImageView,
                          layout_width = "-1",
                          layout_height = "-1",
                          padding = "12dp",
                          ColorFilter = primaryc,
                          src = 图标("keyboard_arrow_up"),
                          id = "_top"
                        }
                      }
                    }
                  }
                },
                {
                  LinearLayout,
                  layout_height = "-1",
                  layout_width = "-1",
                  orientation = "vertical",
                  {
                    ObservableScrollView,
                    layout_width = "-1",
                    layout_height = "-1",
                    id = "obs_2",
                    overScrollMode = 2,
                    verticalScrollBarEnabled = false,
                    {
                      LinearLayout,
                      orientation = "vertical",
                      layout_width = "fill",
                      layout_height = "fill",
                      id = "gvw",
                      paddingBottom = dp2px(136) + 导航栏高度,
                      {
                        --状态栏占位布局
                        TextView,
                        layout_height = 状态栏高度,
                        layout_width = "-1"
                        --background=barbackgroundc;
                      },
                      {
                        LinearLayout, --标题栏2
                        orientation = "horizontal",
                        layout_height = "180dp",
                        layout_width = "-1",
                        --background=barbackgroundc;
                        gravity = "left|bottom",
                        id = "dym3",
                        {
                          TextView, --标题
                          Typeface = AppFont.特粗,
                          textSize = "32sp",
                          Text = "工具",
                          textColor = primaryc,
                          paddingLeft = "24dp",
                          paddingBottom = "16dp"
                        }
                      },
                      {
                        NoScrollGridView,
                        layout_height = "-2",
                        layout_width = "-1",
                        NumColumns = 2,
                        padding = "8dp",
                        paddingTop = "8dp",
                        id = "gv2"
                        --layout_marginBottom="64dp";
                      }
                    }
                  }
                },
                {
                  RelativeLayout,
                  layout_width = "-1",
                  layout_height = "-1",
                  {
                    LinearLayout,
                    layout_height = "-1",
                    layout_width = "-1",
                    orientation = "vertical",
                    --[[{
                    PageView;
                    layout_height="-1";
                    layout_width="-1";
                    id="tapage";
                    pages={]]
                    {
                      SwipeRefreshLayout,
                      layout_height = "-1",
                      layout_width = "-1",
                      id = "tarefresh1",
                      {
                        ObservableRecyclerView,
                        layout_height = "-1",
                        layout_width = "-1",
                        id = "tarv1"
                      }
                    }
                    --[[{
                        ObservableRecyclerView;
                        layout_height="-1";
                        layout_width="-1";
                        id="tarv2",
                      };
                    },
                  },]]
                  },
                  {
                    LinearLayout,
                    layout_height = "-2",
                    layout_width = "-1",
                    orientation = "vertical",
                    paddingTop = 状态栏高度,
                    background = backgroundc,
                    id = "tatopbar",
                    onClick = function()
                    end,
                    {
                      LinearLayout,
                      layout_width = "-1",
                      layout_height = "56dp",
                      gravity = "center|left",
                      {
                        LinearLayout,
                        layout_width = "-2",
                        layout_height = "-1",
                        gravity = "center|left",
                        id = "tauserclick",
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "16dp",
                          layout_width = "32dp",
                          layout_height = "32dp",
                          layout_marginLeft = "16dp",
                          {
                            ImageView,
                            layout_height = "-1",
                            layout_width = "-1",
                            id = "ta_usericon"
                          }
                        },
                        {
                          TextView,
                          textColor = textc,
                          textSize = "20sp",
                          layout_width = "-1",
                          gravity = "center|left",
                          paddingLeft = "8dp",
                          paddingRight = "16dp",
                          Typeface = AppFont.粗体,
                          id = "ta_username"
                        }
                      },
                      {
                        LinearLayout,
                        layout_width = "-1",
                        layout_height = "-1",
                        gravity = "center|left",
                        layout_weight = "1"
                      },
                      {
                        LinearLayout,
                        layout_width = "32dp",
                        layout_height = "56dp",
                        --background=backgroundc;
                        gravity = "center",
                        layout_marginRight = "12dp",
                        {
                          ImageView,
                          layout_width = "32dp",
                          layout_height = "32dp",
                          padding = "4dp",
                          ColorFilter = primaryc,
                          src = 图标("apps")
                        }
                      }
                    }

                    --[[{
                    RelativeLayout;
                    layout_height="48dp";
                    layout_width="-1";
                    background="#00000000";
                    id="tadym",
                    {
                      LinearLayout;
                      layout_height="-1";
                      layout_width="-1";
                      {
                        LinearLayout;
                        layout_width="-1";
                        layout_weight="1",
                        layout_height="-1";
                        gravity="center";
                        id="tapage1";
                        onClick=function()
                          tapage.showPage(0)
                        end;
                        {
                          TextView;
                          layout_width="-2";
                          layout_height="-2";
                          Text="文章";
                          Typeface=AppFont.粗体;
                          textSize="14sp";
                          textColor=primaryc;
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="-1";
                        layout_weight="1",
                        layout_height="-1";
                        gravity="center";
                        id="tapage2";
                        onClick=function()
                          tapage.showPage(1)
                        end;
                        {
                          TextView;
                          layout_width="-2";
                          layout_height="-2";
                          Text="问答";
                          Typeface=AppFont.粗体;
                          textSize="14sp";
                          textColor=stextc;
                        };
                      };
                    };
                    {
                      LinearLayout;
                      layout_height="8dp";
                      layout_width=activity.getWidth()/2;
                      id="tapage_scroll";
                      layout_alignParentBottom="true";
                      Gravity="center";
                      {
                        CardView;
                        background=primaryc;
                        elevation="0";
                        radius="4dp";
                        layout_height="8dp";
                        layout_marginTop="4dp";
                        layout_width="48dp";
                      };
                    };
                  };]]
                  },
                  {
                    LinearLayout,
                    layout_height = "-1",
                    layout_width = "-1",
                    orientation = "vertical",
                    gravity = "bottom|right",
                    paddingBottom = dp2px(56) + 导航栏高度,
                    {
                      CardView,
                      CardElevation = "0",
                      CardBackgroundColor = 转0x(ctbackc),
                      --outlineSpotShadowColor=转0x(primaryc),
                      Radius = "24dp",
                      layout_width = "-2",
                      layout_height = "48dp",
                      layout_margin = "24dp",
                      id = "floatbutton_newarticle",
                      translationZ = "4dp",
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        id = "floatbutton_newarticle_lay",
                        gravity = "center",
                        paddingLeft = "12dp",
                        paddingRight = "24dp",
                        onClick = function()
                          activity.newActivity("tanutai/newarticle")
                        end,
                        {
                          ImageView,
                          layout_width = "32dp",
                          layout_height = "32dp",
                          padding = "4dp",
                          ColorFilter = primaryc,
                          src = 图标("add")
                        },
                        {
                          TextView,
                          text = "写文章",
                          textColor = primaryc,
                          textSize = "16sp",
                          layout_width = "-1",
                          gravity = "center|left",
                          paddingLeft = "2dp",
                          layout_weight = "1",
                          Typeface = AppFont.粗体
                        }
                      }
                    }
                  },
                  {
                    LinearLayout,
                    layout_height = "-1",
                    layout_width = "-1",
                    fitsSystemWindows = true,
                    {
                      ScrollView,
                      layout_height = "-1",
                      layout_width = "-1",
                      id = "talogin",
                      background = backgroundc,
                      Visibility = View.GONE,
                      onClick = function()
                      end,
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        gravity = "top|center",
                        {
                          LinearLayout, --标题栏2
                          orientation = "horizontal",
                          layout_height = "176dp",
                          layout_width = "-1",
                          --background=barbackgroundc;
                          gravity = "left|bottom",
                          {
                            TextView, --标题
                            Typeface = AppFont.特粗,
                            textSize = "32sp",
                            Text = "登录",
                            textColor = primaryc,
                            paddingLeft = "64dp",
                            paddingBottom = "16dp"
                          }
                        },
                        {
                          MEditText {
                            textSize = "14sp",
                            textColor = textc,
                            HintTextColor = stextc,
                            hint = "账号/邮箱",
                            layout_width = "-1",
                            layout_height = "-2",
                            --text="#2196F3";
                            id = "tausername",
                            inputType = "text"
                          },
                          layout_marginTop = "24dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp"
                        },
                        {
                          MEditText {
                            textSize = "14sp",
                            textColor = textc,
                            HintTextColor = stextc,
                            hint = "密码",
                            layout_width = "-1",
                            layout_height = "-2",
                            --text="#2196F3";
                            id = "tapassword",
                            inputType = "textPassword"
                          },
                          layout_marginTop = "8dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp"
                        },
                        {
                          RelativeLayout,
                          layout_height = "-2",
                          layout_width = "-1",
                          id = "tacaptcha_p",
                          Visibility = View.GONE,
                          {
                            MEditText {
                              textSize = "14sp",
                              textColor = textc,
                              HintTextColor = stextc,
                              hint = "验证码",
                              layout_width = "-1",
                              layout_height = "-2",
                              --text="#2196F3";
                              id = "tacaptcha",
                              inputType = "text"
                            },
                            layout_marginTop = "8dp",
                            layout_marginLeft = "64dp",
                            layout_marginBottom = "8dp",
                            layout_marginRight = "64dp"
                          },
                          {
                            LinearLayout,
                            layout_height = "68dp",
                            layout_width = "-1",
                            gravity = "right|center",
                            layout_marginTop = "8dp",
                            {
                              CardView,
                              CardElevation = "0dp",
                              CardBackgroundColor = cardbackc,
                              Radius = "4dp",
                              layout_width = dp2px(68 * 0.6) / 36 * 100,
                              layout_height = dp2px(68 * 0.6),
                              layout_marginTop = "8dp",
                              layout_marginRight = "72dp",
                              layout_marginBottom = "8dp",
                              {
                                ImageView,
                                id = "tacaptchaimg",
                                layout_width = "-1",
                                layout_height = "-1"
                              }
                            }
                          }
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "8dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp",
                          {
                            LinearLayout,
                            layout_height = "-2",
                            layout_width = "-1",
                            {
                              ImageView,
                              src = 图标("send"),
                              layout_width = "-1",
                              layout_height = "56dp",
                              padding = "16dp",
                              id = "taloginbtn",
                              ColorFilter = primaryc
                            }
                          }
                        },
                        {
                          LinearLayout,
                          layout_height = "-2",
                          layout_width = "-1",
                          gravity = "center",
                          paddingLeft = "72dp",
                          paddingRight = "72dp",
                          padding = "8dp",
                          {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = cardbackc,
                            Radius = "2dp",
                            layout_width = "-1",
                            layout_height = "4dp",
                            layout_weight = "1"
                          },
                          {
                            TextView, --标题
                            Typeface = AppFont.粗体,
                            textSize = "12sp",
                            textColor = stextc,
                            Text = "还没有帐号？",
                            paddingLeft = "8dp",
                            paddingRight = "8dp"
                          },
                          {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = cardbackc,
                            Radius = "2dp",
                            layout_width = "-1",
                            layout_height = "4dp",
                            layout_weight = "1"
                          }
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_margin = "8dp",
                          layout_marginLeft = "64dp",
                          layout_marginRight = "64dp",
                          layout_marginTop = "8dp",
                          layout_marginBottom = "72dp",
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-1",
                            textSize = "16sp",
                            paddingRight = "16dp",
                            paddingLeft = "16dp",
                            Typeface = AppFont.标准,
                            paddingTop = "12dp",
                            paddingBottom = "12dp",
                            gravity = "center",
                            Text = "注册",
                            textColor = textc,
                            id = "tareg"
                          }
                        }
                      }
                    },
                    {
                      ScrollView,
                      layout_height = "-1",
                      layout_width = "-1",
                      id = "taregp",
                      background = backgroundc,
                      Visibility = View.GONE,
                      onClick = function()
                      end,
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        gravity = "top|center",
                        {
                          LinearLayout, --标题栏2
                          orientation = "horizontal",
                          layout_height = "176dp",
                          layout_width = "-1",
                          --background=barbackgroundc;
                          gravity = "left|bottom",
                          {
                            TextView, --标题
                            Typeface = AppFont.特粗,
                            textSize = "32sp",
                            Text = "注册",
                            textColor = primaryc,
                            paddingLeft = "64dp",
                            paddingBottom = "16dp"
                          }
                        },
                        {
                          MEditText {
                            textSize = "14sp",
                            textColor = textc,
                            HintTextColor = stextc,
                            hint = "邮箱",
                            layout_width = "-1",
                            layout_height = "-2",
                            --text="#2196F3";
                            id = "taemail2",
                            inputType = "text"
                          },
                          layout_marginTop = "24dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp"
                        },
                        {
                          RelativeLayout,
                          layout_height = "-2",
                          layout_width = "-1",
                          id = "tacaptcha_p2",
                          Visibility = View.GONE,
                          {
                            MEditText {
                              textSize = "14sp",
                              textColor = textc,
                              HintTextColor = stextc,
                              hint = "图形验证码",
                              layout_width = "-1",
                              layout_height = "-2",
                              --text="#2196F3";
                              id = "tacaptcha2",
                              inputType = "text"
                            },
                            layout_marginTop = "8dp",
                            layout_marginLeft = "64dp",
                            layout_marginBottom = "8dp",
                            layout_marginRight = "64dp"
                          },
                          {
                            LinearLayout,
                            layout_height = "68dp",
                            layout_width = "-1",
                            gravity = "right|center",
                            layout_marginTop = "8dp",
                            {
                              CardView,
                              CardElevation = "0dp",
                              CardBackgroundColor = cardbackc,
                              Radius = "4dp",
                              layout_width = dp2px(68 * 0.6) / 36 * 100,
                              layout_height = dp2px(68 * 0.6),
                              layout_marginTop = "8dp",
                              layout_marginRight = "72dp",
                              layout_marginBottom = "8dp",
                              {
                                ImageView,
                                id = "tacaptchaimg2",
                                layout_width = "-1",
                                layout_height = "-1"
                              }
                            }
                          }
                        },
                        {
                          RelativeLayout,
                          layout_height = "-2",
                          layout_width = "-1",
                          {
                            MEditText {
                              textSize = "14sp",
                              textColor = textc,
                              HintTextColor = stextc,
                              hint = "验证码",
                              layout_width = "-1",
                              layout_height = "-2",
                              --text="#2196F3";
                              id = "taemailcaptcha2",
                              inputType = "text"
                            },
                            layout_marginTop = "8dp",
                            layout_marginLeft = "64dp",
                            layout_marginBottom = "8dp",
                            layout_marginRight = "64dp"
                          },
                          {
                            LinearLayout,
                            layout_height = "68dp",
                            layout_width = "-1",
                            gravity = "right|center",
                            layout_marginTop = "8dp",
                            {
                              CardView,
                              CardElevation = "0dp",
                              CardBackgroundColor = cardbackc,
                              Radius = "4dp",
                              layout_width = "-2",
                              layout_height = "-2",
                              layout_marginTop = "8dp",
                              layout_marginRight = "72dp",
                              layout_marginBottom = "8dp",
                              {
                                TextView,
                                layout_width = "-1",
                                layout_height = "-1",
                                textSize = "14sp",
                                paddingRight = "16dp",
                                paddingLeft = "16dp",
                                Typeface = AppFont.粗体,
                                paddingTop = "12dp",
                                paddingBottom = "12dp",
                                gravity = "center",
                                Text = "发送验证码",
                                textColor = textc,
                                id = "taemailgetcaptcha2"
                              }
                            }
                          }
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "8dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp",
                          {
                            LinearLayout,
                            layout_height = "-2",
                            layout_width = "-1",
                            {
                              TextView,
                              layout_width = "-1",
                              layout_height = "-1",
                              textSize = "16sp",
                              paddingRight = "16dp",
                              paddingLeft = "16dp",
                              Typeface = AppFont.粗体,
                              paddingTop = "12dp",
                              paddingBottom = "12dp",
                              gravity = "center",
                              Text = "下一步",
                              textColor = primaryc,
                              id = "taregbtn1"
                            }
                          }
                        },
                        {
                          LinearLayout,
                          layout_height = "-2",
                          layout_width = "-1",
                          gravity = "center",
                          paddingLeft = "72dp",
                          paddingRight = "72dp",
                          padding = "8dp",
                          {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = cardbackc,
                            Radius = "2dp",
                            layout_width = "-1",
                            layout_height = "4dp",
                            layout_weight = "1"
                          },
                          {
                            TextView, --标题
                            Typeface = AppFont.粗体,
                            textSize = "12sp",
                            textColor = stextc,
                            Text = "已经有账号了？",
                            paddingLeft = "8dp",
                            paddingRight = "8dp"
                          },
                          {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = cardbackc,
                            Radius = "2dp",
                            layout_width = "-1",
                            layout_height = "4dp",
                            layout_weight = "1"
                          }
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_margin = "8dp",
                          layout_marginLeft = "64dp",
                          layout_marginRight = "64dp",
                          layout_marginTop = "8dp",
                          layout_marginBottom = "72dp",
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-1",
                            textSize = "16sp",
                            paddingRight = "16dp",
                            paddingLeft = "16dp",
                            Typeface = AppFont.标准,
                            paddingTop = "12dp",
                            paddingBottom = "12dp",
                            gravity = "center",
                            Text = "登录",
                            textColor = textc,
                            id = "tatologin"
                          }
                        }
                      }
                    },
                    {
                      ScrollView,
                      layout_height = "-1",
                      layout_width = "-1",
                      id = "taregp2",
                      background = backgroundc,
                      Visibility = View.GONE,
                      onClick = function()
                      end,
                      {
                        LinearLayout,
                        layout_height = "-1",
                        layout_width = "-1",
                        orientation = "vertical",
                        gravity = "top|center",
                        {
                          LinearLayout, --标题栏2
                          orientation = "horizontal",
                          layout_height = "176dp",
                          layout_width = "-1",
                          --background=barbackgroundc;
                          gravity = "left|bottom",
                          {
                            TextView, --标题
                            Typeface = AppFont.特粗,
                            textSize = "32sp",
                            Text = "注册",
                            textColor = primaryc,
                            paddingLeft = "64dp",
                            paddingBottom = "16dp"
                          }
                        },
                        {
                          MEditText {
                            textSize = "14sp",
                            textColor = textc,
                            HintTextColor = stextc,
                            hint = "用户名",
                            layout_width = "-1",
                            layout_height = "-2",
                            --text="#2196F3";
                            id = "tausername3",
                            inputType = "text"
                          },
                          layout_marginTop = "24dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp"
                        },
                        {
                          MEditText {
                            textSize = "14sp",
                            textColor = textc,
                            HintTextColor = stextc,
                            hint = "密码",
                            layout_width = "-1",
                            layout_height = "-2",
                            --text="#2196F3";
                            id = "tapassword2",
                            inputType = "textPassword"
                          },
                          layout_marginTop = "8dp",
                          layout_marginLeft = "64dp",
                          layout_marginBottom = "8dp",
                          layout_marginRight = "64dp"
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_marginTop = "8dp",
                          layout_margin = "64dp",
                          layout_marginBottom = "8dp",
                          {
                            LinearLayout,
                            layout_height = "-2",
                            layout_width = "-1",
                            {
                              ImageView,
                              src = 图标("send"),
                              layout_width = "-1",
                              layout_height = "56dp",
                              padding = "16dp",
                              id = "taregbtn2",
                              ColorFilter = primaryc
                            }
                          }
                        },
                        {
                          CardView,
                          CardElevation = "0dp",
                          CardBackgroundColor = cardbackc,
                          Radius = "8dp",
                          layout_width = "-1",
                          layout_height = "-2",
                          layout_margin = "8dp",
                          layout_marginLeft = "64dp",
                          layout_marginRight = "64dp",
                          layout_marginTop = "8dp",
                          layout_marginBottom = "72dp",
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-1",
                            textSize = "16sp",
                            paddingRight = "16dp",
                            paddingLeft = "16dp",
                            Typeface = AppFont.标准,
                            paddingTop = "12dp",
                            paddingBottom = "12dp",
                            gravity = "center",
                            Text = "上一步",
                            textColor = textc,
                            id = "tarereg"
                          }
                        }
                      }
                    }
                  },
                  {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-1",
                    textSize = "32sp",
                    paddingRight = "16dp",
                    paddingLeft = "16dp",
                    Typeface = AppFont.特粗,
                    paddingTop = "12dp",
                    paddingBottom = "12dp",
                    gravity = "center",
                    Text = "未完工…",
                    textColor = primaryc,
                    background = backgroundc,
                    onClick = function()
                    end
                  } --]]
                }
              }
            }
          },
          {
            LinearLayout,
            layout_height = "-1",
            layout_width = "-1",
            orientation = "vertical",
            gravity = "bottom",
            {
              RelativeLayout,
              layout_height = "-2",
              layout_width = "-1",
              {
                LinearLayout, --底栏
                orientation = "vertical",
                layout_height = "-2",
                layout_width = "-1",
                gravity = "center|left",
                background = backgroundc,
                elevation = "6dp",
                id = "mBottomBar",
                onClick = function()
                end,
                {
                  LinearLayout, --底栏
                  orientation = "horizontal",
                  layout_height = "56dp",
                  layout_width = "-1",
                  gravity = "center|left",
                  layout_marginBottom = 导航栏高度,
                  paddingLeft = "8dp",
                  paddingRight = "8dp",
                  {
                    LinearLayout,
                    orientation = "vertical",
                    layout_height = "-1",
                    layout_width = "-1",
                    id = "page1",
                    gravity = "center",
                    layout_weight = "1",
                    onClick = function()
                      jc.showPage(0)
                    end,
                    {
                      ImageView,
                      layout_height = "24dp",
                      layout_width = "24dp",
                      src = 图标("home"),
                      ColorFilter = primaryc,
                      PivotX = "12dp",
                      PivotY = "24dp"
                    },
                    {
                      TextView,
                      textSize = "14sp",
                      Text = "主页",
                      layout_width = "wrap",
                      textColor = primaryc
                    }
                  },
                  {
                    LinearLayout,
                    orientation = "vertical",
                    layout_height = "-1",
                    layout_width = "-1",
                    id = "page2",
                    gravity = "center",
                    layout_weight = "1",
                    onClick = function()
                      jc.showPage(1)
                    end,
                    {
                      ImageView,
                      layout_height = "24dp",
                      layout_width = "24dp",
                      src = 图标("inbox"),
                      ColorFilter = stextc,
                      PivotX = "12dp",
                      PivotY = "24dp"
                    },
                    {
                      TextView,
                      textSize = "14sp",
                      Text = "工具",
                      textColor = stextc
                    }
                  },
                  {
                    LinearLayout,
                    orientation = "vertical",
                    layout_height = "-1",
                    layout_width = "-1",
                    id = "page3",
                    gravity = "center",
                    layout_weight = "1",
                    onClick = function()
                      jc.showPage(2)
                    end,
                    {
                      ImageView,
                      layout_height = "24dp",
                      layout_width = "24dp",
                      src = 图标("mode_comment"),
                      ColorFilter = stextc,
                      PivotX = "12dp",
                      PivotY = "24dp"
                    },
                    {
                      TextView,
                      textSize = "14sp",
                      Text = "绽雨台",
                      textColor = stextc
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        RelativeLayout,
        layout_width = "-1",
        layout_height = "-1",
        backgroundColor = backgroundc,
        id = "startPage",
        onClick = function()
        end,
        {
          LinearLayout,
          layout_height = "-1",
          layout_width = "-1",
          orientation = "vertical",
          {
            RelativeLayout,
            layout_width = "-1",
            layout_height = "-1",
            layout_weight = "1",
            {
              ImageView,
              layout_height = "-1",
              layout_width = "-1",
              scaleType = "centerCrop",
              id = "startPhoto",
              colorFilter = viewshaderc
            },
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              id = "startPhoto_top",
              gravity = "right|bottom",
              {
                CardView,
                CardElevation = "0dp",
                CardBackgroundColor = barbackgroundc,
                Radius = "22dp",
                layout_width = "-2",
                layout_height = "-2",
                layout_margin = "8dp",
                layout_marginLeft = "16dp",
                layout_marginRight = "16dp",
                layout_marginTop = "16dp",
                layout_marginBottom = "16dp",
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-1",
                  textSize = "14sp",
                  paddingRight = "20dp",
                  paddingLeft = "20dp",
                  Typeface = AppFont.标准,
                  paddingTop = "12dp",
                  paddingBottom = "12dp",
                  gravity = "center",
                  Text = "Meal time | 跳过",
                  textColor = textc,
                  id = "startPage_skip"
                }
              }
            }
          },
          {
            LinearLayout,
            layout_height = "-2",
            layout_width = "-1",
            gravity = "left|center",
            orientation = "vertical",
            padding = "24dp",
            layout_marginBottom = 导航栏高度,
            onClick=function()
            end,
            {
              TextView,
              Text = activity.Title,
              textColor = primaryc,
              textSize = "24sp",
              layout_height = "-2",
              layout_width = "-2",
              Typeface = AppFont.特粗,
              gravity = "left|center"
            },
            {
              TextView,
              id = "startSubtitle",
              Text = "给时光以生命，给岁月以文明。",
              textColor = stextc,
              textSize = "18sp",
              layout_height = "-2",
              layout_width = "-1",
              Typeface = AppFont.标准,
              gravity = "left|center",
              maxLines = 1,
              ellipsize = "end",
              layout_marginTop = "2dp"
            }
          }
        }
      }
    }

    activity.setContentView(loadlayout(layout))

    _debug_clock("setContentView_end")

    _topbar.alpha = 0

    local mfb = true

    xf1.scaleX = 0
    xf1.scaleY = 0

    _debug_clock("设置波纹_start")

    波纹({cv1_lay, cv2_lay, floatbutton_newarticle_lay, taloginbtn, taregbtn2}, "方主题")
    波纹({_more, page1, page2, page3, switch_memo, tapage1, tapage2}, "圆主题")
    波纹(
    {
      startPhoto_top,
      startPage_skip,
      daily,
      strength_p,
      expedition_more,
      tareg,
      tacaptchaimg,
      tauserclick,
      taemailgetcaptcha2,
      tatologin,
      taregbtn1,
      tarereg
    },
    "方自适应"
    )

    _debug_clock("设置LayoutTransition_start")

    transitioner = LayoutTransition()

    memo_in.getParent().setLayoutTransition(transitioner)
    talogin.getParent().setLayoutTransition(transitioner)

    _debug_clock("设置一些乱七八糟")

    if themefullscreen then
      静态渐变(转0x(primaryc) - 0xc0000000, 转0x(secondaryc) - 0xc0000000, pho_full_z, "竖")
     else
      静态渐变(转0x(primaryc) - 0xc0000000, 转0x(secondaryc) - 0xc0000000, pho_top_z, "竖")
    end
    --静态渐变(转0x(barbackgroundc),0x00ffffff,chjb,"竖")

    startSubtitle.setText(subtitle)
    _subtitle.setText(subtitle)

    function MFBhide(id)
      pcall(
      function()
        mfbha.pause()
      end
      )
      mfbhascaleX = ObjectAnimator.ofFloat(id, "scaleX", {id.scaleX, 0})
      mfbhascaleY = ObjectAnimator.ofFloat(id, "scaleY", {id.scaleX, 0})
      mfbhaalpha = ObjectAnimator.ofFloat(id, "alpha", {id.alpha, 0})
      mfbha = AnimatorSet()
      --组合动画
      mfbha.setDuration(256)
      mfbha.setInterpolator(AccelerateInterpolator())
      mfbha.play(mfbhascaleX).with(mfbhascaleY).with(mfbhaalpha)
      mfbha.addListener {
        onAnimationEnd = function(animation)
          控件隐藏(id)
        end
      }
      mfbha.start()

      mfbhb =
      ViewAnimator.animate({id.getChildAt(0).getChildAt(0)}).scale({id.getChildAt(0).scaleX, 0}).interpolator(
      AccelerateInterpolator()
      ).duration(256).start()
    end

    function MFBshow(id)
      pcall(
      function()
        mfbsa.pause()
      end
      )
      控件可见(id)
      mfbsascaleX = ObjectAnimator.ofFloat(id, "scaleX", {id.scaleX, 1})
      mfbsascaleY = ObjectAnimator.ofFloat(id, "scaleY", {id.scaleX, 1})
      mfbsaalpha = ObjectAnimator.ofFloat(id, "alpha", {id.alpha, 1})
      mfbsa = AnimatorSet()
      --组合动画
      mfbsa.setDuration(400)
      mfbsa.setInterpolator(OvershootInterpolator())
      mfbsa.play(mfbsascaleX).with(mfbsascaleY).with(mfbsaalpha)
      mfbsa.addListener {
        onAnimationEnd = function(animation)
          控件可见(id)
        end
      }
      mfbsa.start()

      mfbsb =
      ViewAnimator.animate({id.getChildAt(0).getChildAt(0)}).scale({id.getChildAt(0).scaleX, 1}).interpolator(
      OvershootInterpolator()
      ).duration(400).start()
    end

    cv1_lay.setOnTouchListener(
    {
      onTouch = function(v, n)
        if tostring(n):find("ACTION_DOWN") then
          --设置动画插入器，减速
          ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(8)}).setDuration(128).setInterpolator(
          --设置动画时间
          DecelerateInterpolator()
          ).start()
         elseif tostring(n):find("ACTION_UP") then
          ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(4)}).setDuration(128).setInterpolator(
          --设置动画时间
          AccelerateInterpolator()
          ).start()
          --设置动画插入器，减速
        end
      end
    }
    )

    cv2_lay.setOnTouchListener(
    {
      onTouch = function(v, n)
        if tostring(n):find("ACTION_DOWN") then
          --设置动画插入器，减速
          ObjectAnimator.ofFloat(xf2, "translationZ", {xf1.translationZ, dp2px(8)}).setDuration(128).setInterpolator(
          --设置动画时间
          DecelerateInterpolator()
          ).start()
         elseif tostring(n):find("ACTION_UP") then
          ObjectAnimator.ofFloat(xf2, "translationZ", {xf1.translationZ, dp2px(4)}).setDuration(128).setInterpolator(
          --设置动画时间
          AccelerateInterpolator()
          ).start()
          --设置动画插入器，减速
        end
      end
    }
    )

    floatbutton_newarticle_lay.setOnTouchListener(
    {
      onTouch = function(v, n)
        if tostring(n):find("ACTION_DOWN") then
          --设置动画时间
          --设置动画插入器，减速
          ObjectAnimator.ofFloat(
          floatbutton_newarticle,
          "translationZ",
          {floatbutton_newarticle.translationZ, dp2px(8)}
          ).setDuration(128).setInterpolator(DecelerateInterpolator()).start()
         elseif tostring(n):find("ACTION_UP") then
          ObjectAnimator.ofFloat(
          floatbutton_newarticle,
          "translationZ",
          {floatbutton_newarticle.translationZ, dp2px(4)}
          ).setDuration(128).setInterpolator(AccelerateInterpolator()).start()
          --设置动画时间
          --设置动画插入器，减速
        end
      end
    }
    )

    local qhzt = 0

    local obs1_lst
    local apa = 1
    local apb

    function scrollYEvent(apa, ispage)
      if not themefullscreen and ispage then
        return true
      end
      if themefullscreen then
        if 1 - apa >= 1 then
          --print((1-0)^2)
          pho_full_filter.alpha = 1
          pho_full_blur.alpha = 1
          pho_full_blur2.alpha = 1
          pho_full_blur1.alpha = 1
         else
          --print((1-apa)^2)
          pho_full_filter.alpha = (1 - apa) ^ 4
          --print(apa)
          pho_full_blur.alpha = -(1 - apa - 1) ^ 2 + 1
          pho_full_blur2.alpha = -(1 - apa - 1) ^ 8 + 1
          pho_full_blur1.alpha = -(1 - apa - 1) ^ 64 + 1
        end
       else
        if themefullscreen and ispage then
         else
          if 1 - apa >= 1 then
            --print((1-0)^2)
            pho_top_filter.alpha = 1
            pho_top_blur.alpha = 1
            pho_top_blur2.alpha = 1
            pho_top_blur1.alpha = 1
           else
            --print((1-apa)^2)
            pho_top_filter.alpha = (1 - apa) ^ 4
            --print(apa)
            pho_top_blur.alpha = -(1 - apa - 1) ^ 2 + 1
            pho_top_blur2.alpha = -(1 - apa - 1) ^ 8 + 1
            pho_top_blur1.alpha = -(1 - apa - 1) ^ 64 + 1
          end
        end
      end
      if apa >= 0 then
        if themefullscreen and ispage then
         else
          _title_w.setY(apa * (activity.Height * 0.618 - dp2px(16 + 56) - 状态栏高度))
          _title_w.setX(0.6 * apa --[[-(apa*2)*dp2px(56)]])
          --_title_w.setX(0.6*apa)
          _title_w.setScaleY(1 + (1 * apa))
          _title_w.setScaleX(1 + (1 * apa))

          --print(activity.Width/(1+apa))
          --print(tointeger((1+apa)*100)*10,tointeger((1+apa)*1000))
          if tointeger((1 + apa) * 50) * 10 == tointeger((1 + apa) * 500) then
            local linearParams = _title_w.getLayoutParams()
            linearParams.width = activity.Width / (1 + apa)
            --+(apa)*dp2px(56)
            _title_w.setLayoutParams(linearParams)
          end
        end
        --pho_top.setY((1-apa)*(activity.Height*apa*(1-0.618)))
        --pho_top.setY(0.6*(1-apa)*(activity.Height*(apa-1)*(1-0.618-1)))
        if themefullscreen then
          local topps = 1 + (1 - apa) * 0.3
          pho_full.setScaleX(topps)
          pho_full.setScaleY(topps)
          pho_full_blur.setScaleX(topps)
          pho_full_blur.setScaleY(topps)
          pho_full_blur1.setScaleX(topps)
          pho_full_blur1.setScaleY(topps)
          pho_full_blur2.setScaleX(topps)
          pho_full_blur2.setScaleY(topps)
         else
          local toppy = 0.618 * 0.618 * activity.Height * math.sin((1 - apa) * math.pi / 4)
          local topps = 1 + (1 - apa) * 0.15
          --pho_top.setY(0.6*math.cos(1-apa)*(activity.Height*math.sin(apa-1)*(-0.618)))
          pho_top.setY(toppy)
          pho_top_blur.setY(toppy)
          pho_top_blur1.setY(toppy)
          pho_top_blur2.setY(toppy)
          pho_top.setScaleX(topps)
          pho_top.setScaleY(topps)
          pho_top_blur.setScaleX(topps)
          pho_top_blur.setScaleY(topps)
          pho_top_blur1.setScaleX(topps)
          pho_top_blur1.setScaleY(topps)
          pho_top_blur2.setScaleX(topps)
          pho_top_blur2.setScaleY(topps)
        end
       else
        _title_w.setY(0)
        --_title_w.setX(dp2px(56))
        _title_w.setX(0)
        _title_w.setScaleY(1)
        _title_w.setScaleX(1)
        local linearParams = _title_w.getLayoutParams()
        linearParams.width = activity.Width
        _title_w.setLayoutParams(linearParams)
      end
      if apa <= 0.4 then
        if qhzt == 1 then
          _more.setColorFilter(转0x(primaryc))
          --_menu.setColorFilter(转0x(primaryc))
          波纹({_more}, "圆主题")
          if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
            状态栏颜色(0x3F000000, true)
            沉浸状态栏(true)
           else
            状态栏颜色(0xFF424242)
            沉浸状态栏()
          end
          qhzt = 0
        end
       else
        if qhzt ~= 1 then
          qhzt = 1
          if themebackgroundlight == "light" then
            _more.setColorFilter(0xffffffff)
            --_menu.setColorFilter(0xffffffff)
            波纹({_more}, "圆白")
            状态栏颜色(0xFF424242, false)
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              沉浸状态栏(nil, nil, true)
             else
              沉浸状态栏()
            end
           else
            _more.setColorFilter(0xff212121)
            --_menu.setColorFilter(0xff212121)
            波纹({_more}, "圆黑")
            状态栏颜色(0x3F000000, false)
            沉浸状态栏(true)
          end
        end
      end
      if apa <= 0 then
        if not mfb then
          mfb = true
          MFBshow(xf1)
          MFBhide(xf2)
        end
        _topbar.alpha = 1
       else
        if mfb then
          mfb = false
          MFBhide(xf1)
          MFBshow(xf2)
        end
        _topbar.alpha = 0
      end
    end

    obs_1.setScrollViewCallbacks(
    ObservableScrollViewCallbacks {
      onScrollChanged = function(scrollY, firstScroll, dragging)
        obs1_lst = scrollY
        apa = 1 - (obs1_lst / (activity.Height * 0.618 - dp2px(56) - 状态栏高度))
        apb = 1 - (obs1_lst / dp2px(244 - 56 - 16 - 16))
        if obs1_lst + obs_1.height == obs_1.getChildAt(0).getMeasuredHeight() then
        end
        --pho_top.alpha=apa
        --pho_top_z.alpha=apa
        scrollYEvent(apa)
        --print(apa)
      end
    }
    )

    function showD(id) --主页底栏项目高亮动画
      local kidt = id.getChildAt(0)
      local kidw = id.getChildAt(1)
      local animatorSet = AnimatorSet()
      local tscaleX = ObjectAnimator.ofFloat(kidt, "scaleX", {kidt.scaleX, 1.0})
      local tscaleY = ObjectAnimator.ofFloat(kidt, "scaleY", {kidt.scaleY, 1.0})
      local wscaleX = ObjectAnimator.ofFloat(kidw, "scaleX", {kidw.scaleX, 1.0})
      local wscaleY = ObjectAnimator.ofFloat(kidw, "scaleY", {kidw.scaleY, 1.0})
      animatorSet.setDuration(256)
      animatorSet.setInterpolator(DecelerateInterpolator())
      animatorSet.play(tscaleX).with(tscaleY).with(wscaleX).with(wscaleY)
      animatorSet.start()
    end

    function closeD(id) --主页底栏项目灰色动画
      local gkidt = id.getChildAt(0)
      local gkidw = id.getChildAt(1)
      local ganimatorSet = AnimatorSet()
      local gtscaleX = ObjectAnimator.ofFloat(gkidt, "scaleX", {gkidt.scaleX, 0.9})
      local gtscaleY = ObjectAnimator.ofFloat(gkidt, "scaleY", {gkidt.scaleY, 0.9})
      local gwscaleX = ObjectAnimator.ofFloat(gkidw, "scaleX", {gkidw.scaleX, 0.9})
      local gwscaleY = ObjectAnimator.ofFloat(gkidw, "scaleY", {gkidw.scaleY, 0.9})
      ganimatorSet.setDuration(256)
      ganimatorSet.setInterpolator(DecelerateInterpolator())
      ganimatorSet.play(gtscaleX).with(gtscaleY).with(gwscaleX).with(gwscaleY)
      ganimatorSet.start()
    end

    obs_1.getChildAt(0).setLayoutTransition(transitioner)
    gv2.setLayoutTransition(transitioner)

    _debug_clock("tools_start")

    floatwindowenabled = false

    function openFloatWeb()
      if 判断悬浮窗权限() == false then
        提示("请开启悬浮窗权限")
        获取悬浮窗权限()
        return true
      end

      if floatwindowenabled == true then
        提示("悬浮窗已开启")
        return true
      end

      floatlayout = {
        LinearLayout,
        layout_width = "-2",
        layout_height = "-2",
        id = "floatroot",
        {
          LinearLayout,
          layout_width = mukactivity.getData("dscreenY") * 0.4,
          layout_height = "-1",
          {
            LinearLayout,
            layout_height = "-1",
            layout_width = "32dp"
          },
          {
            CardView,
            CardElevation = "2dp",
            CardBackgroundColor = backgroundc,
            Radius = "16dp",
            layout_width = "-2",
            layout_height = "-2",
            layout_margin = "16dp",
            layout_marginRight = "16dp",
            --layout_marginLeft="8dp",
            id = "floatcard",
            {
              LinearLayout,
              orientation = "vertical",
              layout_width = "-1",
              layout_height = "-1",
              {
                RelativeLayout,
                layout_height = "-1",
                layout_width = "-1",
                {
                  LuaWebView,
                  id = "floatweb",
                  layout_height = "-1",
                  layout_width = "-1",
                  onTouch = function()
                    关闭floaturl()
                    控件隐藏(floatlist.getParent())
                    floatcard2.getChildAt(0).getChildAt(3).getChildAt(0).setColorFilter(转0x(stextc))
                    控件隐藏(floatalpha.getParent())
                    floatcard2.getChildAt(0).getChildAt(1).getChildAt(0).setColorFilter(转0x(stextc))
                  end
                },
                {
                  LinearLayout,
                  layout_height = "-1",
                  layout_width = "-1",
                  orientation = "vertical",
                  --background=viewshaderc;
                  {
                    TextView,
                    layout_width = "-1",
                    layout_height = "2dp",
                    id = "webprogress"
                  }
                },
                {
                  LinearLayout,
                  layout_height = "-1",
                  layout_width = "-1",
                  orientation = "vertical",
                  gravity = "bottom",
                  {
                    CardView,
                    CardElevation = "4dp",
                    CardBackgroundColor = backgroundc,
                    Radius = "12dp",
                    layout_width = "-1",
                    layout_height = "-2",
                    layout_margin = "8dp",
                    --layout_marginBottom="0",
                    Visibility = View.GONE,
                    id = "floaturl_card",
                    onClick = function()
                    end,
                    {
                      LinearLayout,
                      layout_height = "-1",
                      layout_width = "-1",
                      orientation = "vertical",
                      {
                        MEditText {
                          textSize = "14sp",
                          textColor = textc,
                          HintTextColor = stextc,
                          hint = "输入网址",
                          layout_width = "-1",
                          layout_height = "-2",
                          --text="#2196F3";
                          id = "floaturl",
                          inputType = "textUri"
                        },
                        layout_marginTop = "16dp",
                        layout_margin = "16dp",
                        layout_marginBottom = "8dp"
                      },
                      {
                        LinearLayout,
                        orientation = "horizontal",
                        layout_width = "-1",
                        layout_height = "-2",
                        gravity = "right|center",
                        {
                          CardView,
                          layout_width = "-2",
                          layout_height = "-2",
                          radius = "2dp",
                          background = "#00000000",
                          layout_marginTop = "8dp",
                          layout_marginLeft = "8dp",
                          layout_marginBottom = "16dp",
                          Elevation = "0",
                          onClick = function()
                            关闭floaturl()
                          end,
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-2",
                            textSize = "16sp",
                            Typeface = AppFont.特粗,
                            paddingRight = "8dp",
                            paddingLeft = "8dp",
                            paddingTop = "4dp",
                            paddingBottom = "4dp",
                            Text = "取消",
                            textColor = stextc,
                            BackgroundDrawable = 波纹2("方自适应")
                          }
                        },
                        {
                          CardView,
                          layout_width = "-2",
                          layout_height = "-2",
                          radius = "2dp",
                          background = "#00000000",
                          layout_marginTop = "8dp",
                          layout_marginLeft = "8dp",
                          layout_marginBottom = "16dp",
                          Elevation = "0",
                          onClick = function()
                            floaturl.Text = floaturl.Text:gsub(" ", "")
                            if floaturl.Text == "" then
                              提示("网址不能为空")
                              return true
                            end
                            floatload(floaturl.Text, true)
                            关闭floaturl()
                          end,
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-2",
                            textSize = "16sp",
                            Typeface = AppFont.特粗,
                            paddingRight = "8dp",
                            paddingLeft = "8dp",
                            paddingTop = "4dp",
                            paddingBottom = "4dp",
                            Text = "电脑UA",
                            textColor = stextc,
                            BackgroundDrawable = 波纹2("方自适应")
                          }
                        },
                        {
                          CardView,
                          layout_width = "-2",
                          layout_height = "-2",
                          radius = "4dp",
                          background = primaryc,
                          layout_marginTop = "8dp",
                          layout_marginLeft = "8dp",
                          layout_marginRight = "16dp",
                          layout_marginBottom = "16dp",
                          Elevation = "1dp",
                          onClick = function()
                            floaturl.Text = floaturl.Text:gsub(" ", "")
                            if floaturl.Text == "" then
                              提示("网址不能为空")
                              return true
                            end
                            floatload(floaturl.Text)
                            关闭floaturl()
                          end,
                          {
                            TextView,
                            layout_width = "-1",
                            layout_height = "-2",
                            textSize = "16sp",
                            paddingRight = "8dp",
                            paddingLeft = "8dp",
                            Typeface = AppFont.特粗,
                            paddingTop = "4dp",
                            paddingBottom = "4dp",
                            Text = "访问",
                            textColor = backgroundc,
                            BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class {int {}}, int {bwz})
                            )
                          }
                        }
                      }
                    }
                  },
                  {
                    CardView,
                    CardElevation = "4dp",
                    CardBackgroundColor = backgroundc,
                    Radius = "12dp",
                    layout_width = "-1",
                    layout_height = "-2",
                    layout_margin = "8dp",
                    --layout_marginBottom="0",
                    Visibility = View.GONE,
                    onClick = function()
                    end,
                    {
                      GridView,
                      layout_width = "-1",
                      layout_height = "-2",
                      id = "floatlist",
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      NumColumns = 1
                    }
                  },
                  {
                    CardView,
                    CardElevation = "4dp",
                    CardBackgroundColor = backgroundc,
                    Radius = "12dp",
                    layout_width = "-1",
                    layout_height = "-2",
                    layout_margin = "8dp",
                    Visibility = View.GONE,
                    onClick = function()
                    end,
                    {
                      SeekBar,
                      progress = 80,
                      max = 80,
                      layout_width = "-1",
                      layout_height = "-2",
                      id = "floatalpha",
                      paddingLeft = "24dp",
                      paddingRight = "24dp",
                      paddingTop = "12dp",
                      paddingBottom = "12dp"
                    }
                  }
                }
              }
            }
          }
        }
      }

      floatmenulayout = {
        LinearLayout,
        layout_width = "-2",
        layout_height = "-2",
        id = "floatmenuroot",
        {
          CardView,
          CardElevation = "2dp",
          CardBackgroundColor = backgroundc,
          Radius = "16dp",
          layout_width = "-2",
          layout_height = "-2",
          layout_margin = "16dp",
          layout_marginLeft = "8dp",
          layout_marginRight = "0",
          id = "floatcard2",
          {
            LinearLayout,
            orientation = "vertical",
            layout_height = "-1",
            layout_width = "32dp",
            paddingTop = "8dp",
            paddingBottom = "8dp",
            gravity = "top|center",
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              gravity = "center",
              onClick = function(v)
                if floatcard.Visibility == View.GONE then
                  控件可见(floatcard)
                  控件可见(floatroot)
                  if floatlock == true then
                    控件可见(v.getParent().getChildAt(2))
                   else
                    控件可见(v.getParent().getChildAt(5))
                    控件可见(v.getParent().getChildAt(1))
                    控件可见(v.getParent().getChildAt(2))
                    控件可见(v.getParent().getChildAt(3))
                    控件可见(v.getParent().getChildAt(4))
                  end
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("close_fullscreen")))
                  v.getChildAt(0).setColorFilter(转0x(stextc))
                  floatlp2.height = WindowManager.LayoutParams.WRAP_CONTENT
                  floatwm.updateViewLayout(floatmenuroot, floatlp2)
                  if floatlock ~= true then
                    floatlp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    floatwm.updateViewLayout(floatroot, floatlp)
                  end
                 else
                  控件隐藏(floatcard)
                  控件隐藏(floatroot)
                  控件隐藏(v.getParent().getChildAt(5))
                  控件隐藏(v.getParent().getChildAt(1))
                  控件隐藏(v.getParent().getChildAt(2))
                  控件隐藏(v.getParent().getChildAt(3))
                  控件隐藏(v.getParent().getChildAt(4))
                  关闭floaturl()
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("open_in_full")))
                  v.getChildAt(0).setColorFilter(转0x(primaryc))
                  floatlp2.height = WindowManager.LayoutParams.WRAP_CONTENT
                  floatwm.updateViewLayout(floatmenuroot, floatlp2)
                  floatlp.flags =
                  WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                  floatwm.updateViewLayout(floatroot, floatlp)
                end
              end,
              background = 波纹2("圆主题"),
              {
                ImageView,
                ColorFilter = stextc,
                src = 图标("close_fullscreen"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp"
              }
            },
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              gravity = "center",
              onClick = function(v)
                if floatalpha.getParent().Visibility == View.GONE then
                  控件可见(floatalpha.getParent())
                  v.getChildAt(0).setColorFilter(转0x(primaryc))

                  控件隐藏(floatlist.getParent())
                  v.getParent().getChildAt(3).getChildAt(0).setColorFilter(转0x(stextc))

                  关闭floaturl()
                 else
                  控件隐藏(floatalpha.getParent())
                  v.getChildAt(0).setColorFilter(转0x(stextc))
                end
              end,
              background = 波纹2("圆主题"),
              {
                ImageView,
                ColorFilter = stextc,
                src = 图标("invert_colors"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp"
              }
            },
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              gravity = "center",
              onClick = function(v)
                if floatlock == true then
                  控件可见(v.getParent().getChildAt(5))
                  控件可见(v.getParent().getChildAt(1))
                  --控件可见(v.getParent().getChildAt(2))
                  控件可见(v.getParent().getChildAt(3))
                  控件可见(v.getParent().getChildAt(4))
                  floatlock = false
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("lock_open")))
                  v.getChildAt(0).setColorFilter(转0x(stextc))
                  floatlp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                  floatwm.updateViewLayout(floatroot, floatlp)
                 else
                  关闭floaturl()

                  控件隐藏(v.getParent().getChildAt(5))
                  控件隐藏(v.getParent().getChildAt(1))
                  --控件隐藏(v.getParent().getChildAt(2))
                  控件隐藏(v.getParent().getChildAt(3))
                  控件隐藏(v.getParent().getChildAt(4))
                  floatlock = true
                  floatlp.flags =
                  WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("lock")))
                  v.getChildAt(0).setColorFilter(转0x(primaryc))
                  floatwm.updateViewLayout(floatroot, floatlp)

                  控件隐藏(floatlist.getParent())
                  v.getParent().getChildAt(3).getChildAt(0).setColorFilter(转0x(stextc))
                  控件隐藏(floatalpha.getParent())
                  v.getParent().getChildAt(1).getChildAt(0).setColorFilter(转0x(stextc))
                end
              end,
              background = 波纹2("圆主题"),
              {
                ImageView,
                ColorFilter = stextc,
                src = 图标("lock_open"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp"
              }
            },
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              gravity = "center",
              onClick = function(v)
                if floatlist.getParent().Visibility == View.GONE then
                  控件可见(floatlist.getParent())
                  v.getChildAt(0).setColorFilter(转0x(primaryc))

                  控件隐藏(floatalpha.getParent())
                  v.getParent().getChildAt(1).getChildAt(0).setColorFilter(转0x(stextc))

                  关闭floaturl()
                 else
                  控件隐藏(floatlist.getParent())
                  v.getChildAt(0).setColorFilter(转0x(stextc))
                end
              end,
              background = 波纹2("圆主题"),
              {
                ImageView,
                ColorFilter = stextc,
                src = 图标("list"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp",
                id = "floatlist_icon"
              }
            },
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              gravity = "center",
              onClick = function(v)
                if fullscreen == true then
                  fullscreen = false
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("fullscreen")))
                  v.getChildAt(0).setColorFilter(转0x(stextc))

                  linearParams = floatroot.getChildAt(0).getLayoutParams()
                  linearParams.width = mukactivity.getData("dscreenY") * 0.4
                  --linearParams.height =高度
                  floatroot.getChildAt(0).setLayoutParams(linearParams)
                  floatlp.width = WindowManager.LayoutParams.WRAP_CONTENT
                  floatwm.updateViewLayout(floatroot, floatlp)
                 else
                  fullscreen = true
                  v.getChildAt(0).setImageBitmap(loadbitmap(图标("fullscreen_exit")))
                  v.getChildAt(0).setColorFilter(转0x(primaryc))
                  linearParams = floatroot.getChildAt(0).getLayoutParams()
                  linearParams.width = -1
                  --linearParams.height =高度
                  floatroot.getChildAt(0).setLayoutParams(linearParams)
                  floatlp.width = WindowManager.LayoutParams.MATCH_PARENT
                  floatwm.updateViewLayout(floatroot, floatlp)
                end
              end,
              background = 波纹2("圆主题"),
              {
                ImageView,
                ColorFilter = stextc,
                src = 图标("fullscreen"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp"
              }
            },
            {
              LinearLayout,
              layout_height = "32dp",
              layout_width = "32dp",
              layout_marginTop = "8dp",
              gravity = "center",
              onClick = function(v)
                floatwm.removeView(floatmenuroot)
                floatwm.removeView(floatroot)
                floatwindowenabled = false
              end,
              background = 波纹2("圆", 0x21FF5252),
              {
                ImageView,
                ColorFilter = "#FF5252",
                src = 图标("close"),
                layout_height = "32dp",
                layout_width = "32dp",
                padding = "4dp"
              }
            }
          }
        }
      }

      floatwm = activity.getApplicationContext().getSystemService(Context.WINDOW_SERVICE)
      floatlp = WindowManager.LayoutParams()
      floatlp.format = PixelFormat.RGBA_8888
      floatlp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
      if Build.VERSION.SDK_INT >= 26 then
        floatlp.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
       else
        floatlp.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
      end
      floatlp.width = WindowManager.LayoutParams.WRAP_CONTENT
      floatlp.height = WindowManager.LayoutParams.WRAP_CONTENT
      floatlp.gravity = Gravity.LEFT | Gravity.CENTER
      floatwm.addView(loadlayout(floatlayout), floatlp)

      floatlp2 = WindowManager.LayoutParams()
      floatlp2.format = PixelFormat.RGBA_8888
      floatlp2.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
      if Build.VERSION.SDK_INT >= 26 then
        floatlp2.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
       else
        floatlp2.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
      end
      floatlp2.width = WindowManager.LayoutParams.WRAP_CONTENT
      floatlp2.height = WindowManager.LayoutParams.WRAP_CONTENT
      floatlp2.gravity = Gravity.LEFT | Gravity.CENTER
      floatwm.addView(loadlayout(floatmenulayout), floatlp2)

      floatwindowenabled = true

      transitioner = LayoutTransition()
      floatcard.getChildAt(0).getChildAt(0).getChildAt(2).setLayoutTransition(transitioner)
      floatcard2.getChildAt(0).setLayoutTransition(transitioner)
      floatcard.getParent().setLayoutTransition(transitioner)

      floatlock = false
      fullscreen = false

      floatalpha.setOnSeekBarChangeListener {
        onStartTrackingTouch = function()
        end,
        onStopTrackingTouch = function()
          floatroot.alpha = (floatalpha.progress / 100) + 0.2
          floatmenuroot.alpha = (floatalpha.progress / 100) + 0.2
        end,
        onProgressChanged = function()
          floatroot.alpha = (floatalpha.progress / 100) + 0.2
          floatmenuroot.alpha = (floatalpha.progress / 100) + 0.2
        end
      }
      floatalpha.ProgressDrawable.setColorFilter(PorterDuffColorFilter(转0x(primaryc), PorterDuff.Mode.SRC_ATOP))
      floatalpha.Thumb.setColorFilter(PorterDuffColorFilter(转0x(primaryc), PorterDuff.Mode.SRC_ATOP))

      import "android.webkit.CookieSyncManager"
      import "android.webkit.CookieManager"
      import "android.webkit.WebSettings"

      local web = floatweb
      web.removeView(web.getChildAt(0))

      web.getSettings().setSupportZoom(true)
      web.getSettings().setBuiltInZoomControls(true)
      web.getSettings().setDefaultFontSize(12)
      web.getSettings().setDisplayZoomControls(false)
      web.getSettings().setUseWideViewPort(true)
      web.getSettings().setLoadWithOverviewMode(true)
      web.getSettings().setJavaScriptEnabled(true)
      --web.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
      web.getSettings().setAllowFileAccess(true)
      web.getSettings().setAppCacheEnabled(true)
      web.getSettings().setDomStorageEnabled(true)
      web.getSettings().setDatabaseEnabled(true)

      import "com.lua.*"

      darkmode = ""

      js = [[document.getElementsByTagName('body')[0].style.zoom=0.6]]

      web.setWebChromeClient(
      LuaWebChrome(
      LuaWebChrome.IWebChrine {
        onProgressChanged = function(view, newProgress)
          local lpm = webprogress.getLayoutParams()
          lpm.width = newProgress * ((floatwm.getDefaultDisplay().getWidth() - dp2px(16 * 2)) / 100)
          webprogress.setLayoutParams(lpm)
          if 全局主题值 == "Night" or 全局主题值 == "Star" then
            local v =
            "var style = document.createElement('style');style.type='text/css';style.id='QQBrowserSDKNightMode';style.innerHTML='html,body{background:none !important;background-color: #1d1e2a !important;}html *{background-color: #1d1e2a !important; color:#888888 !important;border-color:#3e4f61 !important;text-shadow:none !important;box-shadow:none !important;}a,a *{border-color:#4c5b99 !important; color:#2d69b3 !important;text-decoration:none !important;}a:visited,a:visited *{color:#a600a6 !important;}a:active,a:active *{color:#5588AA !important;}input,select,textarea,option,button{background-image:none !important;color:#AAAAAA !important;border-color:#4c5b99 !important;}form,div,button,span{background-color:#1d1e2a !important; border-color:#4c5b99 !important;}img{opacity:0.5}';document.getElementsByTagName('HEAD').item(0).appendChild(style);"
            web.loadUrl([[
      javascript:(function()
        { ]].. darkmode .. [[ })()
      ]])
          end
          web.loadUrl([[
      javascript:(function()
        { ]].. js .. [[ })()
      ]])
        end,
        --选择文件上传
        onShowFileChooser = function(view, valueCallbackuri, fileChooserParams)
          uploadMessageAboveL = valueCallbackuri
          local intet = Intent(Intent.ACTION_GET_CONTENT)
          intet.addCategory(Intent.CATEGORY_OPENABLE)
          if fileChooserParams.getAcceptTypes() then
            if tostring(fileChooserParams.getAcceptTypes()):find("/") then
              --print(fileChooserParams.getAcceptTypes())
              intet.setType(fileChooserParams.getAcceptTypes())
             else
              if fileChooserParams.getAcceptTypes()[0] ~= "" and fileChooserParams.getAcceptTypes()[0]:find("/") then
                local types,
                num = "", 0
                while true do
                  local n = (fileChooserParams.getAcceptTypes()[num])
                  if n:find("%.") then
                    --n=n:gsub("%.","*/")
                  end
                  if types == "" then
                    types = n
                   else
                    types = types .. ";" .. n
                  end
                  num = num + 1
                  if
                    not pcall(
                    function()
                      local a = fileChooserParams.getAcceptTypes()[num]
                    end
                    )
                    then
                    break
                  end
                end
                intet.setType(types)
               else
                --print("* /1")
                intet.setType("*/*")
              end
            end
           else
            --print("* /2")
            intet.setType("*/*")
          end
          if mukactivity.getData("Web_Upload_All_Types_File") == "true" then
            intet.setType("*/*")
          end
          activity.startActivityForResult(Intent.createChooser(intet, "File Chooser"), 1)
          --准备回调
          onActivityResult = function(req, res, intent)
            if (res == Activity.RESULT_CANCELED) then
              if (uploadMessageAboveL ~= nil) then
                uploadMessageAboveL.onReceiveValue(nil)
              end
            end
            local results
            if (res == Activity.RESULT_OK) then
              if (uploadMessageAboveL == nil or type(uploadMessageAboveL) == "number") then
                return
              end
              if (intent ~= nil) then
                local dataString = intent.getDataString()
                local clipData = intent.getClipData()
                if (clipData ~= nil) then
                  results = Uri[clipData.getItemCount()]
                  for i = 0, clipData.getItemCount() - 1 do
                    local item = clipData.getItemAt(i)
                    results[i] = item.getUri()
                  end
                end
                if (dataString ~= nil) then
                  results = Uri[1]
                  results[0] = Uri.parse(dataString)
                end
              end
            end
            if (results ~= nil) then
              uploadMessageAboveL.onReceiveValue(results)
              uploadMessageAboveL = nil
            end
          end
          return true
        end
      }
      )
      )

      web.setWebViewClient {
        shouldOverrideUrlLoading = function(view, url)
          wurl = url
          --floaturl.text=wurl
          --控件隐藏(loaderr)
          loaderror = false
        end,
        onPageStarted = function(view, url, favicon)
          控件可见(webprogress)
          wurl = url
          --floaturl.text=wurl
          --控件隐藏(loaderr)
          loaderror = false
        end,
        onPageFinished = function(view, url)
          控件隐藏(webprogress)
          wurl = url
          --floaturl.text=wurl
          if loaderror == true then
            return true
          end
          --[=[if 全局主题值 == "Night" then
              local v =
                "var style = document.createElement('style');style.type='text/css';style.id='QQBrowserSDKNightMode';style.innerHTML='html,body{background:none !important;background-color: #1d1e2a !important;}html *{background-color: #1d1e2a !important; color:#888888 !important;border-color:#3e4f61 !important;text-shadow:none !important;box-shadow:none !important;}a,a *{border-color:#4c5b99 !important; color:#2d69b3 !important;text-decoration:none !important;}a:visited,a:visited *{color:#a600a6 !important;}a:active,a:active *{color:#5588AA !important;}input,select,textarea,option,button{background-image:none !important;color:#AAAAAA !important;border-color:#4c5b99 !important;}form,div,button,span{background-color:#1d1e2a !important; border-color:#4c5b99 !important;}img{opacity:0.5}';document.getElementsByTagName('HEAD').item(0).appendChild(style);"
              web.loadUrl([[
      javascript:(function()
        { ]] .. darkmode .. [[ })()
      ]])
            end]=]
          web.loadUrl([[
      javascript:(function()
        { ]].. js .. [[ })()
      ]])
          loaderror = false
        end
        --[[onReceivedError=function(view,errorCode,description,failingUrl)
      printLog(nil,errorCode,description,failingUrl)
      loaderror=true
      local furl=failingUrl:match("://(.-)/") or failingUrl:match("://(.+)")
      errwz.text="在访问 "..furl.." 时出错"
      errxx.text="如需了解更多信息，可以在线搜索此代码："..description
      控件可见(loaderr)
      title.setText("")
      activity.Title=furl
    end,]]
      }

      静态渐变(转0x(primaryc) - 转0x("#9f000000"), 转0x(primaryc), webprogress, "横")

      function floatload(url, pc)
        if url == "mihoyo" then
          js =
          [[var x=document.getElementsByClassName("mhy-bbs-app-header");
            for (var i = 0; i<x.length;i++) {
                   x[i].style.display="none";
                 };
            
            var x=document.getElementsByClassName("menu-item menu-item--logout");
            for (var i = 0; i<x.length;i++) {
                   x[i].style.display="none";
                 };
                 
            ]]
          --[[floatweb.getSettings().setUserAgentString(
              "Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RP1A.200720.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/99.0.4844.88 Mobile Safari/537.36 miHoYoBBS/2.24.2"
            )]]
          --local map = HashMap()
          --map.put("x-requested-with", "com.mihoyo.hyperion")

          if mukactivity.getData("myscookie_map") ~= nil then
            CookieSyncManager.createInstance(this)
            cookieManager = CookieManager.getInstance()
            cookieManager.setAcceptCookie(true)
            cookieManager.removeSessionCookie() --移除
            cookieManager.setCookie(
            "https://webstatic.mihoyo.com/ys/app/interactive-map/index.html",
            mukactivity.getData("myscookie_map")
            )
            cookieManager.setCookie(".mihoyo.com", mukactivity.getData("myscookie_map")) --cookies是在HttpClient中获得的cookie
            CookieSyncManager.getInstance().sync()

            CookieManager.getInstance().setCookie(
            "https://webstatic.mihoyo.com/ys/app/interactive-map/index.html",
            mukactivity.getData("myscookie_map")
            )

            floatweb.setCookie(".mihoyo.com", mukactivity.getData("myscookie_map"))
            floatweb.setCookie(
            "https://webstatic.mihoyo.com/ys/app/interactive-map/index.html",
            mukactivity.getData("myscookie_map")
            )
          end

          floatweb.loadUrl(
          "https://webstatic.mihoyo.com/ys/app/interactive-map/index.html?bbs_presentation_style=no_header&lang=zh-cn",
          {["Cookie"] = mukactivity.getData("myscookie_map")}
          )
         elseif url == "gh" then
          js = [[document.getElementsByTagName('body')[0].style.zoom=1]]
          floatweb.getSettings().setUserAgentString(
          "Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RKQ1.210518.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/92.0.4515.115 Mobile Safari/537.36"
          )
          local map = HashMap()
          map.put("x-requested-with", "com.gh.genshinmap")
          floatweb.loadUrl("https://static-web.ghzs.com/cspage_pro/yuanshenMap.html", map)
         else
          js = [[document.getElementsByTagName('body')[0].style.zoom=1]]
          floatweb.getSettings().setUserAgentString(
          "Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RKQ1.210518.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/91.0.4472.120 Mobile Safari/537.36 miHoYoBBS/2.10.1"
          )
          if pc then
            js = [[document.getElementsByTagName('body')[0].style.zoom=1.2]]
            floatweb.getSettings().setUserAgentString(
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36"
            )
          end
          if url:sub(1, 4) ~= "http" then
            url = "http://" .. url
          end
          floatweb.loadUrl(url)
        end
      end

      floatload("mihoyo")

      float_list_item = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-2",
        {
          TextView,
          id = "floatadp_text",
          textColor = textc,
          layout_width = "-1",
          layout_height = "-1",
          textSize = "14sp",
          gravity = "left|center",
          paddingLeft = "16dp",
          paddingTop = "8dp",
          paddingBottom = "8dp",
          Typeface = AppFont.标准
        }
      }
      floatadp = LuaAdapter(activity, float_list_item)

      floatlist.setAdapter(floatadp)

      floatadp.add {floatadp_text = "米游社大地图"}
      floatadp.add {floatadp_text = "点击在应急食品内登录米游社"}
      floatadp.add {floatadp_text = "光环全资源互动地图"}
      floatadp.add {floatadp_text = "输入网址"}
      floatadp.add {floatadp_text = "刷新"}
      floatadp.add {floatadp_text = "后退"}
      floatadp.add {floatadp_text = "前进"}

      floatlist.setOnItemClickListener(
      AdapterView.OnItemClickListener {
        onItemClick = function(parent, v, pos, id)
          local s = v.Tag.floatadp_text.Text
          if s == "米游社大地图" then
            floatload("mihoyo")
          end
          if s == "点击在应急食品内登录米游社" then
            跳转页面("tools/maplogin")
          end
          if s == "光环全资源互动地图" then
            floatload("gh")
          end
          if s == "输入网址" then
            控件隐藏(floatlist.getParent())
            floatlist_icon.setColorFilter(转0x(stextc))

            控件可见(floaturl_card)
            floatlp.flags = WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
            floatwm.updateViewLayout(floatroot, floatlp)
          end
          if s == "刷新" then
            floatweb.reload()
          end
          if s == "前进" then
            floatweb.goForward()
          end
          if s == "后退" then
            floatweb.goBack()
          end
        end
      }
      )

      function 关闭floaturl()
        控件隐藏(floaturl_card)
        floatlp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
        floatwm.updateViewLayout(floatroot, floatlp)
      end
    end

    function sendNotification(notification_title, notification_content, id, name, intent, ongoing, sound, fullscreen)
      local builder
      --intent = Intent()
      local mNManager = this.getSystemService(Context.NOTIFICATION_SERVICE)
      local pendingIntent = PendingIntent.getActivity(this, 0, intent, 0)

      if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
        builder = NotificationCompat.Builder(this, "1773798610" .. id)
       else
        builder = NotificationCompat.Builder(this)
      end

      --设置标题
      builder.setContentTitle(notification_title)
      --设置内容
      builder.setContentText(notification_content)
      --设置状态栏显示的图标，建议图标颜色透明
      builder.setSmallIcon(R.mipmap.ic_launcher or R.drawable.icon)
      --设置通知灯光（LIGHTS）、铃声（SOUND）、震动（VIBRATE）、（ALL 表示都设置）
      if sound == true then
        builder.setDefaults(Notification.DEFAULT_ALL)
       else
        builder.setVibrate(nil)
        builder.setSound(nil)
        builder.setLights(0, 0, 0)
      end
      --通知栏点击后自动消失
      if ongoing == true then
        builder.setAutoCancel(false)
       else
        builder.setAutoCancel(true)
      end
      --简单通知栏设置 Intent
      builder.setContentIntent(pendingIntent)
      builder.setPriority(Notification.PRIORITY_HIGH)
      builder.setVisibility(Notification.VISIBILITY_PRIVATE)
      if fullscreen == true then
        builder.setFullScreenIntent(pendingIntent, true)
      end
      --常驻通知
      --if mukactivity.getData("Note_Notification_Ongoing")=="true"
      builder.setOngoing(ongoing)
      --else
      --builder.setOngoing(false)
      --end
      --设置下拉之后显示的图片
      --builder.setLargeIcon(BitmapFactory.decodeResource(this.getResources(), R.drawable.icon));

      if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
        --mNManager.deleteNotificationChannel("1773798610"..id)

        local channel
        if sound == true then
          channel = NotificationChannel("1773798610" .. id, name, NotificationManager.IMPORTANCE_HIGH)
         else
          channel = NotificationChannel("1773798610" .. id, name, NotificationManager.IMPORTANCE_HIGH)
        end
        channel.enableLights(sound) --是否在桌面icon右上角展示小红点
        channel.setLightColor(Color.RED) --小红点颜色
        --是否振动
        channel.enableVibration(sound)
        channel.setShowBadge(true) --是否在久按桌面图标时显示此渠道的通知
        if sound == true then
          channel.setImportance(NotificationManager.IMPORTANCE_HIGH)
         else
          channel.setImportance(NotificationManager.IMPORTANCE_HIGH)
        end
        mNManager.createNotificationChannel(channel)
      end
      bigTextStyle = NotificationCompat.BigTextStyle()
      bigTextStyle.setBigContentTitle(notification_title)
      bigTextStyle.bigText(notification_content)
      builder.setStyle(bigTextStyle)

      notification = builder.build()
      mNManager.notify(tointeger(id), notification)
    end

    function getDS()
      local i = tostring(tointeger(os.time()))

      local ascii_lowercase_digits = {
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z"
      }
      local r = ""

      for i = 1, 6 do
        local ran = math.random(1, #ascii_lowercase_digits)
        r = r .. ascii_lowercase_digits[ran]
        table.remove(ascii_lowercase_digits, ran)
      end

      local c = string.lower(MD5("salt=h8w582wxwgqvahcdkpvdhbh2w9casgfl&t=" .. i .. "&r=" .. r))
      return i .. "," .. r .. "," .. c
    end

    function getNewDS(q, b)
      local b = b or ""
      local q = q or ""

      local i = tostring(tointeger(os.time()))

      local r = tostring(math.random(100000, 200000))

      local c =
      string.lower(MD5("salt=xV8v4Qu54lUKrEYFZkJhB8cuOh9Asafs&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
      return i .. "," .. r .. "," .. c
    end

    function mys_signIn()
      local datas = {}
      xpcall(
      function()
        datas = JSON.decode(mukactivity.getData("myscookies"))
      end,
      function(e)
        mukactivity.setData("myscookies", JSON.encode({}))
        datas = JSON.decode(mukactivity.getData("myscookies"))
      end
      )

      local allsign = 0
      for i, v in pairs(datas) do
        allsign = allsign + 1
      end
      local signres = ""
      local signed = 0
      local haserror = false

      if allsign == 0 then
        提示("请先登录米游社账号")
        return true
      end
      if issigning == true then
        提示("已经在签到啦")
        return true
      end
      issigning = true
      --sendNotification("正在签到…", "已完成：" .. signed .. "/" .. allsign, "3", "签到提示", Intent(), false, false, true)
      加载对话框("正在签到…", "已完成：" .. signed .. "/" .. allsign, 0)

      local function 签到加文字(n)
        if signres == "" then
          signres = n
         else
          signres = signres .. "\n\n" .. n
        end
        signed = signed + 1
        --sendNotification("正在签到…", "已完成：" .. signed .. "/" .. allsign, "3", "签到提示", Intent(), false, false, true)
        加载对话框内容("已完成：" .. signed .. "/" .. allsign)
        if signed >= allsign then
          --关闭对话框()
          signres = signres .. "\n\n若出现429错误码为短时间内请求过多，可以稍后再试\n"
          mukactivity.setData("signresult", signres)
          --[[sendNotification(
              "签到结果",
              "点击查看更多\n" .. signres,
              "3",
              "签到提示",
              Intent(this, luajava.bindClass("com.androlua.LuaActivity")).setData(
                Uri.parse("file://" .. this.getLuaDir() .. "/tools/signreturn.lua")
              ),
              false,
              true,
              true
            )]]
          关闭对话框()
          单按钮对话框(
          "签到",
          signres,
          "关闭",
          function()
            关闭对话框()
          end
          )
          issigning = false
        end
        --print(signed,allsign)
      end

      local allsigntab = {}
      local allsign_ti = 0

      for nam, cookie in pairs(datas) do
        allsigntab[#allsigntab + 1] = {nam, cookie}
      end

      signticker = Ticker()
      signticker.Period = 1000
      signticker.onTick = function()
        allsign_ti = allsign_ti + 1
        if allsigntab[allsign_ti] then
          local nam,
          cookie = allsigntab[allsign_ti][1], allsigntab[allsign_ti][2]

          Http.get(
          "https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
          cookie,
          nil,
          nil,
          function(code, content)
            if code ~= 200 then
              签到加文字("请求失败，错误码：" .. code)
              return true
            end

            local content = JSON.decode(content)

            if content.data == nil then
              签到加文字("账号 " .. nam .. " 签到失败：\n" .. content.message)
              return true
            end
            allsign = allsign + (#content.data.list - 1)
            for i0, v0 in ipairs(content.data.list) do
              local data = content.data.list[i0]
              local nickname = data.nickname
              local uid = data.game_uid
              local region = data.region
              --[[data={
            ["level"] = 55 ;
            ["is_official"] = true ;
            ["region_name"] = "天空岛" ;
            ["is_chosen"] = false ;
            ["game_uid"] = "114640851" ;
            ["nickname"] = "喵嗷呜汪qwq" ;
            ["game_biz"] = "hk4e_cn" ;
            ["region"] = "cn_gf01" ;
          }]]
              Http.get(
              "https://bbs-api.mihoyo.com/apihub/api/home/new?cpu=mt6785v/cc&device=Xiaomi%20Redmi%20Note%208%20Pro&gids=2",
              function(code, content)
                if code ~= 200 then
                  签到加文字("请求失败，错误码：" .. code)
                  issigning = false
                  return true
                end
                local content = JSON.decode(content)
                for i, v in ipairs(content.data.navigator) do
                  if v.name == "签到福利" then
                    local data = mukutils.split(v.app_path:match("%?(.+)"), "&")
                    for i, v in pairs(data) do
                      if v:find("act_id") then
                        local act_id = v:match("=(.+)")

                        local ds = getDS()

                        --print(ds)

                        local map = HashMap()
                        map.put(
                        "User-Agent",
                        "Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RKQ1.210518.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/91.0.4472.120 Mobile Safari/537.36 miHoYoBBS/2.10.1"
                        )
                        map.put("x-rpc-device_id", string.upper(tostring(UUID.randomUUID()):gsub("%-", "")))
                        map.put("x-rpc-client_type", "5")
                        map.put("x-rpc-app_version", "2.3.0")
                        map.put("DS", ds)

                        Http.post(
                        "https://api-takumi.mihoyo.com/event/bbs_sign_reward/sign",
                        JSON.encode(
                        {
                          ["act_id"] = act_id,
                          ["uid"] = uid,
                          ["region"] = region
                        }
                        ),
                        cookie,
                        nil,
                        map,
                        function(code, content)
                          if code ~= 200 then
                            签到加文字("请求失败，错误码：" .. code)
                            issigning = false
                            return true
                          end
                          local content = JSON.decode(content)
                          local message = content.message
                          if message == "OK" then
                            message = "签到成功"
                          end

                          Http.get(
                          "https://api-takumi.mihoyo.com/event/bbs_sign_reward/info?region=" ..
                          region .. "&act_id=" .. act_id .. "&uid=" .. uid,
                          cookie,
                          nil,
                          nil,
                          function(code, content)
                            local content = JSON.decode(content)
                            --[[data={
                          ["message"] = "OK" ;
                          ["data"] = {
                            ["total_sign_day"] = 3 ;
                            ["month_first"] = false ;
                            ["first_bind"] = false ;
                            ["is_sign"] = true ;
                            ["is_sub"] = false ;
                            ["today"] = "2021-08-03" ;
                          } ;
                          ["retcode"] = 0 ;
                        } ;
                        ]]
                            local data = content.data
                            local total_sign_day = data.total_sign_day

                            local calendar = Calendar.getInstance()
                            local month = calendar.get(Calendar.MONTH) + 1
                            local day = calendar.get(Calendar.DAY_OF_MONTH)

                            Http.get(
                            "https://api-takumi.mihoyo.com/event/bbs_sign_reward/home?act_id=" .. act_id,
                            cookie,
                            nil,
                            nil,
                            function(code, content)
                              if code ~= 200 then
                                签到加文字("请求失败，错误码：" .. code)
                                issigning = false
                                return true
                              end
                              issigning = false
                              local content = JSON.decode(content)
                              签到加文字(
                              --[[month ..
                                              "月" ..
                                                day ..
                                                  "日" ..]]
                              [[ 🔅]] ..
                              nickname ..
                              "  UID: " ..
                              uid ..
                              [[ 
今日奖励: ]]..
                              content.data.awards[total_sign_day].name ..
                              [[ × ]] ..
                              content.data.awards[total_sign_day].cnt ..
                              [[ 
本月累签: ]].. total_sign_day .. [[ 天
签到结果: ]].. message
                              )
                            end
                            )
                          end
                          )
                        end
                        )

                        return true
                      end
                    end

                    issigning = false
                    签到加文字("失败:1")
                    return true
                  end
                end
              end
              )
            end
          end
          )
         else
          signticker.stop()
        end
      end
      signticker.start()
    end

    function 开启功能(n, view)
      xpcall(
      function()
        --[[if n == "wish" then
              提示("该功能暂未开放")
              return true
            end]]
        if n == "floatweb" then
          openFloatWeb()
          return true
        end
        if n == "getinfo" then
          local datas = {}
          xpcall(
          function()
            for _, cookie in pairs(JSON.decode(mukactivity.getData("myscookies"))) do
              datas[#datas + 1] = cookie
            end
          end,
          function(e)
            mukactivity.setData("myscookies", JSON.encode({}))
            for _, cookie in pairs(JSON.decode(mukactivity.getData("myscookies"))) do
              datas[#datas + 1] = cookie
            end
          end
          )
          if #datas == 0 then
            提示("请先登录至少一个米游社账号")
            return true
          end

          function getinfo(uid)
            加载对话框("正在获取","正在匹配账号信息",0)
            local serverid = "cn_gf01"
            if uid:sub(1, 1) == "5" then
              serverid = "cn_qd01"
             else
            end

            local function getPlayerInfo(correct_cookie)
              加载对话框内容("正在获取账号信息")
              if correct_cookie==""
                correct_cookie=datas[1]
              end
              local ds = getNewDS("role_id=" .. uid .. "&server=" .. serverid)

              --print(ds)

              local map = HashMap()
              map.put("DS", ds)
              map.put("Origin", "https://webstatic.mihoyo.com")
              map.put("x-rpc-app_version", "2.11.1")
              map.put(
              "User-Agent",
              "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBS/2.11.1"
              )
              map.put("x-rpc-client_type", "5")
              map.put("Referer", "https://webstatic.mihoyo.com/")
              --map.put("x-rpc-device_id",string.upper(tostring(UUID.randomUUID()):gsub("%-","")))
              map.put("X-Requested-With", "com.mihoyo.hyperion")

              Http.get(
              "https://api-takumi-record.mihoyo.com/game_record/app/genshin/api/index?server=" ..
              serverid .. "&role_id=" .. uid,
              correct_cookie,
              nil,
              map,
              function(code, content)
                if code ~= 200 then
                  提示("请求失败，错误码：" .. code)
                  return true
                end
                if JSON.decode(content).message ~= "OK" then
                  提示("获取失败：" .. JSON.decode(content).message)
                  return true
                end
                关闭对话框()
                activity.newActivity("tools/get_info", {content, uid})
              end
              )
            end

            local uid_already=0
            local correct_cookie=""

            for i=1,#datas do
              Http.get(
              "https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
              datas[i],
              nil,
              nil,
              function(code, content)
                uid_already=uid_already+1
                if code ~= 200 then
                  提示("请求失败，错误码：" .. code)
                  if uid_already==#datas
                    getPlayerInfo()
                  end
                  return true
                end

                local content = JSON.decode(content)

                if content.data == nil then
                  提示("账号 " .. nam .. " 获取信息失败：\n" .. content.message)
                  if uid_already==#datas
                    getPlayerInfo()
                  end
                  return true
                end
                for i0, v0 in ipairs(content.data.list) do
                  local uidn = content.data.list[i0].game_uid

                  printLog(nil,content.data.list,datas[i],1,uidn,2,uid)
                  if tointeger(uidn)==tointeger(uid)
                    correct_cookie=datas[i]
                  end

                end
                if uid_already==#datas
                  getPlayerInfo(correct_cookie)
                end
              end)
            end

            提示("正在查询")
          end

          function suiddialog(suiddata)
            local bwz
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              bwz = 0x3f000000
             else
              bwz = 0x3fffffff
            end
            local dannsuid = {
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
                  Text = "选择UID",
                  Typeface = AppFont.特粗,
                  textColor = primaryc,
                },
                {
                  GridView,
                  layout_width = "-1",
                  layout_height = "-1",
                  layout_weight = "1",
                  id = "suidgv",
                  paddingTop = "8dp",
                  paddingBottom = "8dp"
                },
                {
                  LinearLayout,
                  orientation = "horizontal",
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "right|center",
                  {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = function()
                      关闭对话框(ansuid)
                      input()
                    end,
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "16sp",
                      Typeface = AppFont.特粗,
                      paddingRight = "16dp",
                      paddingLeft = "16dp",
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      Text = "输入UID",
                      textColor = stextc,
                      BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                      ColorStateList(int[0].class {int {}}, int {bwz})
                      )
                    }
                  },
                  {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = function()
                      关闭对话框(ansuid)
                    end,
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "16sp",
                      paddingRight = "16dp",
                      paddingLeft = "16dp",
                      Typeface = AppFont.特粗,
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      Text = "关闭",
                      textColor = backgroundc,
                      BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                      ColorStateList(int[0].class {int {}}, int {bwz})
                      )
                    }
                  },
                }
              }
            }

            dlsuid = BottomDialog(activity)
            dlsuid.setView(loadlayout(dannsuid))
            dlsuid.setGravity(Gravity.BOTTOM)
            dlsuid.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
            dlsuid.setMinHeight(0)
            dlsuid.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
            --设置圆角
            dlsuid.setRadius(dp2px(16), 转0x(backgroundc))
            dlsuid.setCancelable(true)
            dlsuid.setCanceledOnTouchOutside(true)
            ansuid = dlsuid.show()

            local suiditem = {
              LinearLayout,
              layout_width = "-1",
              layout_height = "48dp",
              onClick = function()
              end,
              {
                RelativeLayout,
                layout_width = "-1",
                layout_height = "-1",
                {
                  TextView,
                  id = "tladp_text",
                  textColor = textc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.粗体,
                  layout_width = "-1",
                  layout_height = "-1",
                  paddingLeft = "24dp"
                },
                {
                  TextView,
                  id = "tladp_activity",
                  layout_width = "-1",
                  layout_height = "-1",
                  onClick = function(v)
                    getinfo(v.text)
                    关闭对话框(ansuid)
                  end,
                  textColor = "#00000000"
                }
              }
            }

            local suidadp
            suidadp = LuaAdapter(activity, suiditem)
            for i=1,#suiddata do
              suidadp.add {
                tladp_text = suiddata[i],
                tladp_activity = {
                  text = suiddata[i],
                  BackgroundDrawable = 波纹2("方自适应")
                }
              }
            end

            suidgv.setAdapter(suidadp)
          end

          local suiddata={}

          local uid_already=0
          for i=1,#datas do
            Http.get(
            "https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
            datas[i],
            nil,
            nil,
            function(code, content)
              uid_already=uid_already+1
              if code ~= 200 then
                提示("请求失败，错误码：" .. code)
                if uid_already==#datas
                  suiddialog(suiddata)
                end
                return true
              end

              local content = JSON.decode(content)

              if content.data == nil then
                提示("账号 " .. nam .. " 获取信息失败：\n" .. content.message)
                if uid_already==#datas
                  suiddialog(suiddata)
                end
                return true
              end
              for i0, v0 in ipairs(content.data.list) do
                local uidn = content.data.list[i0].game_uid

                suiddata[#suiddata+1]=tostring(uidn)
                if uid_already==#datas
                  suiddialog(suiddata)
                end
              end
            end)
          end

          function input()
            local bwz
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              bwz = 0x3f000000
             else
              bwz = 0x3fffffff
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
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-2",
                  textSize = "20sp",
                  layout_marginTop = "24dp",
                  layout_marginLeft = "24dp",
                  layout_marginRight = "24dp",
                  Text = "查询账号信息",
                  Typeface = AppFont.特粗,
                  textColor = primaryc
                },
                {
                  MEditText {
                    textSize = "14sp",
                    textColor = textc,
                    HintTextColor = stextc,
                    hint = "请输入UID",
                    layout_width = "-1",
                    layout_height = "-2",
                    --text="#2196F3";
                    id = "getinfo_edit",
                    inputType = "number"
                  },
                  layout_marginTop = "8dp",
                  layout_margin = "24dp",
                  layout_marginBottom = "8dp"
                },
                {
                  LinearLayout,
                  orientation = "horizontal",
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "right|center",
                  {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = function()
                      关闭对话框()
                    end,
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "16sp",
                      Typeface = AppFont.特粗,
                      paddingRight = "16dp",
                      paddingLeft = "16dp",
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      Text = "取消",
                      textColor = stextc,
                      BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                      ColorStateList(int[0].class {int {}}, int {bwz})
                      )
                    }
                  },
                  {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = function()
                      if tostring(getinfo_edit.Text) == "" then
                        提示("内容不能为空")
                        return true
                      end
                      关闭对话框()

                      local uid = tostring(getinfo_edit.Text)
                      getinfo(uid)
                    end,
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "16sp",
                      paddingRight = "16dp",
                      paddingLeft = "16dp",
                      Typeface = AppFont.特粗,
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      Text = "查询",
                      textColor = backgroundc,
                      BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                      ColorStateList(int[0].class {int {}}, int {bwz})
                      )
                    }
                  }
                }
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

            an = dl.show()
            dl.setCanceledOnTouchOutside(true)
          end

          return true
        end
        if n == "getabyssinfo" then
          return true
        end
        if n == "signin" then
          mys_signIn()
          return true
        end
        if n:match("web！(.-)") then
          if isnewacting == true then
            return true
          end
          isnewacting = true
          --[[activity.newActivity("web",{n:match("web！(.+)"),
        nil,nil,nil})]]
          local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
          path = activity.getLuaDir() .. "/web.lua"
          intent.setData(Uri.parse("file://" .. path))

          local object =
          Object {
            n:match("web！(.+)"),
            [[
      title.setText("]]..
            view.getParent().getChildAt(0).Text ..
            [[")
      控件隐藏(https)
      activity.Title="]].. view.getParent().getChildAt(0).Text .. [["]],
            [[
      title.setText("]]..
            view.getParent().getChildAt(0).Text ..
            [[")
      控件隐藏(https)
      activity.Title="]].. view.getParent().getChildAt(0).Text .. [["]],
            [[
      title.setText(web.getTitle():match("(.+) ?%-?%–?") or web.getTitle())
      控件隐藏(https)
      activity.Title=web.getTitle():match("(.+) ?%-?%–?") or web.getTitle()]]
          }
          intent.putExtra("arg", object)

          xpcall(
          function()
            activity.startActivity(
            intent,
            ActivityOptions.makeClipRevealAnimation(view, 0, 0, view.getWidth(), view.getHeight()).toBundle()
            )
          end,
          function()
            activity.newActivity(
            "web",
            {
              n:match("web！(.+)"),
              [[
      title.setText("]]..
              view.getParent().getChildAt(0).Text ..
              [[")
      控件隐藏(https)
      activity.Title="]]..
              view.getParent().getChildAt(0).Text .. [["]],
              [[
      title.setText("]]..
              view.getParent().getChildAt(0).Text ..
              [[")
      控件隐藏(https)
      activity.Title="]]..
              view.getParent().getChildAt(0).Text .. [["]],
              [[
      title.setText(web.getTitle():match("(.+) ?%-?%–?") or web.getTitle())
      控件隐藏(https)
      activity.Title=web.getTitle():match("(.+) ?%-?%–?") or web.getTitle()]]
            }
            )
          end
          )
          return true
        end
        if view then
          if isnewacting == true then
            return true
          end
          isnewacting = true
          local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
          path = activity.getLuaDir() .. "/tools/" .. n .. ".lua"
          intent.setData(Uri.parse("file://" .. path))
          xpcall(
          function()
            activity.startActivity(
            intent,
            ActivityOptions.makeClipRevealAnimation(view, 0, 0, view.getWidth(), view.getHeight()).toBundle()
            )
          end,
          function()
            xpcall(
            function()
              activity.newActivity("tools/" .. n)
            end,
            function(e)
              提示("打开失败：" .. e)
              printLog("Error 1", e)
            end
            )
          end
          )
         else
          if isnewacting == true then
            return true
          end
          isnewacting = true
          activity.newActivity("tools/" .. n)
        end
      end,
      function(e)
        提示("启动失败：" .. e)
        printLog("Error 2", e)
      end
      )
    end

    local tool_list_item2 = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-2",
      onClick = function()
      end,
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "8dp",
        layout_width = "-1",
        layout_height = "48dp",
        layout_margin = "8dp",
        id = "tlb",
        {
          RelativeLayout,
          layout_width = "-1",
          layout_height = "-1",
          {
            TextView,
            id = "tladp_text",
            textColor = textc,
            textSize = "14sp",
            gravity = "center",
            Typeface = AppFont.标准,
            gravity = "center",
            layout_width = "-1",
            layout_height = "-1"
          },
          {
            TextView,
            id = "tladp_activity",
            layout_width = "-1",
            layout_height = "-1",
            onClick = function(v)
              开启功能(v.Text, v)
            end,
            textColor = "#00000000"
          }
        }
      }
    }

    local tladp2
    tladp2 = LuaAdapter(activity, tool_list_item2)

    gv2.setAdapter(tladp2)

    tooltab = {
      {"圣遗物评分", "relicscore"},
      {"抽卡记录分析", "gacha_export"},
      --{"抽卡模拟器","wish"},
      {"圣遗物强化模拟器", "relic_str"},
      {"管理米游社账号", "managemys"},
      {"米游社签到", "signin"},
      {"悬浮浏览器", "floatweb"},
      {"查询账号信息","getinfo"},
      --{"深渊数据库","abyss"},
      {"查询深渊信息","getabyssinfo"},
    }

    for i, v in ipairs(tooltab) do
      tladp2.add {
        tladp_text = v[1],
        tladp_activity = {
          text = v[2],
          BackgroundDrawable = 波纹2("方自适应")
        }
      }
    end

    _debug_clock("tools_end")

    返回顶部()

    local Popup_layout = {
      LinearLayout,
      {
        CardView,
        CardElevation = "6dp",
        CardBackgroundColor = ctbackc,
        Radius = "8dp",
        layout_width = "-1",
        layout_height = "-2",
        layout_margin = "8dp",
        {
          GridView,
          layout_height = "-1",
          layout_width = "-1",
          NumColumns = 1,
          id = "Popup_list"
        }
      }
    }

    pop = PopupWindow(activity)
    pop.setContentView(loadlayout(Popup_layout))
    pop.setWidth(dp2px(192))
    pop.setHeight(-2)

    pop.setOutsideTouchable(true)
    pop.setBackgroundDrawable(ColorDrawable(0x00000000))
    local Popup_list_item = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "48dp",
      {
        TextView,
        id = "popadp_text",
        textColor = textc,
        layout_width = "-1",
        layout_height = "-1",
        textSize = "14sp",
        gravity = "left|center",
        paddingLeft = "16dp",
        Typeface = AppFont.标准
      }
    }

    local popadp
    local popadp = LuaAdapter(activity, Popup_list_item)

    Popup_list.setAdapter(popadp)

    popadp.add {popadp_text = "关于"}
    popadp.add {popadp_text = "设置"}
    --popadp.add{popadp_text="添加快捷方式"}

    Popup_list.setOnItemClickListener(
    AdapterView.OnItemClickListener {
      onItemClick = function(parent, v, pos, id)
        pop.dismiss()
        local s = v.Tag.popadp_text.Text
        if s == "关于" then
          if obs_1.scrollY < 0.618 * activity.Height - dp2px(56) - 状态栏高度 + 0.5 then
            local scrollYu =
            ObjectAnimator.ofInt(
            obs_1,
            "scrollY",
            {obs_1.scrollY, 0.618 * activity.Height - dp2px(56) - 状态栏高度 + 0.5}
            )
            local papa = math.abs(apa)
            scrollYu.setDuration(256 * papa)
            scrollYu.setInterpolator(DecelerateInterpolator())
            scrollYu.start()
            scrollYu.addListener(
            AnimatorListenerAdapter {
              onAnimationEnd = function(animation)
                --渐变跳转页面("about")
                local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
                intent.putExtra("name", "about")
                local path = activity.getLuaDir() .. "/about.lua"
                intent.setData(Uri.parse("file://" .. path))
                activity.startActivity(
                intent,
                ActivityOptions.makeSceneTransitionAnimation(activity, _title, "title").toBundle()
                )
              end
            }
            )
           else
            local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
            intent.putExtra("name", "about")
            local path = activity.getLuaDir() .. "/about.lua"
            intent.setData(Uri.parse("file://" .. path))
            activity.startActivity(
            intent,
            ActivityOptions.makeSceneTransitionAnimation(activity, _title, "title").toBundle()
            )
          end
        end
        if s == "设置" then
          activity.newActivity("settings")
        end
        if s == "更新软件" then
          更新()
        end
      end
    }
    )

    _debug_clock("pop_end")

    if SDK版本 < 23 then
      hztl.setBackgroundDrawable(ColorDrawable(0x3f000000))
    end

    --静态渐变(转0x(primaryc)-0xc0000000,转0x(secondaryc)-0xc0000000,subtitle_pho_top_z,"竖")

    spage = 1

    gv2.setFocusable(true)
    obs_1.scrollTo(0, 0)

    jc.setOffscreenPageLimit(3)
    jc.setOnPageChangeListener(PageView.OnPageChangeListener {
      onPageScrolled = function(a, b, c)
        --print(a,b,c)
        if a == 0 then
          if apa - (apa) * b >= 0 then
            scrollYEvent(apa - (apa) * b, true)
          end
         elseif a == 1 then
          scrollYEvent(0, true)
        end
      end,
      onPageSelected = function(v)
        spage = v
        if v ~= 0 then
          波纹({_more}, "圆主题")
          if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
            状态栏颜色(0x3F000000, true)
            沉浸状态栏(true)
           else
            状态栏颜色(0xFF424242)
            沉浸状态栏()
          end
         else
          if apa == nil then
            apa = 1
          end
          if apa <= 0.4 then
            波纹({_more}, "圆主题")
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              状态栏颜色(0x3F000000, true)
              沉浸状态栏(true)
             else
              状态栏颜色(0xFF424242)
              沉浸状态栏()
            end
           else
            if themebackgroundlight == "light" then
              波纹({_more}, "圆白")
              状态栏颜色(0xFF424242, false)
              if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
                沉浸状态栏(nil, nil, true)
               else
                沉浸状态栏()
              end
             else
              波纹({_more}, "圆黑")
              状态栏颜色(0x3F000000, false)
              沉浸状态栏(true)
            end
          end
        end
        local x = primaryc
        local c = stextc
        local c1 = c
        local c2 = c
        local c3 = c
        if v == 0 then
          c1 = x
          showD(page1)
          closeD(page2)
          closeD(page3)
        end
        if v == 1 then
          c2 = x
          showD(page2)
          closeD(page1)
          closeD(page3)
        end
        if v == 2 then
          c3 = x
          showD(page3)
          closeD(page1)
          closeD(page2)
        end
        page1.getChildAt(0).setColorFilter(转0x(c1))
        page2.getChildAt(0).setColorFilter(转0x(c2))
        page3.getChildAt(0).setColorFilter(转0x(c3))
        page1.getChildAt(1).setTextColor(转0x(c1))
        page2.getChildAt(1).setTextColor(转0x(c2))
        page3.getChildAt(1).setTextColor(转0x(c3))
      end
    }
    )

    jc.setCurrentItem(0)

    jc.setOverScrollMode(PageView.OVER_SCROLL_NEVER)
    jc.setPageTransformer(
    true,
    PageView.PageTransformer {
      transformPage = function(view, position)
        local alpha = 0
        if position <= 1 and position >= 0 then
          alpha = 1 - position
         elseif position < 0 and position > -1 then
          alpha = position + 1
        end
        view.setAlpha(alpha)
        --view.setTranslationX((-position)*activity.Width*0.8)
      end
    }
    )

    _debug_clock("page_end")

    --[[obs_2.setScrollViewCallbacks(ObservableScrollViewCallbacks{
    --滚动时
    onScrollChanged=function(scrollY,firstScroll,dragging)
      --print(scrollY,firstScroll,dragging)
      obs2_lst=scrollY
      -- param scrollY 在Y轴滚动位置。
      -- firstScroll 是否是第一次（刚开始）滑动
      -- dragging 当前视图是否是因为拖拽而产生滑动
    end,

    --拖拽结束或者取消时
    onUpOrCancelMotionEvent=function(scrollState)
      --print(scrollState)
      if(scrollState==ScrollState.DOWN) then
        --print("向下滚动1");
       elseif(scrollState==ScrollState.UP) then
        if obs2_lst>=5 then
          --print("向上滚动");
          if obs_2.getChildAt(0).measure(0,0).Height<=obs2_lst+activity.Height
            --print("向下滚动3");
          end
         else
          --print("向下滚动2");
        end
       else
        --print("停止滚动");
      end
    end
  })]]
    xpcall(
    function()
      创建文件(内置存储("testpermission.cache"), true)
      写入文件(内置存储("testpermission.cache"), "test", true)
      删除文件(内置存储("testpermission.cache"))
    end,
    function()
      双按钮对话框(
      "未获取到存储权限",
      "软件缺失存储权限可能会造成一些功能异常。\n若跳转到权限页面失败，请手动开启存储权限。",
      "开启权限",
      "取消",
      function()
        关闭对话框(an)
        local mIntent = Intent()
        mIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (Build.VERSION.SDK_INT >= 9) then
          mIntent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS")
          mIntent.setData(Uri.fromParts("package", activity.getPackageName(), nil))
         elseif (Build.VERSION.SDK_INT <= 8) then
          mIntent.setAction(Intent.ACTION_VIEW)
          mIntent.setClassName("com.android.settings", "com.android.setting.InstalledAppDetails")
          mIntent.putExtra("com.android.settings.ApplicationPkgName", activity.getPackageName())
        end
        activity.startActivity(mIntent)
      end,
      function()
        关闭对话框(an)
      end
      )
    end
    )

    _debug_clock("testpermission_end")

    检查更新()

    Http.get(
    "https://api.mukapp.top/gtool_post.php",
    function(code, content, cookie, header)
      printLog("Get post", code)
      if code == 200 then
        local content = content:gsub("\n$", "")
        post.text = content
       else
        post.text = ("公告获取失败")
      end
    end
    )

    Http.get(
    "https://api.mukapp.top/gtool_startpage.php",
    function(code, content, cookie, header)
      printLog("Get startPage", code)
      if code == 200 then
        local tab = loadstring(content)()
        tab = tab[math.random(1, #tab)]
        startphoto_image, startphoto_click = tab[1], tab[2]


        if mukactivity.getData("guide_done") ~= nil then

          startPhoto_top.onClick = function()
            startphoto_click()

            pcall(function()
              sti.stop()
            end)
            sti = nil
            startPage_close = true
            ViewAnimator.animate({startPage})
            .alpha({1, 0}).duration(400)
            .onStop({
              onStop = function()
                控件隐藏(startPage)
              end
            }).start()
          end
          Glide.with(activity).load(startphoto_image).into(startPhoto)
        end
       else
        pcall(
        function()
          sti.stop()
        end
        )
        sti = nil
        startPage_close = true
        ViewAnimator.animate({startPage}).alpha({1, 0}).duration(400).onStop(
        {
          onStop = function()
            控件隐藏(startPage)
          end
        }
        ).start()
      end
    end
    )

    _debug_clock("getservercontent_end")

    sti = Ticker()
    sti.Period = 5000
    sti.onTick = function()
      pcall(
      function()
        sti.stop()
      end
      )
      sti = nil

      if not startPage_close then
        ViewAnimator.animate({startPage}).alpha({1, 0}).duration(400).onStop(
        {
          onStop = function()
            控件隐藏(startPage)
          end
        }
        ).start()
        startPage_close = true
      end
    end
    sti.start()

    startPage_skip.onClick = function()
      pcall(
      function()
        sti.stop()
      end
      )
      sti = nil
      startPage_close = true
      ViewAnimator.animate({startPage}).alpha({1, 0}).duration(400).onStop(
      {
        onStop = function()
          控件隐藏(startPage)
        end
      }
      ).start()
    end

    _debug_clock("startpageticker_end")

    _debug_clock("adddaily_start")

    local dailylayoutp = {
      LinearLayout,
      layout_width = "-2",
      layout_height = "-2",
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "6dp",
        layout_width = "-1",
        layout_height = "-2",
        layout_marginLeft = "8dp",
        layout_marginRight = "8dp",
        {
          LinearLayout,
          layout_width = "-1",
          layout_height = "-2",
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = cardbackc,
            Radius = "4dp",
            layout_width = "-2",
            layout_height = "-2",
            layout_margin = "8dp",
            layout_marginBottom = "8dp",
            layout_marginTop = "8dp",
            layout_gravity = "center",
            {
              LinearLayout,
              layout_width = "-2",
              layout_height = "-2",
              {
                RelativeLayout,
                layout_width = "48dp",
                layout_height = "48dp",
                {
                  ImageView,
                  layout_width = "-1",
                  layout_height = "-1",
                  src = "res/background4",
                  scaleType = "fitCenter",
                  colorFilter = viewshaderc
                },
                {
                  ImageView,
                  layout_width = "-1",
                  layout_height = "-1",
                  --src = i .. "_3",
                  id="pic1",
                  scaleType = "fitCenter",
                  colorFilter = viewshaderc
                }
              },
              {
                LinearLayout,
                layout_width = "-2",
                layout_height = "-2",
                orientation = "vertical",
                {
                  RelativeLayout,
                  layout_width = "24dp",
                  layout_height = "24dp",
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    src = "res/background3",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  },
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    --src = i .. "_2",
                    id="pic2",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  }
                },
                {
                  RelativeLayout,
                  layout_width = "24dp",
                  layout_height = "24dp",
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    src = "res/background2",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  },
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    --src = i .. "_1",
                    id="pic3",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  }
                }
              }
            }
          },
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-2",
            paddingRight = "12dp",
            paddingTop = "8dp",
            paddingBottom = "8dp",
            orientation = "vertical",
            layout_gravity = "center",
            {
              TextView,
              --text = n,
              id="text",
              textColor = textc,
              textSize = "14sp",
              gravity = "center|left",
              Typeface = AppFont.标准,
              layout_width = "-2",
              layout_height = "-2"
              --layout_marginLeft="16dp";
              --layout_marginRight="16dp";
            }
          }
        }
      }
    }
    local dailylayoutw = {
      LinearLayout,
      layout_width = "-2",
      layout_height = "-2",
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "6dp",
        layout_width = "-1",
        layout_height = "-2",
        layout_marginLeft = "8dp",
        layout_marginRight = "8dp",
        {
          LinearLayout,
          layout_width = "-1",
          layout_height = "-2",
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = cardbackc,
            Radius = "4dp",
            layout_width = "-2",
            layout_height = "-2",
            layout_margin = "8dp",
            layout_marginBottom = "8dp",
            layout_marginTop = "8dp",
            layout_gravity = "center",
            {
              LinearLayout,
              layout_width = "-2",
              layout_height = "-2",
              {
                RelativeLayout,
                layout_width = "48dp",
                layout_height = "48dp",
                {
                  ImageView,
                  layout_width = "-1",
                  layout_height = "-1",
                  src = "res/background5",
                  scaleType = "fitCenter",
                  colorFilter = viewshaderc
                },
                {
                  ImageView,
                  layout_width = "-1",
                  layout_height = "-1",
                  --src = i .. "_3",
                  id="pic1",
                  scaleType = "fitCenter",
                  colorFilter = viewshaderc
                }
              },
              {
                LinearLayout,
                layout_width = "-2",
                layout_height = "-2",
                orientation = "vertical",
                {
                  RelativeLayout,
                  layout_width = "24dp",
                  layout_height = "24dp",
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    src = "res/background4",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  },
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    --src = i .. "_2",
                    id="pic2",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  }
                },
                {
                  RelativeLayout,
                  layout_width = "24dp",
                  layout_height = "24dp",
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    src = "res/background3",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  },
                  {
                    ImageView,
                    layout_width = "-1",
                    layout_height = "-1",
                    --src = i .. "_1",
                    id="pic3",
                    scaleType = "fitCenter",
                    colorFilter = viewshaderc
                  }
                }
              }
            }
          },
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-2",
            paddingRight = "12dp",
            paddingTop = "8dp",
            paddingBottom = "8dp",
            orientation = "vertical",
            layout_gravity = "center",
            {
              TextView,
              --text = n,
              id="text",
              textColor = textc,
              textSize = "14sp",
              gravity = "center|left",
              Typeface = AppFont.标准,
              layout_width = "-2",
              layout_height = "-2"
              --layout_marginLeft="16dp";
              --layout_marginRight="16dp";
            }
          }
        }
      }
    }
    local alllayout = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-2",
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "4dp",
        layout_width = "-1",
        layout_height = "-2",
        layout_marginLeft = "8dp",
        layout_marginRight = "8dp",
        {
          LinearLayout,
          layout_width = "-1",
          layout_height = "-2",
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-2",
            paddingRight = "12dp",
            paddingTop = "8dp",
            paddingBottom = "8dp",
            paddingLeft = "12dp",
            orientation = "vertical",
            layout_gravity = "center",
            {
              TextView,
              text = "今天想刷什么刷什么鸭",
              textColor = textc,
              textSize = "14sp",
              gravity = "center|left",
              Typeface = AppFont.标准,
              layout_width = "-2",
              layout_height = "-2"
              --layout_marginLeft="16dp";
              --layout_marginRight="16dp";
            }
          }
        }
      }
    }

    _debug_clock("adddaily_layout_ok")

    talentdata={}
    weapondata={}

    local week = os.date("%a")
    if tointeger(os.date("%H")) < 4 then
      if week == "Mon" then
        week = "Sun"
       elseif week == "Tue" then
        week = "Mon"
       elseif week == "Wed" then
        week = "Tue"
       elseif week == "Thu" then
        week = "Wed"
       elseif week == "Fri" then
        week = "Thu"
       elseif week == "Sat" then
        week = "Fri"
       elseif week == "Sun" then
        week = "Sat"
      end
    end

    talentholder=function(parent,viewType)
      local views={}
      if week=="Sun"
        holder=LuaRecyclerHolder(loadlayout(alllayout,views))
       else
        holder=LuaRecyclerHolder(loadlayout(dailylayoutp,views))
      end
      holder.view.setTag(views)
      return holder
    end

    talentadp=LuaRecyclerViewAdapter(LuaAdapterCreator({
      getItemCount=function()
        return #talentdata
      end,
      getItemViewType=function(position)
        return 0
      end,
      onCreateViewHolder=talentholder,
      onBindViewHolder=function(holder,position)
        view=holder.view.getTag()
        if week~="Sun"
          local adata=talentdata[position+1]
          Glide.with(this).load(adata[2].."_3.png").into(view.pic1)
          Glide.with(this).load(adata[2].."_2.png").into(view.pic2)
          Glide.with(this).load(adata[2].."_1.png").into(view.pic3)
          view.text.text=adata[1]
        end
      end,
    }))

    talent.setAdapter(talentadp)

    local gvmanager=StaggeredGridLayoutManager(1,StaggeredGridLayoutManager.HORIZONTAL)

    talent.setLayoutManager(gvmanager)

    _debug_clock("adddaily_talentsetting")

    weaponholder=function(parent,viewType)
      local views={}
      if week=="Sun"
        holder=LuaRecyclerHolder(loadlayout(alllayout,views))
       else
        holder=LuaRecyclerHolder(loadlayout(dailylayoutw,views))
      end
      holder.view.setTag(views)
      return holder
    end

    weaponadp=LuaRecyclerViewAdapter(LuaAdapterCreator({
      getItemCount=function()
        return #weapondata
      end,
      getItemViewType=function(position)
        return 0
      end,
      onCreateViewHolder=weaponholder,
      onBindViewHolder=function(holder,position)
        view=holder.view.getTag()
        local adata=weapondata[position+1]
        if week~="Sun"
          Glide.with(this).load(adata[2].."_3.png").into(view.pic1)
          Glide.with(this).load(adata[2].."_2.png").into(view.pic2)
          Glide.with(this).load(adata[2].."_1.png").into(view.pic3)
          view.text.text=adata[1]
        end
      end,
    }))

    weapon.setAdapter(weaponadp)

    local gvmanager=StaggeredGridLayoutManager(1,StaggeredGridLayoutManager.HORIZONTAL)

    weapon.setLayoutManager(gvmanager)

    _debug_clock("adddaily_weaponsetting")

    function addDaily(t, n, i)
      if n~="all"
        local i = activity.getLuaDir("res/daily/" .. i)

        if t == 1 then
          talentdata[#talentdata+1]={n,i}
        end
        if t == 2 then
          weapondata[#weapondata+1]={n,i}
        end
       else
        if t == 1 then
          talentdata[#talentdata+1]={n}
        end
        if t == 2 then
          weapondata[#weapondata+1]={n}
        end
      end
    end

    local talenttab = {
      ["Mon"] = {
        {"繁荣", "s0"},
        {"自由", "s5"},
        {"浮世", "s6"}
      },
      ["Tue"] = {
        {"勤劳", "s3"},
        {"抗争", "s2"},
        {"风雅", "s7"}
      },
      ["Wed"] = {
        {"黄金", "s1"},
        {"诗文", "s4"},
        {"天光", "s8"}
      },
      ["Thu"] = {
        {"繁荣", "s0"},
        {"自由", "s5"},
        {"浮世", "s6"}
      },
      ["Fri"] = {
        {"勤劳", "s3"},
        {"抗争", "s2"},
        {"风雅", "s7"}
      },
      ["Sat"] = {
        {"黄金", "s1"},
        {"诗文", "s4"},
        {"天光", "s8"}
      },
      ["Sun"] = "全部"
    }

    _debug_clock("adddaily_addtalent_start")
    local todaytalent = talenttab[week]
    if todaytalent then
      if todaytalent == "全部" then
        addDaily(1, "all")
       else
        for i = 1, #todaytalent do
          addDaily(1, todaytalent[i][1], todaytalent[i][2])
        end
      end
    end
    _debug_clock("adddaily_addtalent_end")

    local weapontab = {
      ["Mon"] = {
        {"高塔孤王", "w0"},
        {"孤云寒林", "w1"},
        {"远海夷地", "w6"}
      },
      ["Tue"] = {
        {"凛风奔狼", "w2"},
        {"雾海云间", "w5"},
        {"鸣神御灵", "w7"}
      },
      ["Wed"] = {
        {"狮牙斗士", "w4"},
        {"漆黑陨铁", "w3"},
        {"今昔剧画", "w8"}
      },
      ["Thu"] = {
        {"高塔孤王", "w0"},
        {"孤云寒林", "w1"},
        {"远海夷地", "w6"}
      },
      ["Fri"] = {
        {"凛风奔狼", "w2"},
        {"雾海云间", "w5"},
        {"鸣神御灵", "w7"}
      },
      ["Sat"] = {
        {"狮牙斗士", "w4"},
        {"漆黑陨铁", "w3"},
        {"今昔剧画", "w8"}
      },
      ["Sun"] = "全部"
    }

    _debug_clock("adddaily_addweapon_start")
    local todayweapon = weapontab[week]
    if todayweapon then
      if todayweapon == "全部" then
        addDaily(2, "all")
       else
        for i = 1, #todayweapon do
          addDaily(2, todayweapon[i][1], todayweapon[i][2])
        end
      end
    end
    _debug_clock("adddaily_addweapon_end")

    --talentadp.notifyDataSetChanged()

    _debug_clock("adddaily_end")

    import "java.text.SimpleDateFormat"

    控件隐藏(switch_memo)

    mukactivity.setDataR("memo_num", 1)

    function dailyNote()
      local cookie = mukactivity.getData("myscookie")

      if cookie == nil then
        控件可见(memo)
        控件隐藏(memo_in)
        memo.Text = "你还没有登录，点击登录米游社账号并设置默认账号"
        strength_p.onClick = function()
          activity.newActivity("tools/managemys")
        end
        return true
      end

      strength_p.onClick = function(view)
        local intent = Intent(activity, luajava.bindClass("com.androlua.LuaActivity"))
        path = activity.getLuaDir() .. "/tools/note.lua"
        intent.setData(Uri.parse("file://" .. path))
        xpcall(
        function()
          activity.startActivity(
          intent,
          ActivityOptions.makeClipRevealAnimation(view, 0, 0, view.getWidth(), view.getHeight()).toBundle()
          )
        end,
        function()
          xpcall(
          function()
            activity.newActivity("tools/note")
          end,
          function(e)
            提示("打开失败：" .. e)
            printLog("Error 1", e)
          end
          )
        end
        )
      end

      function secondtostring(n)
        local day
        local dif = tointeger(os.date("%d", os.time() + n)) - tointeger(os.date("%d"))
        if dif ~= 0 then
          if dif == 1 then
            day = "明天 "
           elseif dif == 2 then
            day = "后天 "
           else
            day = tostring(os.date("%m月%d日 ", os.time() + n))
          end
         else
          day = "今天 "
        end
        return day .. os.date("%H时%M分", os.time() + n)
      end

      Http.get(
      "https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
      cookie,
      nil,
      nil,
      function(code, content)
        if code ~= 200 then
          控件可见(memo)
          控件隐藏(memo_in)
          memo.Text = "获取失败：" .. code
          return true
        end

        local content = JSON.decode(content)

        if content.message ~= "OK" then
          控件可见(memo)
          控件隐藏(memo_in)
          memo.Text = "获取失败：" .. content.message
          return true
        end

        local serverid
        local uid

        if #content.data.list > 1 then
          控件可见(switch_memo)
          serverid = content.data.list[mukactivity.getData("memo_num")].region
          uid = content.data.list[mukactivity.getData("memo_num")].game_uid
          switch_memo.onClick = function()
            local bwz
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              bwz = 0x3f000000
             else
              bwz = 0x3fffffff
            end

            local memo_dialog_layout = {
              LinearLayout,
              layout_width = "-1",
              layout_height = "-1",
              {
                LinearLayout,
                orientation = "vertical",
                layout_width = "-1",
                layout_height = "-2",
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-2",
                  textSize = "20sp",
                  layout_marginTop = "24dp",
                  layout_marginLeft = "24dp",
                  layout_marginRight = "24dp",
                  Text = "切换账号",
                  Typeface = AppFont.特粗,
                  textColor = primaryc
                },
                {
                  GridView,
                  layout_width = "-1",
                  layout_height = "-1",
                  layout_weight = "1",
                  id = "memo_gv",
                  paddingTop = "8dp",
                  paddingBottom = "8dp"
                },
                {
                  LinearLayout,
                  orientation = "horizontal",
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "right|center",
                  {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = function()
                      关闭对话框(memo_dialog_show)
                    end,
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "16sp",
                      Typeface = AppFont.特粗,
                      paddingRight = "16dp",
                      paddingLeft = "16dp",
                      paddingTop = "8dp",
                      paddingBottom = "8dp",
                      Text = "关闭",
                      textColor = stextc,
                      BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                      ColorStateList(int[0].class {int {}}, int {bwz})
                      )
                    }
                  }
                }
              }
            }

            memo_dialog = BottomDialog(activity)
            memo_dialog.setView(loadlayout(memo_dialog_layout))
            memo_dialog.setGravity(Gravity.BOTTOM)
            memo_dialog.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
            memo_dialog.setMinHeight(0)
            memo_dialog.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
            --设置圆角
            memo_dialog.setRadius(dp2px(16), 转0x(backgroundc))
            memo_dialog.setCancelable(true)
            memo_dialog.setCanceledOnTouchOutside(true)
            memo_dialog_show = memo_dialog.show()

            local memo_list_item = {
              LinearLayout,
              layout_width = "-1",
              layout_height = "48dp",
              onClick = function()
              end,
              {
                RelativeLayout,
                layout_width = "-1",
                layout_height = "-1",
                {
                  TextView,
                  id = "tladp_text",
                  textColor = textc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-1",
                  paddingLeft = "24dp"
                },
                {
                  TextView,
                  id = "tladp_activity",
                  layout_width = "-1",
                  layout_height = "-1",
                  onClick = function(v)
                    mukactivity.setData("memo_num", tointeger(v.Text))
                    关闭对话框(memo_dialog_show)
                    提示("切换成功，请等待数据更新")

                    dailyNote()
                    tidailyNote.stop()
                    tidailyNote = Ticker()
                    tidailyNote.Period = tointeger(mukactivity.getData("Note_Time")) * 60 * 1000
                    tidailyNote.onTick = function()
                      dailyNote()
                    end
                    tidailyNote.start()
                    pcall(
                    function()
                      LuaService.getService().runFunc("dailyNote2", nil)
                    end
                    )
                    --print("start")
                    if mukactivity.getData("Note_Notification") == "true" then
                      if LuaService.getService() == nil then
                        --print("启用服务")
                        activity.startService()
                      end
                    end
                  end,
                  textColor = "#00000000"
                }
              }
            }

            local memo_dialog_adp
            memo_dialog_adp = LuaAdapter(activity, memo_list_item)

            memo_gv.setAdapter(memo_dialog_adp)

            for i, v in ipairs(content.data.list) do
              memo_dialog_adp.add {
                tladp_text = "UID: " .. v.game_uid,
                tladp_activity = {
                  text = tostring(i),
                  BackgroundDrawable = 波纹2("方自适应")
                }
              }
            end
          end
         else
          控件隐藏(switch_memo)
          serverid = content.data.list[1].region
          uid = content.data.list[1].game_uid
        end

        local ds = getNewDS("role_id=" .. uid .. "&server=" .. serverid)

        --print(ds)

        local map = HashMap()
        map.put("DS", ds)
        map.put("Origin", "https://webstatic.mihoyo.com")
        map.put("x-rpc-app_version", "2.11.1")
        map.put(
        "User-Agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) miHoYoBBS/2.11.1"
        )
        map.put("x-rpc-client_type", "5")
        map.put("Referer", "https://webstatic.mihoyo.com/")
        --map.put("x-rpc-device_id",string.upper(tostring(UUID.randomUUID()):gsub("%-","")))
        map.put("X-Requested-With", "com.mihoyo.hyperion")

        Http.get(
        "https://api-takumi-record.mihoyo.com/game_record/app/genshin/api/dailyNote?server=" ..
        serverid .. "&role_id=" .. uid,
        cookie,
        nil,
        map,
        function(code, content)
          if code ~= 200 then
            --("请求失败，错误码："..code)
            控件可见(memo)
            控件隐藏(memo_in)
            memo.Text = "获取失败：" .. code
            return true
          end

          local content = JSON.decode(content)

          if content.message == "OK" then
            --[[
          current_resin--当前树脂
          max_resin--最大树脂
          resin_recovery_time--树脂 时间

          current_home_coin--当前 洞天宝钱
          max_home_coin--最大 洞天宝钱
          home_coin_recovery_time--洞天宝钱 剩余时间（秒）

          total_task_num--总 委托
          finished_task_num--完成 委托
          is_extra_task_reward_received--是否完成委托？

          current_expedition_num--完成 派遣
          max_expedition_num--最大 派遣
          expeditions--探索派遣 table
  ["expeditions"]	= {
      [1]	= {
          ["status"]	= "Ongoing" ;
          ["remained_time"]	= "68562" ;
          ["avatar_side_icon"]	= "https://upload-bbs.mihoyo.com/game_record/genshin/character_side_icon/UI_AvatarIcon_Side_Ambor.png" ;
          } ;
      } ;

          remain_resin_discount_num--值得铭记的强敌 减半次数
          resin_discount_num_limit--值得铭记的强敌 最大次数
          
          transformer--参量质变仪 table
{
  ["transformer"]	= {
      ["noticed"]	= false ;
      ["obtained"]	= true ;
      ["recovery_time"]	= {
          ["Day"]	= 0 ;
          ["Second"]	= 0 ;
          ["Minute"]	= 0 ;
          ["reached"]	= true ;
          ["Hour"]	= 0 ;
          } ;
      ["latest_job_id"]	= "0" ;
      } ;
  } ;

["transformer"]	= {
      ["obtained"]	= true ;
      ["wiki"]	= "https://bbs.mihoyo.com/ys/obc/content/1562/detail?bbs_presentation_style=no_header" ;
      ["latest_job_id"]	= "0" ;
      ["noticed"]	= false ;
      ["recovery_time"]	= {
          ["Day"]	= 6 ;
          ["reached"]	= false ;
          ["Second"]	= 0 ;
          ["Minute"]	= 0 ;
          ["Hour"]	= 0 ;
          } ;
      } ;

          ]]
            控件隐藏(memo)
            控件可见(memo_in)

            local data = content.data

            strength_num.Text = "原粹树脂 " .. data.current_resin .. "/" .. data.max_resin
            if data.resin_recovery_time == "0" then
              strength_time.Text = "树脂溢出了呜呜呜"
             else
              strength_time.Text = "将于 " .. secondtostring(tointeger(data.resin_recovery_time)) .. " 全部恢复"
            end
            task_num.Text = "每日委托 " .. data.finished_task_num .. "/" .. data.total_task_num
            expedition_num.Text = "探索派遣 " .. data.current_expedition_num .. "/" .. data.max_expedition_num

            local expedition_stime = 0

            for i, v in pairs(data.expeditions) do
              if tointeger(v.remained_time) > expedition_stime then
                expedition_stime = tointeger(v.remained_time)
              end
            end

            if expedition_stime == 0 then
              expedition_time.Text = "派遣已经全部完成了"
             else
              expedition_time.Text = "将于 " .. secondtostring(tointeger(expedition_stime)) .. " 全部完成"
            end
            coin_num.Text = "洞天宝钱\n" .. data.current_home_coin .. "/" .. data.max_home_coin
            discount_num.Text = "周本减半\n" .. data.remain_resin_discount_num .. "/" .. data.resin_discount_num_limit

            if data.transformer.obtained
              if data.transformer.recovery_time.reached
                transformer_num.Text = "参量质变仪 可使用"
                控件隐藏(transformer_time)
               else
                transformer_num.Text = "参量质变仪 "
                local transformertime=data.transformer.recovery_time
                transformer_time.Text = "将在 "..transformertime.Day.."天 后恢复"
                控件可见(transformer_time)
              end
             else
              transformer_num.Text = "参量质变仪 未获得"
              控件隐藏(transformer_time)
            end
           else
            strength_num.Text = "原粹树脂"
            strength_time.Text = "恢复时间"
            task_num.Text = "每日委托"
            expedition_num.Text = "探索派遣"
            expedition_time.Text = "剩余时间"
            coin_num.Text = "洞天宝钱"
            discount_num.Text = "周本减半"
            transformer_num.Text = "参量质变仪"
            transformer_time.Text = "剩余时间"
            控件可见(memo)
            控件隐藏(memo_in)
            if content.message:find("not public") then
              memo.Text = "获取失败：" .. content.message .. "\n请到米游社内找到 我的-我的角色-实时便笺 开启实时便笺功能"
              return true
            end
            memo.Text = "获取失败：" .. content.message
          end
        end
        )
      end
      )
    end
    dailyNote()

    _debug_clock("dailynote_end")

    mukactivity.setDataR("Note_Notification", "true")
    mukactivity.setDataR("Note_Notification_Ongoing", "true")
    mukactivity.setDataR("Note_Auto_Sign", "true")
    mukactivity.setDataR("Note_Auto_Sign2", "true")

    mukactivity.setDataR("Note_Time", 1)

    if mukactivity.getData("Note_Notification") == "true" then
      if LuaService.getService() == nil then
        --print("启用服务")
        activity.startService()
       else
        activity.stopService()
        activity.startService()
      end
    end

    _debug_clock("service_end")

    ta_item = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-2",
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "8dp",
        layout_width = "-1",
        layout_height = "-2",
        layout_margin = "16dp",
        layout_marginTop = "8dp",
        layout_marginBottom = "8dp",
        {
          LinearLayout,
          orientation = "vertical",
          layout_height = "-1",
          layout_width = "-1",
          id = "go",
          {
            LinearLayout,
            layout_height = "-2",
            layout_width = "-1",
            gravity = "left|center",
            paddingTop = "16dp",
            {
              CardView,
              CardElevation = "0dp",
              CardBackgroundColor = cardbackc,
              Radius = "16dp",
              layout_width = "32dp",
              layout_height = "32dp",
              layout_marginLeft = "16dp",
              {
                ImageView,
                layout_height = "-1",
                layout_width = "-1",
                id = "userimg"
              }
            },
            {
              LinearLayout,
              orientation = "vertical",
              layout_height = "-2",
              layout_width = "-1",
              {
                TextView,
                textColor = textc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.粗体,
                paddingLeft = "12dp",
                id = "username"
              },
              {
                TextView,
                textColor = stextc,
                textSize = "12sp",
                gravity = "center|left",
                Typeface = AppFont.标准,
                paddingLeft = "12dp",
                id = "updatetime"
              }
            }
          },
          {
            TextView,
            textColor = textc,
            textSize = "16sp",
            gravity = "center|left",
            Typeface = AppFont.特粗,
            padding = "16dp",
            paddingTop = "8dp",
            paddingBottom = "0",
            id = "title"
          },
          {
            TextView,
            textColor = textc,
            textSize = "14sp",
            --gravity="center|left";
            Typeface = AppFont.标准,
            padding = "16dp",
            paddingTop = "4dp",
            paddingBottom = "4dp",
            layout_width = "-1",
            layout_height = "-2",
            id = "content",
            maxLines = "5"
          },
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = cardbackc,
            Radius = "6dp",
            layout_width = "-2",
            layout_height = "-2",
            layout_marginLeft = "16dp",
            layout_marginRight = "16dp",
            layout_marginTop = "8dp",
            layout_marginBottom = "4dp",
            {
              TextView,
              textColor = stextc,
              textSize = "12sp",
              gravity = "center|left",
              Typeface = AppFont.标准,
              padding = "8dp",
              paddingTop = "4dp",
              paddingBottom = "4dp",
              id = "topic"
            }
          },
          {
            LinearLayout,
            layout_height = "-2",
            layout_width = "-1",
            --paddingBottom="8dp",
            --paddingLeft="8dp",
            --paddingRight="8dp",
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              gravity = "center",
              layout_weight = "1",
              padding = "8dp",
              paddingBottom = "16dp",
              paddingLeft = "16dp",
              {
                ImageView,
                layout_width = "28dp",
                layout_height = "28dp",
                padding = "4dp",
                ColorFilter = stextc,
                src = 图标("thumb_down"),
                id = "vote_down_count_img"
              },
              {
                TextView,
                text = "0",
                textColor = stextc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.标准,
                paddingLeft = "4dp",
                paddingRight = "4dp",
                id = "vote_down_count"
              }
            },
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              gravity = "center",
              layout_weight = "1",
              padding = "8dp",
              paddingBottom = "16dp",
              {
                ImageView,
                layout_width = "28dp",
                layout_height = "28dp",
                padding = "4dp",
                ColorFilter = stextc,
                src = 图标("comment"),
                id = "comment_count_img"
              },
              {
                TextView,
                text = "0",
                textColor = stextc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.标准,
                paddingLeft = "4dp",
                paddingRight = "4dp",
                id = "comment_count"
              }
            },
            {
              LinearLayout,
              layout_height = "-1",
              layout_width = "-1",
              gravity = "center",
              layout_weight = "1",
              padding = "8dp",
              paddingBottom = "16dp",
              paddingRight = "16dp",
              {
                ImageView,
                layout_width = "28dp",
                layout_height = "28dp",
                padding = "4dp",
                ColorFilter = stextc,
                src = 图标("thumb_up"),
                id = "vote_up_count_img"
              },
              {
                TextView,
                text = "0",
                textColor = stextc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.标准,
                paddingLeft = "4dp",
                paddingRight = "4dp",
                id = "vote_up_count"
              }
            }
          }
        }
      }
    }

    ta_empty = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-2",
      {
        TextView,
        layout_width = "-1",
        layout_height = "-2",
        id = "empty"
      }
    }

    import "android.graphics.Color"
    ta_article_data = {}

    _debug_clock("markwon_start")

    local tableTheme =
    TableTheme.Builder().tableCellPadding(dp2px(12)).tableBorderColor(转0x(cardbackc)).tableBorderWidth(dp2px(2)).tableOddRowBackgroundColor(
    转0x(cardbackc)
    ).tableEvenRowBackgroundColor(转0x(cardbackc)).tableHeaderRowBackgroundColor(转0x(primaryc) - 0x7f000000).build()

    markwon =
    Markwon.builder(this).usePlugin(
    MarkwonPlugin {
      configureTheme = function(builder)
        builder.linkColor(转0x(primaryc)).blockMargin(dp2px(16)).blockQuoteWidth(dp2px(4)).blockQuoteColor(
        --文本内容前的起始边距
        --引用条纹宽度
        转0x(primaryc)
        ).listItemColor(转0x(primaryc)).bulletListItemStrokeWidth(dp2px(2)).bulletWidth(dp2px(8)).codeTextColor(
        --引用条纹颜色
        --列表项颜色
        --项目符号列表项的边框宽度（2 级）
        --项目符号的宽度
        转0x(textc)
        ).codeBackgroundColor(转0x(cardbackc)).codeBlockTextColor(转0x(textc)).codeBlockBackgroundColor(
        --内联代码
        --块代码
        转0x(cardbackc)
        ).codeBlockMargin(dp2px(8)).headingBreakHeight(dp2px(12)).headingBreakColor(转0x(primaryc) - 0x7f000000).headingTypeface(
        --块代码内容的前导边距
        --H1和H2下的刹车高度
        --H1和H2下刹车的颜色
        AppFont.粗体
        ).thematicBreakColor(转0x(cardbackc)).thematicBreakHeight(dp2px(2))
        --标题字体
        --主题休息的颜色
        --主题休息的高度
      end,
      configureConfiguration = function(builder)
        builder.linkResolver(
        LinkResolver {
          resolve = function(view, link)
            if link:find("^image%:%:") then
              activity.newActivity("tanutai/viewimage", {link:match("^image%:%:(.+)")})
             elseif link:find("^copy%:%:") then
              复制文本(link:match("^copy%:%:(.+)"))
              提示("已复制文本")
             elseif link:find("^bilibili%:%:") then
              提示("正在获取视频信息")
              local bv
              local page
              if link:find("|") then
                bv,
                page = link:match("^bilibili%:%:(.-)|(.+)")
               else
                bv = link:match("^bilibili%:%:(.+)")
              end
              local url = "https://api.bilibili.com/x/web-interface/view?bvid=" .. bv
              Http.get(
              url,
              function(code, content)
                if code == 200 then
                  local content = JSON.decode(content)
                  if content.code == "0" then
                    提示("获取视频信息失败：" .. content.message)
                   else
                    local aid = content.data.aid
                    local pages = content.data.pages
                    local pagesinfo = {}
                    for i = 1, #pages do
                      pagesinfo[#pagesinfo + 1] = {
                        pages[i].cid,
                        pages[i].dimension.width,
                        pages[i].dimension.height
                      }
                    end
                    activity.newActivity("tanutai/bili", {aid, bv, pagesinfo, page})
                  end
                 else
                  提示("获取视频信息失败：" .. code)
                end
              end
              )
             else
              if link:find("^http%:") or link:find("^https%:") then
                activity.newActivity("web", {link})
               else
                浏览器打开(link)
              end
            end
          end
        }
        )
      end,
      processMarkdown = function(x)
        --print(x)
        return x
      end
    }
    ).usePlugin(LinkifyPlugin.create()).usePlugin(
    --.usePlugin(MovementMethodPlugin.create(BetterLinkMovementMethod.getInstance()))
    GlideImagesPlugin.create(
    GlideImagesPlugin.GlideStore {
      load = function(drawable)
        local link = drawable.getDestination()
        local glideUrl
        if link:find("tanutai%-1254044507") then
          glideUrl =
          GlideUrl(link, LazyHeaders.Builder().addHeader("Referer", "https://tanutai.mukapp.top").build())
         else
          glideUrl =
          GlideUrl(
          link,
          LazyHeaders.Builder().build()
          --.addHeader("Referer", "https://tanutai.mukapp.top")
          )
        end
        return Glide.with(this).load(glideUrl).transition(
        --.placeholder(BitmapDrawable(loadbitmap("res/loading_image.png")))
        DrawableTransitionOptions.with(DrawableCrossFadeFactory.Builder(328).setCrossFadeEnabled(true).build())
        ).override(activity.Width - dp2px(16 * 2 * 2), dp2px(80)).fitCenter()
      end,
      cancel = function(target)
        Glide.with(this).clear(target)
      end
    }
    )
    ).usePlugin(StrikethroughPlugin.create()).usePlugin(TablePlugin.create(tableTheme)).usePlugin(
    TaskListPlugin.create(转0x(primaryc), 转0x(stextc), 转0x(backgroundc))
    ).usePlugin(
    HtmlPlugin.create(
    HtmlPlugin.HtmlConfigure {
      configureHtml = function(plugin)
        plugin.addHandler(
        SimpleTagHandlerImpl(
        CallBack {
          getSpans = function(configuration, renderProps, tag)
            local spans = ArrayList()
            if tag.attributes().get("color") ~= nil and tag.attributes().get("color") ~= "" then
              spans.add(ForegroundColorSpan(转0x(tag.attributes().get("color"))))
            end
            return spans.toArray()
          end,
          supportedTags = function()
            return Collections.singleton("font")
          end
        }
        )
        )
      end
    }
    )
    ).usePlugin(MarkwonInlineParserPlugin.create()).usePlugin(MovementMethodPlugin.none()).build()

    _debug_clock("markwon_end")

    ta_article_adp =
    LuaRecyclerViewAdapter(
    LuaAdapterCreator(
    {
      getItemCount = function()
        return #ta_article_data + 3
      end,
      getItemViewType = function(position)
        if position == 0 then
          return 1
         elseif position == (#ta_article_data + 1) then
          return 2
         elseif position == (#ta_article_data + 2) then
          return 3
         else
          return 0
        end
      end,
      onCreateViewHolder = function(parent, viewType)
        local viewType = tointeger(viewType)
        if viewType == 0 then
          local views = {}
          holder0 = LuaRecyclerHolder(loadlayout(ta_item, views))
          holder0.view.setTag(views)
          return holder0
         elseif viewType == 1 then
          local views = {}
          holder1 = LuaRecyclerHolder(loadlayout(ta_empty, views))
          holder1.view.setTag(views)
          return holder1
         elseif viewType == 2 then
          local views = {}
          holder2 = LuaRecyclerHolder(loadlayout(ta_empty, views))
          holder2.view.setTag(views)
          return holder2
         elseif viewType == 3 then
          local views = {}
          holder3 = LuaRecyclerHolder(loadlayout(ta_empty, views))
          holder3.view.setTag(views)
          return holder3
        end
      end,
      onBindViewHolder = function(holder, position, payload)
        local view = holder.view.getTag()
        if ta_article_adp.getItemViewType(position) == 1 then
          local linearParams = view.empty.getLayoutParams()
          linearParams.height = 状态栏高度 + dp2px(56 + 8)
          view.empty.setLayoutParams(linearParams)
         elseif ta_article_adp.getItemViewType(position) == 2 then
          local linearParams = view.empty.getLayoutParams()
          linearParams.height = dp2px(112 + 8)
          view.empty.setLayoutParams(linearParams)
         elseif ta_article_adp.getItemViewType(position) == 3 then
          local linearParams = view.empty.getLayoutParams()
          linearParams.height = 导航栏高度 + dp2px(56)
          view.empty.setLayoutParams(linearParams)
         else
          view.title.Text = ta_article_data[position]["title"]
          view.username.Text = ta_article_data[position].relationships.user.username
          view.updatetime.Text = 友好时间(ta_article_data[position].create_time)
          view.topic.Text = ta_article_data[position].relationships.topics[1].name
          if ta_article_data[position].relationships.voting == "up" then
            view.vote_up_count_img.setColorFilter(转0x(primaryc))
            view.vote_down_count_img.setColorFilter(转0x(stextc))
            view.vote_up_count.setTextColor(转0x(primaryc))
            view.vote_down_count.setTextColor(转0x(stextc))
           elseif ta_article_data[position].relationships.voting == "down" then
            view.vote_up_count_img.setColorFilter(转0x(stextc))
            view.vote_down_count_img.setColorFilter(转0x(primaryc))
            view.vote_up_count.setTextColor(转0x(stextc))
            view.vote_down_count.setTextColor(转0x(primaryc))
           else
            view.vote_up_count_img.setColorFilter(转0x(stextc))
            view.vote_down_count_img.setColorFilter(转0x(stextc))
            view.vote_up_count.setTextColor(转0x(stextc))
            view.vote_down_count.setTextColor(转0x(stextc))
          end
          view.comment_count.Text = tostring(ta_article_data[position].comment_count)
          view.vote_up_count.Text = tostring(ta_article_data[position].vote_up_count)
          view.vote_down_count.Text = tostring(ta_article_data[position].vote_down_count)

          view.comment_count.getParent().setBackground(波纹2("方自适应"))
          view.comment_count.getParent().onClick = function()
          end

          view.vote_up_count.getParent().setBackground(波纹2("方自适应"))
          view.vote_up_count.getParent().onClick = function(v)
            ta_article_data[position].l_vote_up_count = ta_article_data[position].vote_up_count
            ta_article_data[position].l_vote_down_count = ta_article_data[position].vote_down_count
            ta_article_data[position].relationships.l_voting = ta_article_data[position].relationships.voting

            if ta_article_data[position].relationships.voting == "up" then
              local oldDatas = ta_article_data

              ta_article_data[position].vote_up_count = ta_article_data[position].vote_up_count - 1
              ta_article_data[position].relationships.voting = ""
              --ta_article_adp.notifyDataSetChanged()
              ta_article_adp.notifyItemChanged(position)

              tanutai.articlesVoters(
              ta_article_data[position].article_id,
              nil,
              function(content)
                if content.code ~= 0 then
                  提示("取消失败：" .. code)
                  ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                  ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                  ta_article_data[position].relationships.voting =
                  ta_article_data[position].relationships.l_voting
                  --ta_article_adp.notifyDataSetChanged()
                  ta_article_adp.notifyItemChanged(position)
                 else
                end
              end,
              function(code, content)
                提示("取消失败：" .. code)
                ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                ta_article_data[position].relationships.voting =
                ta_article_data[position].relationships.l_voting
                --ta_article_adp.notifyDataSetChanged()
                ta_article_adp.notifyItemChanged(position)
              end
              )
              return true
             elseif ta_article_data[position].relationships.voting == "down" then
              ta_article_data[position].vote_up_count = ta_article_data[position].vote_up_count + 1
              ta_article_data[position].vote_down_count = ta_article_data[position].vote_down_count - 1
             else
              ta_article_data[position].vote_up_count = ta_article_data[position].vote_up_count + 1
            end
            ta_article_data[position].relationships.voting = "up"
            --ta_article_adp.notifyDataSetChanged()
            ta_article_adp.notifyItemChanged(position)
            tanutai.articlesVoters(
            ta_article_data[position].article_id,
            "up",
            function(content)
              --print(dump(content))
              if content.code ~= 0 then
                提示("点赞失败：" .. code)
                ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                ta_article_data[position].relationships.voting =
                ta_article_data[position].relationships.l_voting
                --ta_article_adp.notifyDataSetChanged()
                ta_article_adp.notifyItemChanged(position)
               else
              end
            end,
            function(code, content)
              提示("点赞失败：" .. code)
              ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
              ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
              ta_article_data[position].relationships.voting = ta_article_data[position].relationships.l_voting
              --ta_article_adp.notifyDataSetChanged()
              ta_article_adp.notifyItemChanged(position)
            end
            )
          end

          view.vote_down_count.getParent().setBackground(波纹2("方自适应"))
          view.vote_down_count.getParent().onClick = function(v)
            ta_article_data[position].l_vote_up_count = ta_article_data[position].vote_up_count
            ta_article_data[position].l_vote_down_count = ta_article_data[position].vote_down_count
            ta_article_data[position].relationships.l_voting = ta_article_data[position].relationships.voting

            if ta_article_data[position].relationships.voting == "down" then
              ta_article_data[position].vote_down_count = ta_article_data[position].vote_down_count - 1
              ta_article_data[position].relationships.voting = ""
              --ta_article_adp.notifyDataSetChanged()
              ta_article_adp.notifyItemChanged(position)
              tanutai.articlesVoters(
              ta_article_data[position].article_id,
              nil,
              function(content)
                if content.code ~= 0 then
                  提示("取消失败：" .. code)
                  ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                  ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                  ta_article_data[position].relationships.voting =
                  ta_article_data[position].relationships.l_voting
                  --ta_article_adp.notifyDataSetChanged()
                  ta_article_adp.notifyItemChanged(position)
                 else
                end
              end,
              function(code, content)
                提示("取消失败：" .. code)
                ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                ta_article_data[position].relationships.voting =
                ta_article_data[position].relationships.l_voting
                --ta_article_adp.notifyDataSetChanged()
                ta_article_adp.notifyItemChanged(position)
              end
              )
              return true
             elseif ta_article_data[position].relationships.voting == "up" then
              ta_article_data[position].vote_up_count = ta_article_data[position].vote_up_count - 1
              ta_article_data[position].vote_down_count = ta_article_data[position].vote_down_count + 1
             else
              ta_article_data[position].vote_down_count = ta_article_data[position].vote_down_count + 1
            end
            ta_article_data[position].relationships.voting = "down"
            --ta_article_adp.notifyDataSetChanged()
            ta_article_adp.notifyItemChanged(position)
            tanutai.articlesVoters(
            ta_article_data[position].article_id,
            "down",
            function(content)
              --print(dump(content))
              if content.code ~= 0 then
                提示("点踩失败：" .. code)
                ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
                ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
                ta_article_data[position].relationships.voting =
                ta_article_data[position].relationships.l_voting
                --ta_article_adp.notifyDataSetChanged()
                ta_article_adp.notifyItemChanged(position)
               else
              end
            end,
            function(code, content)
              提示("点踩失败：" .. code)
              ta_article_data[position].vote_up_count = ta_article_data[position].l_vote_up_count
              ta_article_data[position].vote_down_count = ta_article_data[position].l_vote_down_count
              ta_article_data[position].relationships.voting = ta_article_data[position].relationships.l_voting
              --ta_article_adp.notifyDataSetChanged()
              ta_article_adp.notifyItemChanged(position)
            end
            )
          end

          --view.content.setText(Html.fromHtml(ta_article_data[position].content_rendered))

          local con = ta_article_data[position].content_markdown

          --view.content.setText(markdownProcessor.parse(con));
          markwon.setMarkdown(view.content, con)
          --view.content.setSpannableFactory(NoCopySpannableFactory.getInstance())

          Glide.with(this).load(ta_article_data[position].relationships.user.avatar.small).transition(
          DrawableTransitionOptions.with(
          DrawableCrossFadeFactory.Builder(328).setCrossFadeEnabled(true).build()
          )
          ).into(view.userimg)

          view.go.setBackground(波纹2("方自适应"))
          view.go.onClick = function()
            activity.newActivity("tanutai/articles", {ta_article_data[position]})
            function articleInfoChanged(up, down, voting)
              ta_article_data[position].vote_up_count = up
              ta_article_data[position].vote_down_count = down
              ta_article_data[position].relationships.voting = voting
              ta_article_adp.notifyItemChanged(position)
            end
          end
          view.go.onLongClick = function()
            print()
            return true
          end
        end
      end
    }
    )
    )

    tarv1.setAdapter(ta_article_adp)
    tarv1_glm =
    GridLayoutManager(activity, 1).setSpanSizeLookup(
    LuaSpanSizeLookup(
    luaSpanSizeLookup {
      getSpanSize = function(position)
        return int(1)
      end,
      getSpanIndex = function(i, i2)
        return int(0)
      end
    }
    )
    )
    tarv1.setLayoutManager(tarv1_glm)

    tarv1_lPos = 0

    tarv1.setScrollViewCallbacks(
    ObservableScrollViewCallbacks {
      --滚动时
      onScrollChanged = function(scrollY, firstScroll, dragging)
        --print(scrollY,firstScroll,dragging)
        tarv1_lst = scrollY
        -- param scrollY 在Y轴滚动位置。
        -- firstScroll 是否是第一次（刚开始）滑动
        -- dragging 当前视图是否是因为拖拽而产生滑动
        if tarv1_lPos ~= tarv1_glm.findLastVisibleItemPosition() + 1 then
          tarv1_lPos = tarv1_glm.findLastVisibleItemPosition() + 1
          if (tarv1_lPos == ta_article_adp.getItemCount()) and tarv1_lPos ~= 3 then
            tarefresh1.setProgressViewOffset(true, 状态栏高度 + dp2px(56 - 8), screenY - 导航栏高度 - dp2px(56 + 64))
            获取文章()
           elseif tarefresh1.setProgressViewOffset(true, 状态栏高度 + dp2px(56 - 8), 状态栏高度 + dp2px(56 - 8 + 48)) then
          end
        end
      end,
      --按下
      onDownMotionEvent = function()
        --print("按下")
      end,
      --拖拽结束或者取消时
      onUpOrCancelMotionEvent = function(scrollState)
        if (scrollState == ScrollState.DOWN) then
          --print("向下滚动1");
          translationUp = ObjectAnimator.ofFloat(tatopbar, "Y", {tatopbar.getY(), 0})
          translationUp.setInterpolator(DecelerateInterpolator())
          translationUp.setDuration(256)
          translationUp.start()

          MFBshow(floatbutton_newarticle)
         elseif (scrollState == ScrollState.UP) then
          if tarv1_lst >= 5 then
            --print("向上滚动");
            translationUp = ObjectAnimator.ofFloat(tatopbar, "Y", {tatopbar.getY(), dp2px(-56) - 状态栏高度 - 2})
            translationUp.setInterpolator(DecelerateInterpolator())
            translationUp.setDuration(256)
            translationUp.start()

            MFBhide(floatbutton_newarticle)
           else
            --print("向下滚动2");
            translationUp = ObjectAnimator.ofFloat(tatopbar, "Y", {tatopbar.getY(), 0})
            translationUp.setInterpolator(DecelerateInterpolator())
            translationUp.setDuration(256)
            translationUp.start()

            MFBshow(floatbutton_newarticle)
          end
         else
          --print("停止滚动");
        end
      end
    }
    )

    tarefresh1.setProgressViewOffset(true, 状态栏高度 + dp2px(56 - 8), 状态栏高度 + dp2px(56 - 8 + 48))
    tarefresh1.setColorSchemeColors({转0x(primaryc), 转0x(primaryc) - 0x9f000000})
    tarefresh1.setProgressBackgroundColorSchemeColor(转0x(backgroundc))
    tarefresh1.setSize(SwipeRefreshLayout.DEFAULT)

    tarefresh1.setOnRefreshListener(
    SwipeRefreshLayout.OnRefreshListener {
      onRefresh = function()
        ta_article_page = 1
        获取文章()
        获取用户信息()
      end
    }
    )

    function 获取用户信息()
      tanutai.user(
      "",
      function(content)
        if content.code == 0 then
          Glide.with(this).load(content.data.avatar.small).into(ta_usericon)
          ta_username.Text = content.data.username

          tauserclick.onClick = function()
            local bwz
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
              bwz = 0x3f000000
             else
              bwz = 0x3fffffff
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
                paddingTop = "16dp",
                paddingBottom = "24dp",
                {
                  LinearLayout,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "center|left",
                  --background=cardbackc,
                  paddingTop = "8dp",
                  paddingBottom = "8dp",
                  {
                    CardView,
                    CardElevation = "0dp",
                    CardBackgroundColor = cardbackc,
                    Radius = "20dp",
                    layout_width = "40dp",
                    layout_height = "40dp",
                    layout_marginLeft = "28dp",
                    {
                      ImageView,
                      layout_height = "-1",
                      layout_width = "-1",
                      id = "mydia_usericon"
                    }
                  },
                  {
                    TextView,
                    textColor = textc,
                    textSize = "20sp",
                    layout_width = "-1",
                    gravity = "center|left",
                    paddingLeft = "12dp",
                    Typeface = AppFont.粗体,
                    id = "mydia_username"
                  }
                },
                {
                  LinearLayout,
                  layout_height = "-2",
                  layout_width = "-1",
                  gravity = "left|center",
                  id = "mydia_userpage",
                  onClick = function()
                    Snakebar("感谢大家对该软件的支持~")
                  end,
                  {
                    ImageView,
                    ColorFilter = textc,
                    src = 图标("person"),
                    layout_height = "48dp",
                    layout_width = "48dp",
                    layout_marginLeft = "24dp",
                    padding = "12dp"
                  },
                  {
                    TextView,
                    text = "个人主页",
                    textSize = "14sp",
                    textColor = textc,
                    paddingLeft = "8dp",
                    Typeface = AppFont.标准
                  }
                },
                {
                  LinearLayout,
                  layout_height = "-2",
                  layout_width = "-1",
                  gravity = "left|center",
                  id = "mydia_logout",
                  onClick = function()
                    mukactivity.setData("tanutai_token", nil)
                    控件可见(talogin)
                    ta_article_data = {}
                    last_ta_art_count = 0
                    ta_article_adp.notifyDataSetChanged()
                    关闭对话框()
                  end,
                  {
                    ImageView,
                    ColorFilter = textc,
                    src = 图标("exit_to_app"),
                    layout_height = "48dp",
                    layout_width = "48dp",
                    layout_marginLeft = "24dp",
                    padding = "12dp"
                  },
                  {
                    TextView,
                    text = "退出账号",
                    textSize = "14sp",
                    textColor = textc,
                    paddingLeft = "8dp",
                    Typeface = AppFont.标准
                  }
                }
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
            an = dl.show()
            dl.setCanceledOnTouchOutside(true)

            波纹({mydia_userpage, mydia_logout}, "方自适应")

            Glide.with(this).load(content.data.avatar.middle).transition(
            DrawableTransitionOptions.with(
            DrawableCrossFadeFactory.Builder(328).setCrossFadeEnabled(true).build()
            )
            ).into(mydia_usericon)
            mydia_username.Text = content.data.username
          end
         else
          提示(content.message)
          if content.message:find("未登录") then
            mukactivity.setData("tanutai_token", nil)
            控件可见(talogin)
          end
        end
      end,
      function(code, content)
        提示("获取用户信息失败：" .. code)
      end
      )
    end

    function 获取文章()
      if tarefresh1_refreshing ~= true then
        tarefresh1_refreshing = true
        tarefresh1.setRefreshing(true)
        if ta_article_page == 1 then
          ta_article_nextpage = true
        end
        if ta_article_nextpage == false then
          tarefresh1_refreshing = false
          tarefresh1.setRefreshing(false)
          提示("没有更多了")
          return true
        end
        tanutai.articles(
        ta_article_page,
        "-update_time",
        "user,voting,topics",
        function(content)
          if ta_article_page == 1 then
            ta_article_data = {}
            last_ta_art_count = 0
            for i = 1, #content.data do
              ta_article_data[i] = content.data[i]
            end
           else
            last_ta_art_count = #ta_article_data - 1
            for i = 1, #content.data do
              ta_article_data[#ta_article_data + 1] = content.data[i]
            end
          end
          if ta_article_page ~= 1 then
            ta_article_adp.notifyItemRangeInserted(ta_article_adp.getItemCount(), #ta_article_data + 1)
           else
            ta_article_adp.notifyDataSetChanged()
          end
          tarefresh1_refreshing = false
          tarefresh1.setRefreshing(false)
          ta_article_page = ta_article_page + 1
          if content.pagination.next == nil then
            ta_article_nextpage = false
          end
        end,
        function(code, content)
          提示("获取文章失败：" .. code)
          tarefresh1_refreshing = false
          tarefresh1.setRefreshing(false)
        end
        )
       else
        提示("已经在加载了")
      end
    end

    function newCaptcha(view)
      tanutai.captcha(
      function(content)
        Glide.with(activity).load(base64ToBytes(content.data.captcha_image:match("%,(.+)"))).skipMemoryCache(true).diskCacheStrategy(
        DiskCacheStrategy.NONE
        ).into(view)
        captchatoken = content.data.captcha_token
      end
      )
    end

    tacaptchaimg.onClick = function()
      newCaptcha(tacaptchaimg)
    end

    function 去空(id)
      id.Text = id.Text:gsub(" ", "")
    end

    taloginbtn.onClick = function()
      去空(tausername)
      去空(tapassword)
      去空(tacaptcha)
      if tausername.Text == "" then
        提示("请填写账号")
        return true
      end
      if tapassword.Text == "" then
        提示("请填写密码")
        return true
      end
      tanutai.login(
      tausername.Text,
      sha1.new():hex(tapassword.Text),
      型号,
      captchatoken or "",
      tacaptcha.getText().toString(),
      function(content)
        --print(dump(content))
        if content.code ~= 0 then
          for i, v in pairs(content.errors) do
            提示(v)
            if v:match("验证码") then
              控件可见(tacaptcha_p)
              Glide.with(activity).load(base64ToBytes(content.captcha_image:match("%,(.+)"))).skipMemoryCache(true).diskCacheStrategy(
              DiskCacheStrategy.NONE
              ).into(tacaptchaimg)
              captchatoken = content.captcha_token
            end
          end
         else
          tausername.requestFocus()
          tausername.Text = ""
          tapassword.requestFocus()
          tapassword.Text = ""
          tacaptcha.requestFocus()
          tacaptcha.Text = ""
          控件隐藏(tacaptcha_p)
          提示("登录成功")
          mukactivity.setData("tanutai_token", content.data.token)
          mukactivity.setData("tanutai_user_id", content.data.user_id)
          mukactivity.setData("tanutai_create_time", content.data.create_time)
          控件隐藏(talogin)
          获取用户信息()
          ta_article_page = 1
          获取文章()
        end
      end,
      function(code, content)
        提示("登录失败：" .. code)
      end
      )
    end

    tareg.onClick = function()
      控件可见(taregp)
      控件隐藏(talogin)
    end
    tatologin.onClick = function()
      控件可见(talogin)
      控件隐藏(taregp)
    end
    taregbtn1.onClick = function()
      去空(taemail2)
      去空(taemailcaptcha2)
      if taemail2.Text == "" then
        提示("请填写邮箱")
        return true
      end
      if taemailcaptcha2.Text == "" then
        提示("请填写验证码")
        return true
      end
      控件可见(taregp2)
      控件隐藏(taregp)
    end
    tarereg.onClick = function()
      控件可见(taregp)
      控件隐藏(taregp2)
    end
    taregbtn2.onClick = function()
      去空(taemail2)
      去空(taemailcaptcha2)
      去空(tausername3)
      去空(tapassword2)

      if taemail2.Text == "" then
        提示("请填写邮箱")
        return true
      end
      if taemailcaptcha2.Text == "" then
        提示("请填写验证码")
        return true
      end
      if tausername3.Text == "" then
        提示("请填写用户名")
        return true
      end
      if tapassword2.Text == "" then
        提示("请填写密码")
        return true
      end

      tanutai.register(
      taemail2.Text,
      taemailcaptcha2.Text,
      tausername3.Text,
      sha1.new():hex(tapassword2.Text),
      function(content)
        --print(dump(content))
        if content.code ~= 0 then
          for i, v in pairs(content.errors) do
            提示(v)
          end
         else
          提示("注册成功，请登录")
          taemail2.requestFocus()
          taemail2.Text = ""
          taemailcaptcha2.requestFocus()
          taemailcaptcha2.Text = ""
          tausername3.requestFocus()
          tausername3.Text = ""
          tapassword2.requestFocus()
          tapassword2.Text = ""
          控件可见(talogin)
          控件隐藏(taregp2)
        end
      end,
      function(code, content)
        提示("注册失败：" .. code)
      end
      )
    end

    --[[tacaptchaimg2.onClick=function()
    newCaptcha(tacaptchaimg2)
  end]]
    taemailgetcaptcha2.onClick = function()
      if emailcountdownnum then
        if emailcountdownnum > 0 then
          return true
        end
      end
      if taemail2.Text == "" then
        提示("请填写邮箱")
        return true
      end
      taemailgetcaptcha2.Text = "发送中"
      emailcountdownnum = 45
      tanutai.sendRegisterEmail(
      taemail2.Text,
      captchatoken2 or "",
      tacaptcha2.getText().toString(),
      function(content)
        --print(dump(content))
        if content.code ~= 0 then
          for i, v in pairs(content.errors) do
            taemailgetcaptcha2.Text = "获取验证码"
            emailcountdownnum = 0
            提示(v)
            if v:match("验证码") then
              控件可见(tacaptcha_p2)
              Glide.with(activity).load(base64ToBytes(content.captcha_image:match("%,(.+)"))).skipMemoryCache(true).diskCacheStrategy(
              DiskCacheStrategy.NONE
              ).into(tacaptchaimg2)
              captchatoken2 = content.captcha_token
            end
          end
         else
          提示("验证码已发送")
          emailcountdown = Ticker()
          emailcountdown.Period = 1000
          emailcountdown.onTick = function()
            if emailcountdownnum > 0 then
              taemailgetcaptcha2.Text = "再次获取 " .. emailcountdownnum .. "秒"
              emailcountdownnum = emailcountdownnum - 1
             else
              emailcountdown.stop()
              taemailgetcaptcha2.Text = "获取验证码"
            end
          end
          emailcountdown.start()
        end
      end,
      function(code, content)
        提示("验证码发送失败：" .. code)
      end
      )
    end

    --[[if mukactivity.getData("tanutai_token") == nil then
      控件可见(talogin)
     else
      --tarv
      获取用户信息()
      ta_article_page = 1
      获取文章()
    end--]]

    --[[page1.onLongClick=function()
      activity.newActivity("tools/scan")
      return true
    end]]

    _debug_clock("tanutai_end")

    分屏()

    _debug_clock("分屏_end")

    mukactivity.setDataR("USE_TIMES", 0)
    mukactivity.setDataR("USE_STAR", 0)

    mukactivity.setData("USE_TIMES", mukactivity.getData("USE_TIMES") + 1)

    if intentstr then --shortcut
      if intentstr == "signin" then
        pcall(
        function()
          sti.stop()
        end
        )
        sti = nil
        startPage_close = true
        ViewAnimator.animate({startPage}).alpha({1, 0}).duration(400).onStop(
        {
          onStop = function()
            控件隐藏(startPage)
          end
        }
        ).start()
        mys_signIn()
      end
    end

    if 文件是否存在(新内置存储文件("noad")) then
      pcall(
      function()
        sti.stop()
      end
      )
      sti = nil
      startPage_close = true
      控件隐藏(startPage)
    end
  end,
  function(e)
    print(e)
  end
  )
  _debug_clock("oncreate_end")
end

_debug_clock("other_start")
参数 = 0
ifh = 0

function onKeyDown(code, event)
  if string.find(tostring(event), "KEYCODE_BACK") ~= nil then
    if pop.isShowing() then
      pop.dismiss()
      return true
    end
    --[[ifh = ifh + 1
    if ifh == 1 then
      if mukactivity.getData("USE_TIMES") >= 4 and mukactivity.getData("USE_STAR") == 0 then
        双按钮对话框(
          "给我评个分吧ʕ•ٹ•ʔ",
          "如果你觉得应急食品好用，那就在酷安上给我个好评叭！(ㆁωㆁ*)",
          "五星好评！",
          "残忍拒绝并不再提示",
          function()
            关闭对话框(an)
            local viewIntent =
              Intent("android.intent.action.VIEW", Uri.parse("https://www.coolapk.com/apk/com.mukapp.genshintool"))
            activity.startActivity(viewIntent)
            mukactivity.setData("USE_STAR", 1)
            提示("谢谢ʕ•̀ω•́ʔ✧")
          end,
          function()
            关闭对话框(an)
            mukactivity.setData("USE_STAR", 1)
          end
        )
        return true
      end
    end]]
    if 参数 + 2 > tonumber(os.time()) then
      --[[r4_4.recycle()
      r8_8.recycle()
      r25_25_25.recycle()
      if bmp then
        bmp.recycle()
      end]]
      if 文件是否存在(内置存储("AndroLua")) then
        if 文件是否存在(内置存储("AndroLua/cache")) then
          删除文件(内置存储("AndroLua/cache"))
        end
        if 文件是否存在(内置存储("AndroLua/crash")) then
          删除文件(内置存储("AndroLua/crash"))
        end
        if #luajava.astable(File(内置存储("AndroLua")).listFiles()) == 0 then
          删除文件(内置存储("AndroLua"))
        end
      end
      pcall(
      function()
        tidailyNote.stop()
      end
      )
      activity.finish()
      --activity.moveTaskToBack(true)
      pcall(
      function()
        Glide.get(activity).clearMemory()
      end
      )
      pcall(
      function()
        collectgarbage("collect")
      end
      )
      System.gc()
     else
      提示("再按一次退出软件")
      参数 = tonumber(os.time())
    end
    return true
  end
end

function onResult(name, ...)
  if name == "tanutai/articles" then
    articleInfoChanged(...)
  end
  if name == "tanutai/newarticle" then
    newarticleticker = Ticker()
    newarticleticker.Period = 200
    newarticleticker.onTick = function()
      newarticleticker.stop()
      ta_article_page = 1
      获取文章()
    end
    newarticleticker.start()
  end
  if name == "settings" then
    提示("正在更新界面")
    渐变跳转页面("home", {subtitle})
    关闭页面()
    pcall(
    function()
      Glide.get(activity).clearMemory()
    end
    )
    pcall(
    function()
      collectgarbage("collect")
    end
    )
    System.gc()
  end
end

--[=[function isAgreement()
  if mukactivity.getData("agreement") == nil then
    local dann0 = {
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
          Text = "欢迎使用应急食品，请阅读：",
          Typeface = AppFont.特粗,
          textColor = primaryc
        },
        {
          ScrollView,
          layout_width = "-1",
          layout_height = "-1",
          layout_weight = "1",
          {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            {
              LinearLayout,
              layout_width = "-1",
              layout_height = "-1",
              layout_marginTop = "8dp",
              {
                TextView,
                layout_width = "-2",
                layout_height = "-2",
                textSize = "14sp",
                --layout_marginTop="8dp";
                layout_marginLeft = "24dp",
                layout_marginRight = "4dp",
                --layout_marginBottom="8dp";
                Typeface = bold,
                Text = "应急食品服务条款",
                textColor = primaryc,
                onClick = function()
                  activity.newActivity(
                  "web",
                  {
                    "https://note.mukapp.top/post/gtool_userspe",
                    nil,
                    [[
      title.setText("应急食品服务条款")
      控件隐藏(https)]],
                    [[
      title.setText("应急食品服务条款")
      控件隐藏(https)]]
                  }
                  )
                end,
                background = 波纹2("方主题")
              },
              {
                TextView,
                layout_width = "-2",
                layout_height = "-2",
                textSize = "14sp",
                Typeface = typeface,
                Text = "和",
                textColor = textc
              },
              {
                TextView,
                layout_width = "-2",
                layout_height = "-2",
                textSize = "14sp",
                --layout_marginTop="8dp";
                layout_marginLeft = "4dp",
                layout_marginRight = "24dp",
                --layout_marginBottom="8dp";
                Typeface = bold,
                Text = "应急食品隐私政策",
                onClick = function()
                  activity.newActivity(
                  "web",
                  {
                    "https://note.mukapp.top/post/gtool_privacy",
                    nil,
                    [[
      title.setText("应急食品隐私政策")
      控件隐藏(https)]],
                    [[
      title.setText("应急食品隐私政策")
      控件隐藏(https)]]
                  }
                  )
                end,
                textColor = primaryc,
                background = 波纹2("方主题")
              }
            },
            {
              TextView,
              layout_width = "-1",
              layout_height = "-2",
              textSize = "14sp",
              --layout_marginTop="8dp";
              layout_marginLeft = "24dp",
              layout_marginRight = "24dp",
              layout_marginBottom = "8dp",
              Typeface = typeface,
              Text = "点击“同意”即代表您同意上述协议。",
              textColor = textc
            }
          }
        },
        {
          LinearLayout,
          orientation = "horizontal",
          layout_width = "-1",
          layout_height = "-2",
          gravity = "right|center",
          {
            CardView,
            layout_width = "-2",
            layout_height = "-2",
            radius = "2dp",
            background = "#00000000",
            layout_marginTop = "8dp",
            layout_marginLeft = "8dp",
            layout_marginBottom = "24dp",
            Elevation = "0",
            onClick = function()
              关闭对话框(an0)
              activity.finish()
            end,
            {
              TextView,
              layout_width = "-1",
              layout_height = "-2",
              textSize = "16sp",
              Typeface = AppFont.特粗,
              paddingRight = "16dp",
              paddingLeft = "16dp",
              paddingTop = "8dp",
              paddingBottom = "8dp",
              Text = "不同意",
              textColor = stextc,
              BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
              ColorStateList(int[0].class {int {}}, int {bwz})
              )
            }
          },
          {
            CardView,
            layout_width = "-2",
            layout_height = "-2",
            radius = "4dp",
            background = primaryc,
            layout_marginTop = "8dp",
            layout_marginLeft = "8dp",
            layout_marginRight = "24dp",
            layout_marginBottom = "24dp",
            Elevation = "1dp",
            onClick = function()
              关闭对话框(an0)
              mukactivity.setData("agreement", "true")
              提示("祝您使用愉快~")
            end,
            {
              TextView,
              layout_width = "-1",
              layout_height = "-2",
              textSize = "16sp",
              paddingRight = "16dp",
              paddingLeft = "16dp",
              Typeface = AppFont.特粗,
              paddingTop = "8dp",
              paddingBottom = "8dp",
              Text = "同意",
              textColor = backgroundc,
              BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
              ColorStateList(int[0].class {int {}}, int {bwz})
              )
            }
          }
        }
      }
    }

    dl0 = BottomDialog(activity)
    dl0.setView(loadlayout(dann0))
    dl0.setGravity(Gravity.BOTTOM)
    dl0.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl0.setMinHeight(0)
    dl0.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl0.setRadius(dp2px(16), 转0x(backgroundc))
    dl0.setCancelable(false)
    dl0.setCanceledOnTouchOutside(false)
    an0 = dl0.show()
    dl0.onDismiss = function()
      isAgreement()
    end
  end
end

isAgreement()]=]

function 分屏()
  _debug_clock("分屏_内_start")
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

  pcall(
  function()
    r4_4.recycle()
    r8_8.recycle()
    r25_25.recycle()
    r25_25_25_25.recycle()
    bitmap_themebackground.recycle()
  end
  )

  _debug_clock("分屏_内_1")

  if themefullscreen then
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .into(pho_full)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(2, 4))
    .into(pho_full_blur1)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(4, 6))
    .into(pho_full_blur2)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(20, 10))
    .into(pho_full_blur)
    pho_top_filter.background = nil

    pho_full_filter.setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))
    _topbar.getChildAt(0).setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))
    _topbar.getChildAt(1).setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))
    mBottomBar.setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))
    tatopbar.setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))
   else
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .into(pho_top)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(2, 4))
    .into(pho_top_blur1)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(4, 6))
    .into(pho_top_blur2)
    Glide.with(activity)
    .load(activity.getLuaDir(themebackground))
    .centerCrop()
    .transform(BlurTransformation(20, 10))
    .into(pho_top_blur)
  end

  _debug_clock("分屏_内_2")

  setHeight(dym1, activity.Height - dp2px(8) - 状态栏高度)
  setHeight(dym2, activity.Height * 0.618)
  setHeight(_topbar2, activity.Height * 0.618)
  if activity.Height * 0.9 < activity.Width then
    --横屏
    setHeight(dym3, dp2px(80))
    setHeight(mBottomBar.getChildAt(0), dp2px(48))
    gv2.NumColumns = tointeger(activity.Width / dp2px(180))
   else
    setHeight(dym3, dp2px(180))
    setHeight(mBottomBar.getChildAt(0), dp2px(56))
    gv2.NumColumns = tointeger(activity.Width / dp2px(180))
  end

  _debug_clock("分屏_内_end")
end

function onConfigurationChanged(newConfig)
  分屏()
end

_debug_clock("other_end")

function onStart()
  _debug_clock("onstart_start")
  isnewacting = false
  pcall(function()dailyNote()end)
  tidailyNote = Ticker()
  tidailyNote.Period = tointeger(mukactivity.getData("Note_Time")) * 60 * 1000
  tidailyNote.onTick = function()
    dailyNote()
  end
  tidailyNote.start()
  pcall(
  function()
    LuaService.getService().runFunc("dailyNote2", nil)
  end
  )
  --print("start")
  if mukactivity.getData("Note_Notification") == "true" then
    if LuaService.getService() == nil then
      --print("启用服务")
      activity.startService()
    end
  end
  _debug_clock("onstart_end")
end

function onStop()
  isnewacting = false
  tidailyNote.stop()
  --print("stop")
end
