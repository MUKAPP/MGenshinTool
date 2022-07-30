require "import"
import "mods.muk"

activity.getWindow().addFlags(
WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION
)
if themebackgroundlight == "light" then
  状态栏颜色(0xFF424242, false)
  if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
    沉浸状态栏(nil, nil, true)
   else
    沉浸状态栏()
  end
 else
  状态栏颜色(0x3F000000, false)
  沉浸状态栏(true)
end

导航栏高度2 = 导航栏高度
if Boolean.valueOf(mukactivity.getData("Navigation_Bar_Height")) == false then
  导航栏高度 = 0
end

layout={
  RelativeLayout,
  layout_height = "-1",
  layout_width = "-1",
  background = backgroundc,
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
  },
  {
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    {
      PageView,
      layout_height = "-1",
      layout_width = "-1",
      layout_weight = "1",
      id = "jc",
      pages = {

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          gravity="bottom",
          paddingBottom=导航栏高度,
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              layout_height = "-2",
              layout_width = "-1",
              orientation = "vertical",
              gravity = "center",
              padding="24dp",
              {
                TextView,
                Text = "欢迎使用",
                textColor = primaryc,
                textSize = "32sp",
                layout_height = "-2",
                layout_width = "-1",
                Typeface = AppFont.标准,
                gravity = "left|center",
                paddingLeft="4dp",
              },
              {
                TextView,
                Text = activity.Title,
                textColor = primaryc,
                textSize = "64sp",
                layout_height = "-2",
                layout_width = "-1",
                Typeface = AppFont.粗体,
                gravity = "left|center",
                layout_marginTop = "2dp",
              },
              {
                TextView,
                Text = "向左滑动进入引导",
                textColor = textc,
                textSize = "14sp",
                layout_height = "-2",
                layout_width = "-1",
                Typeface = AppFont.标准,
                gravity = "left|center",
                paddingLeft="6dp",
                layout_marginTop = "6dp",
              },
            },
          }
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          paddingTop=状态栏高度,
          paddingBottom=导航栏高度,
          layout_height="fill",
          gravity="bottom",
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              orientation="vertical",
              layout_width="fill",
              layout_height="fill",
              {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "center",
                padding="24dp",
                {
                  TextView,
                  Text = "1/5 用户协议",
                  textColor = primaryc,
                  textSize = "32sp",
                  layout_height = "-2",
                  layout_width = "-1",
                  Typeface = AppFont.粗体,
                  gravity = "left|center",
                },

                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="8dp";
                  layout_width="-1";
                  layout_height="-2";
                  layout_marginTop="8dp";
                  {
                    LinearLayout,
                    orientation="vertical",
                    --layout_marginTop="20dp",
                    layout_width="-1",
                    layout_height="-2",
                    {
                      TextView,
                      Text = "欢迎使用应急食品，请阅读：",
                      textColor=textc;
                      textSize="14sp";
                      gravity="center|left";
                      Typeface=AppFont.标准;
                      padding="16dp";
                      paddingBottom="0";
                      layout_width="-1",
                      layout_height="-2",
                    },
                    {
                      LinearLayout,
                      layout_width = "-1",
                      layout_height = "-2",
                      --paddingTop="4dp";
                      paddingLeft="16dp";
                      paddingRight="16dp";
                      {
                        TextView,
                        layout_width = "-2",
                        layout_height = "-2",
                        textSize = "14sp",
                        layout_marginRight = "4dp",
                        Typeface = AppFont.粗体,
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
                        layout_marginLeft = "4dp",
                        Typeface = AppFont.粗体,
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
                      },
                    },
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "14sp",
                      --layout_marginTop="8dp";
                      layout_marginLeft = "16dp",
                      layout_marginRight = "16dp",
                      layout_marginBottom = "16dp",
                      Typeface = AppFont.标准,
                      Text = "向左滑动即代表您同意上述协议。",
                      textColor = textc
                    },
                  },
                },
              },
            },
          },
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          paddingTop=状态栏高度,
          paddingBottom=导航栏高度,
          layout_height="fill",
          gravity="bottom",
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              orientation="vertical",
              layout_width="fill",
              layout_height="fill",
              {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "center",
                padding="24dp",
                {
                  TextView,
                  Text = "2/5 权限声明",
                  textColor = primaryc,
                  textSize = "32sp",
                  layout_height = "-2",
                  layout_width = "-1",
                  Typeface = AppFont.粗体,
                  gravity = "left|center",
                },

                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="8dp";
                  layout_width="-1";
                  layout_height="-2";
                  layout_marginTop="8dp";
                  {
                    ScrollView,
                    layout_width="-1",
                    layout_height="-2",
                    {
                      LinearLayout,
                      orientation="vertical",
                      --layout_marginTop="20dp",
                      layout_width="-1",
                      layout_height="-2",
                      {
                        TextView,
                        Text = [[应急食品的正常使用需要使用以下权限，我们承诺不会滥用任何权限。

 - 软件需要
   读取您共享存储空间中的内容：访问文件
   修改或删除您共享存储空间中的内容：保存文件
   查看网络连接：获取网络状态
   拥有完全的网络访问权限：访问网络
   直接下载文件而不显示通知：下载软件更新等
   请求安装文件包：安装软件更新
   安装快捷方式：动态添加及删除Shortcut
   显示在其他应用上方：悬浮浏览器
   计算应用存储空间
   运行前台服务：实时便笺及自动签到

 - 百度统计SDK需要：用来统计用户喜好（例如最常使用哪些本软件的功能）、用户数及获取软件崩溃日志等，以下权限均可禁止（主要是这些权限不加到清单的话百度就不给统计数据）
   在后台使用位置信息
   只有在前台运行时才能获取大致位置信息
   修改系统设置

以上是应急食品申请的全部权限。如果您对该说明有异议，请联系开发者。如果您不同意该权限声明，应急食品可能无法为您提供正常服务。]],
                        textColor=textc;
                        textSize="14sp";
                        gravity="center|left";
                        Typeface=AppFont.标准;
                        padding="16dp";
                        paddingBottom="0";
                        layout_width="-1",
                        layout_height="-2",
                      },
                      {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "14sp",
                        layout_marginTop="2dp";
                        layout_marginLeft = "16dp",
                        layout_marginRight = "16dp",
                        layout_marginBottom = "16dp",
                        Typeface = AppFont.标准,
                        Text = "向左滑动进入下一步",
                        textColor = textc
                      },
                    },
                  },
                },
              },
            },
          },
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          paddingTop=状态栏高度,
          layout_height="fill",
          gravity="bottom",
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="24dp";
            {
              LinearLayout,
              orientation="vertical",
              layout_width="fill",
              layout_height="fill",
              {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "center",
                padding="24dp",
                {
                  TextView,
                  Text = "3/5 导航栏设置",
                  textColor = primaryc,
                  textSize = "32sp",
                  layout_height = "-2",
                  layout_width = "-1",
                  Typeface = AppFont.粗体,
                  gravity = "left|center",
                },

                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="8dp";
                  layout_width="-1";
                  layout_height="-2";
                  layout_marginTop="8dp";
                  {
                    LinearLayout,
                    orientation="vertical",
                    --layout_marginTop="20dp",
                    layout_width="-1",
                    layout_height="-2",
                    {
                      TextView,
                      Text = "由于国内各大系统规范不同，适配方法也千差万别，甚至部分系统在隐藏导航栏之后也会给软件提供导航栏高度。\n请手动选择一个适合于您系统的软件底栏显示方式。（您之后还可以在设置内更改此项）\n底部为软件底栏示例",
                      textColor=textc;
                      textSize="14sp";
                      gravity="center|left";
                      Typeface=AppFont.标准;
                      padding="16dp";
                      paddingBottom="0";
                      layout_width="-1",
                      layout_height="-2",
                    },
                    {
                      CardView,
                      CardElevation = "0dp",
                      CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                      Radius = "6dp",
                      layout_width = "-1",
                      layout_height = "-2",
                      layout_margin = "8dp",
                      layout_marginLeft = "16dp",
                      layout_marginRight = "16dp",
                      layout_marginTop = "8dp",
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
                        Text = "开启垫高",
                        textColor = primaryc,
                        id = "btn1",
                        onClick=function()
                          控件可见(mBottomBar_tem)
                          mukactivity.setData("Navigation_Bar_Height",tostring(true))
                        end,
                      }
                    },
                    {
                      CardView,
                      CardElevation = "0dp",
                      CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                      Radius = "6dp",
                      layout_width = "-1",
                      layout_height = "-2",
                      layout_margin = "8dp",
                      layout_marginLeft = "16dp",
                      layout_marginRight = "16dp",
                      layout_marginTop = "4dp",
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
                        Text = "关闭垫高",
                        textColor = primaryc,
                        id = "btn2",
                        onClick=function()
                          控件隐藏(mBottomBar_tem)
                          mukactivity.setData("Navigation_Bar_Height",tostring(false))
                        end,
                      }
                    },
                    {
                      TextView,
                      layout_width = "-1",
                      layout_height = "-2",
                      textSize = "14sp",
                      --layout_marginTop="2dp";
                      layout_marginLeft = "16dp",
                      layout_marginRight = "16dp",
                      layout_marginBottom = "16dp",
                      Typeface = AppFont.标准,
                      Text = "向左滑动进入下一步",
                      textColor = textc
                    },
                  },
                },
              },
            },
          },
          {
            LinearLayout, --底栏
            orientation = "vertical",
            layout_height = "-2",
            layout_width = "-1",
            gravity = "center|left",
            background = backgroundc,
            elevation = "6dp",
            onClick = function()
            end,
            {
              LinearLayout, --底栏
              orientation = "horizontal",
              layout_height = "56dp",
              layout_width = "-1",
              gravity = "center|left",
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
                },
              },
            },
            {
              TextView,
              id = "mBottomBar_tem",
              layout_height=导航栏高度,
            },
          }
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          paddingTop=状态栏高度,
          paddingBottom=导航栏高度,
          layout_height="fill",
          gravity="bottom",
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              orientation="vertical",
              layout_width="fill",
              layout_height="fill",
              {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "center",
                padding="24dp",
                {
                  TextView,
                  Text = "4/5 关于Root权限",
                  textColor = primaryc,
                  textSize = "32sp",
                  layout_height = "-2",
                  layout_width = "-1",
                  Typeface = AppFont.粗体,
                  gravity = "left|center",
                },

                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="8dp";
                  layout_width="-1";
                  layout_height="-2";
                  layout_marginTop="8dp";
                  {
                    ScrollView,
                    layout_width="-1",
                    layout_height="-2",
                    {
                      LinearLayout,
                      orientation="vertical",
                      --layout_marginTop="20dp",
                      layout_width="-1",
                      layout_height="-2",
                      {
                        TextView,
                        Text = [[如过您不知道Root权限是什么，或者您没有Root权限，那就可以直接跳过这一步。

当您进入工具 抽卡记录分析 时，本软件会向您请求Root权限。
本软件请求Root权限仅仅是为了以Root方式获取原神Log内的抽卡记录链接，绝不会擅滥用Root权限。如果您不放心或者不需要用Root权限获取抽卡记录链接，那您依旧可以手动获取链接来分析您的抽卡记录。]],
                        textColor=textc;
                        textSize="14sp";
                        gravity="center|left";
                        Typeface=AppFont.标准;
                        padding="16dp";
                        paddingBottom="0";
                        layout_width="-1",
                        layout_height="-2",
                      },
                      {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "14sp",
                        layout_marginTop="2dp";
                        layout_marginLeft = "16dp",
                        layout_marginRight = "16dp",
                        layout_marginBottom = "16dp",
                        Typeface = AppFont.标准,
                        Text = "向左滑动进入下一步",
                        textColor = textc
                      },
                    },
                  },
                },
              },
            },
          },
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          paddingTop=状态栏高度,
          paddingBottom=导航栏高度,
          layout_height="fill",
          gravity="bottom",
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              orientation="vertical",
              layout_width="fill",
              layout_height="fill",
              {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "center",
                padding="24dp",
                {
                  TextView,
                  Text = "5/5 即将完成",
                  textColor = primaryc,
                  textSize = "32sp",
                  layout_height = "-2",
                  layout_width = "-1",
                  Typeface = AppFont.粗体,
                  gravity = "left|center",
                },

                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="8dp";
                  layout_width="-1";
                  layout_height="-2";
                  layout_marginTop="8dp";
                  {
                    ScrollView,
                    layout_width="-1",
                    layout_height="-2",
                    {
                      LinearLayout,
                      orientation="vertical",
                      --layout_marginTop="20dp",
                      layout_width="-1",
                      layout_height="-2",
                      {
                        TextView,
                        Text = [[您稍后还可以进入设置界面来设置软件主题和其他项目。
如果对本软件有建议，也可以在关于界面加入QQ群或者直接向开发者反馈。]],
                        textColor=textc;
                        textSize="14sp";
                        gravity="center|left";
                        Typeface=AppFont.标准;
                        padding="16dp";
                        paddingBottom="0";
                        layout_width="-1",
                        layout_height="-2",
                      },
                      {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "14sp",
                        layout_marginTop="2dp";
                        layout_marginLeft = "16dp",
                        layout_marginRight = "16dp",
                        layout_marginBottom = "16dp",
                        Typeface = AppFont.标准,
                        Text = "继续向左滑动以进入软件",
                        textColor = textc
                      },
                    },
                  },
                },
              },
            },
          },
        },

        {
          LinearLayout,
          orientation="vertical",
          layout_width="fill",
          layout_height="fill",
          gravity="bottom",
          paddingBottom=导航栏高度,
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(backgroundc)-0x20000000;
            Radius="16dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="24dp";
            layout_marginBottom="48dp";
            {
              LinearLayout,
              layout_height = "-2",
              layout_width = "-1",
              orientation = "vertical",
              gravity = "center",
              padding="24dp",
              {
                TextView,
                Text = "欢迎使用",
                textColor = primaryc,
                textSize = "32sp",
                layout_height = "-2",
                layout_width = "-1",
                Typeface = AppFont.粗体,
                gravity = "left|center",
              },
              {
                TextView,
                Text = "正在启动应急食品…",
                textColor = textc,
                textSize = "14sp",
                layout_height = "-2",
                layout_width = "-1",
                Typeface = AppFont.标准,
                gravity = "left|center",
                layout_marginTop = "6dp",
              },
            },
          }
        },

      },
    },
  },
}

activity.setContentView(loadlayout(layout))

波纹({btn1,btn2},"方主题")

transitioner = LayoutTransition()
mBottomBar_tem.getParent().setLayoutTransition(transitioner)
mBottomBar_tem.getParent().getParent().setLayoutTransition(transitioner)

静态渐变(转0x(primaryc) - 0xc0000000, 转0x(secondaryc) - 0xc0000000, pho_full_z, "竖")

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
pho_full_filter.setBackgroundDrawable(ColorDrawable(转0x(barbackgroundc)))

local apa = 1

function scrollYEvent(apa, ispage)
  if 1 - apa >= 1 then
    --print((1-0)^2)
    pho_full_filter.alpha = 1
    pho_full_blur.alpha = 1
    pho_full_blur2.alpha = 1
    pho_full_blur1.alpha = 1
   else
    --print((1-apa)^2)
    pho_full_filter.alpha = (1 - apa) ^ 4
    pho_full_blur.alpha = -(1 - apa - 1) ^ 2 + 1
    pho_full_blur2.alpha = -(1 - apa - 1) ^ 8 + 1
    pho_full_blur1.alpha = -(1 - apa - 1) ^ 64 + 1
  end
  if apa >= 0 then
    local topps = 1 + (1 - apa) * 0.2
    pho_full.setScaleX(topps)
    pho_full.setScaleY(topps)
    pho_full_blur.setScaleX(topps)
    pho_full_blur.setScaleY(topps)
    pho_full_blur1.setScaleX(topps)
    pho_full_blur1.setScaleY(topps)
    pho_full_blur2.setScaleX(topps)
    pho_full_blur2.setScaleY(topps)
  end
end

jc.setOnPageChangeListener(PageView.OnPageChangeListener {
  onPageScrolled = function(a, b, c)
    if a == 0 then
      if apa - (apa) * b >= 0 then
        scrollYEvent(apa - (apa) * b, true)
      end
     elseif a == 1 then
      scrollYEvent(0, true)
    end
  end,
  onPageSelected = function(v)
    if v ~= 0 then
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
      if themebackgroundlight == "light" then
        状态栏颜色(0xFF424242, false)
        if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
          沉浸状态栏(nil, nil, true)
         else
          沉浸状态栏()
        end
       else
        状态栏颜色(0x3F000000, false)
        沉浸状态栏(true)
      end
    end

    if v==6
      ti=Ticker()
      ti.Period=200
      ti.onTick=function()
        ti.stop()
        mukactivity.setData("guide_done",true)
        activity.newActivity("home")
        activity.finish()
      end
      ti.start()
    end

  end
})

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
  end
})
