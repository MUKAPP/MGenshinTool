require "import"

import "mods.muk"

import "com.blankj.utilcode.util.ShellUtils"

activity.Title = "抽卡记录分析"
layout = {
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
      layout_width = "-1",
      background = barbackgroundc,
      gravity = "center|left",
      id = "mActionBar",
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
            关闭页面()
          end
        }
      },
      {
        TextView, --标题
        Typeface = AppFont.特粗,
        textSize = "20sp",
        Text = activity.Title,
        ellipsize = "end",
        layout_marginLeft = "16dp",
        SingleLine = true,
        textColor = primaryc,
        id = "title",
        layout_weight = "1"
      }
    },
    {
      RelativeLayout,
      layout_height = "-1",
      layout_width = "-1",
      {
        ScrollView,
        layout_width = "-1",
        layout_height = "-1",
        background = backgroundc,
        {
          LinearLayout,
          layout_width = "-1",
          layout_height = "-1",
          orientation = "vertical",
          --gravity="center";
          id = "web_w",
          {
            LuaWebView, --主体
            layout_height = activity.Width / 1240 * 633,
            layout_width = "-1",
            background = backgroundc,
            id = "web"
          },
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-1",
            orientation = "vertical",
            id = "after",
            {
              MEditText {
                textSize = "14sp",
                id = "edit",
                hint = "输入抽卡记录链接（必须按照下面复制完整）",
                textColor = textc,
                HintTextColor = stextc,
                --SingleLine=true;
                --text="";
                layout_width = "-1",
                layout_height = "-2",
                --inputType="text";
                MaxLines = 6
              },
              layout_margin = "16dp",
              layout_marginTop = "8dp",
              layout_marginBottom = "8dp"
            },
            {
              CardView,
              layout_width = "56dp",
              layout_height = "56dp",
              radius = "28dp",
              background = primaryc,
              elevation = "0",
              layout_margin = "8dp",
              translationZ = "2dp",
              id = "xf1",
              layout_gravity = "center",
              {
                ImageView,
                src = 图标("check"),
                layout_width = "56dp",
                layout_height = "56dp",
                padding = "16dp",
                id = "TranslationClick",
                ColorFilter = backgroundc
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
                Typeface = AppFont.标准,
                paddingTop = "12dp",
                paddingBottom = "12dp",
                gravity = "center",
                Text = "历史记录",
                textColor = textc,
                id = "btn3"
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
                Typeface = AppFont.标准,
                paddingTop = "12dp",
                paddingBottom = "12dp",
                gravity = "center",
                Text = "Root获取抽卡记录链接",
                textColor = textc,
                id = "btn4"
              }
            },
            --[[{
              CardView;
              CardElevation="0dp";
              CardBackgroundColor=cardbackc;
              Radius="8dp";
              layout_width="-1";
              layout_height="-2";
              layout_margin="8dp";
              layout_marginLeft="16dp";
              layout_marginRight="16dp";
              layout_marginTop="8dp";
              layout_marginBottom="8dp";
              {
                TextView;
                layout_width="-1";
                layout_height="-1";
                textSize="14sp";
                paddingRight="16dp";
                paddingLeft="16dp";
                Typeface=AppFont.标准;
                paddingTop="12dp";
                paddingBottom="12dp";
                gravity="center";
                Text="导入JSON分析";
                textColor=textc;
                id="btn5";
              };
            };]]
            {
              CardView,
              CardElevation = "0dp",
              CardBackgroundColor = "#21FF9800",
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
                paddingBottom = "8dp",
                paddingTop = "8dp",
                {
                  LinearLayout,
                  layout_height = "-2",
                  layout_width = "-1",
                  gravity = "left|center",
                  {
                    ImageView,
                    ColorFilter = "#FF9100",
                    src = 图标("warning"),
                    layout_height = "48dp",
                    layout_width = "48dp",
                    layout_marginLeft = "8dp",
                    padding = "12dp"
                  },
                  {
                    TextView,
                    text = "由于原神系统限制，软件只能获取到六个月内的抽卡记录",
                    textSize = "14sp",
                    textColor = "#FF9100",
                    paddingLeft = "8dp",
                    paddingRight = "8dp",
                    Typeface = AppFont.标准
                  }
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
                  text = "如何获取抽卡记录链接？",
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
                  text = "传统方式",
                  textColor = primaryc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.特粗,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "8dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "新版还没来得及写，这里先应用 Yunzai bot 的获取教程",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "4dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                },
                {
                  CardView,
                  CardElevation = "0dp",
                  CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                  Radius = "8dp",
                  layout_width = "-1",
                  layout_height = "-2",
                  layout_marginLeft = "16dp",
                  layout_marginRight = "16dp",
                  layout_marginTop = "8dp",
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
                    Text = "抽卡链接获取教程",
                    onClick = function()
                      activity.newActivity("web",{
                        "https://docs.qq.com/doc/DUWpYaXlvSklmVXlX"
                      })
                    end,
                    textColor = primaryc,
                    id = "course"
                  }
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "注意：链接以https开头，log结尾。部分输入法剪贴板限制了字数，如果发现粘贴完链接不完整可以尝试更换输入法）",
                  Typeface = AppFont.标准,
                  paddingTop = "8dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp",
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left"
                },
                {
                  TextView,
                  text = "Root方式",
                  textColor = primaryc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.特粗,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "8dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "首先打开该页面，然后打开原神/云原神的 抽卡历史记录，再返回到该页面，点击 “Root获取抽卡记录链接”按钮 即可获取到链接。\n注意：Root权限为设备最高管理权限，请确认“应急食品”是否是从官网/酷安/官方群内下载！手机无Root并且对安卓系统不了解的人也不要轻易尝试获取Root权限！",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "4dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                }
              }
            }
          },
          {
            TextView,
            textSize = "14sp",
            textColor = textc,
            text = "正在加载…",
            Typeface = AppFont.标准,
            paddingTop = "8dp",
            layout_width = "-1",
            layout_height = "-2",
            gravity = "center",
            id = "info"
          },
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = 转0x(primaryc) - 0xde000000,
            Radius = "8dp",
            layout_width = "-1",
            layout_height = "-2",
            layout_margin = "8dp",
            layout_marginLeft = "16dp",
            layout_marginRight = "16dp",
            layout_marginTop = "16dp",
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
              Text = "分析结果",
              textColor = primaryc,
              id = "btn1"
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
            layout_marginLeft = "16dp",
            layout_marginRight = "16dp",
            layout_marginTop = "8dp",
            layout_marginBottom = "12dp",
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
              Text = "导出Excel",
              textColor = textc,
              id = "btn2"
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
              Typeface = AppFont.标准,
              paddingTop = "12dp",
              paddingBottom = "12dp",
              gravity = "center",
              Text = "导出JSON（UIGF标准）",
              textColor = textc,
              id = "btn6"
            }
          }
        }
      },
      {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        orientation = "vertical",
        padding = "24dp",
        paddingTop = "16dp",
        background = backgroundc,
        --gravity="center";
        id = "loaderr",
        {
          CardView,
          CardElevation = "0dp",
          CardBackgroundColor = cardbackc,
          Radius = "8dp",
          layout_width = "-1",
          layout_height = "-2",
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-1",
            orientation = "vertical",
            padding = "28dp",
            {
              TextView,
              text = ":(",
              textColor = primaryc,
              textSize = "48sp",
              layout_height = "-2",
              layout_width = "-1",
              Typeface = AppFont.特粗
            },
            {
              TextView,
              text = "Not Found",
              textColor = primaryc,
              textSize = "36sp",
              layout_height = "-2",
              layout_width = "-1",
              paddingTop = "8dp",
              Typeface = AppFont.特粗
            },
            {
              TextView,
              textSize = "18sp",
              textColor = primaryc,
              text = "你要找的网页跑丢了！",
              Typeface = AppFont.标准,
              paddingTop = "8dp"
            },
            {
              TextView,
              textSize = "14sp",
              textColor = textc,
              text = "在访问 https://www.mukapp.top 时出错",
              Typeface = AppFont.标准,
              paddingTop = "16dp",
              id = "errwz"
            },
            {
              TextView,
              textSize = "14sp",
              textColor = stextc,
              text = "建议：\n- 检查您的网络连接或者刷新网页\n- 检查网站运作是否正常",
              Typeface = AppFont.标准,
              paddingTop = "16dp"
            },
            {
              TextView,
              textSize = "14sp",
              textColor = stextc,
              text = "如需了解更多信息，可以在线搜索此代码：ERR_MUKNB",
              Typeface = AppFont.标准,
              paddingTop = "16dp",
              id = "errxx"
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
          layout_marginTop = "24dp",
          {
            TextView,
            layout_width = "-1",
            layout_height = "-1",
            textSize = "16sp",
            paddingRight = "16dp",
            paddingLeft = "16dp",
            Typeface = AppFont.特粗,
            paddingTop = "12dp",
            paddingBottom = "12dp",
            gravity = "center",
            Text = "刷新",
            onClick = function()
              web.reload()
            end,
            textColor = primaryc,
            id = "xz"
          }
        }
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
      }
    }
  }
}

设置视图(layout)

波纹({back, _more}, "圆主题")
波纹({xz, btn1,course}, "方主题")
波纹({btn2, btn3, btn4, btn5, btn6}, "方自适应")

web.removeView(web.getChildAt(0))

transitioner = LayoutTransition()
web.setLayoutTransition(transitioner)
web.getParent().setLayoutTransition(transitioner)
web_w.getParent().setLayoutTransition(transitioner)

控件隐藏(info)

import "org.jsoup.*"

--pageurl=[[https://webstatic.mihoyo.com/hk4e/event/e20190909gacha/index.html?authkey_ver=1&sign_type=2&auth_appid=webview_gacha&init_type=302&gacha_id=699b72dc3428b62a6607c2dea368662dbcd985&lang=zh-cn&device_type=mobile&ext=%7b%22loc%22%3a%7b%22x%22%3a2273.646240234375%2c%22y%22%3a204.9442596435547%2c%22z%22%3a-1100.300048828125%7d%2c%22platform%22%3a%22Android%22%7d&game_version=CNRELAndroid1.4.0_R2147343_S2316848_D2316848&region=cn_gf01&authkey=wm69syrxI5lh6RNXbO3CEnxbWR1c9kOdJIbN3CtSWRD6CZPAJezY0%2bUO5Vc%2bmXzXw8RrYr2gmMwtkm32elPSynQBxIl6eKX4xVZKGkmALFZFJ42zqp%2fg6j%2fg8iE9IXpx215pLdCPo1d9AcKHnfPrj6MUs59WQvH%2b7GFDgYEAuZ64LaAHrvhBqDVtAT2A3q%2fux2wzdR%2b7%2bc7U%2bO8tGZZXVquEpkfwIXRbZN0m%2bjLnP6JMIJXM2YYaI7VsZLBKnfY%2bFLGmd5nLB%2fDnbL87l1wdk3B%2fI%2b6IoeWwNrmFPEBVe2uKkjvHKPewAeKrB3T6LZc2f9z57DKZvp491fm7YV9y5DrW55pa%2f%2bOUZ4Jzod8w9Iwf5Jg%2bMfUVxaPvgCuAs5I4rh8RCIN%2b9HKkQs9b%2fy143rm1d1dZ5E8XKNAkG7DYLYVRPjxTkgAshvb%2btqSdpz9U2J7Z2uYvGl70cpSBN2OwLD3a9yKyTYRH%2fgM0bAMs8%2fyZf5I1HhbWQe%2bA0PGuNJSPFBY7oFeagaN1NgbAHZU%2fntYHc9%2fXZuQCtD%2fltLvpCYt0DrZcTEmCw%2bIfFIy9hSV9Isl56lmRT0CeLake0%2bH6YSH5ZyLvoLC52NA7rzgP9jhOa8ASbTTXVSpKDnTX7fNAXt%2bEw4GJ4rtg%2fTntfz%2bfAyp%2fhS23M6CAFqI8FzBUZGe%2fpNYQCW5LtUWQLBGFqYvzu%2bb5PM%2fp7B%2bWRSbtD4nAkAU4Jly3g6mV6GbrHECLM4ageBbZGePgyS2Fw%2bIIJGq%2bWN9GJzQS7NAr9rVY9JF5p%2bQAlCEuXPRoehub3eDv%2fPYTJWHnDm1vs8W0nhile0o1Z%2bdiRAtEHgD0xjamGB1jtfkiJ%2fZTJG4bJ3N9KgvUFQW3n4kWk%2fypKnFgWd0vrz6CCRgOz48Uvrtee8tO2DIvdCj5OUZO7qEhDmaR5rjaIobpjYmlC77BsHKxEAffXzfq6hVAmWrX94iAoQOd%2fTUPGPcSgPLdyChd8ygXnV4dlgZU1VyUAEEX8WPUphI7Crruxq6O9%2fYFuZv7%2fvoLmhxf7lXo5AELgxG8t8ngEdULksFaHcRpl9pYouYINxfQnZnNUg0En3urnfozCKxgbCXDnLFQlIsHCXuypdCoAfHGmfzEZ5rWtBJ4dWkkjg%2frRrcNSnt5A8rZSnn1Tgr%2ft%2f0ONCBmQNUKVduJ%2fYxLLu66Sa8quuSZDV%2bvce7vdb0b%2fDsAdwTA3Gm8%2foyy%2f5SLwcAyRcU%2f%2bXyNbu%2bga%2fOOfZtq34t40D1bp0BIpUSPgqoLGrQ9u8NHbNwpU6ycuYQBW6ARheLRT2g5KViA%2fngIRJQ4FiQnU9TC%2bvoTiQz8sxi9ZommdsZXOuSB5kB8ayHqryeyaA%3d%3d&game_biz=hk4e_cn#/log]]

--web.loadUrl(pageurl)

import "com.lua.*"

loadstring([[getjs=import "tools/gacha_export_js"]])()

静态渐变(转0x(primaryc) - 转0x("#9f000000"), 转0x(primaryc), webprogress, "横")

darkmode =
'if(!document.getElementById(\'via_inject_css_night\')){var css=document.createElement(\'style\');css.id=\'via_inject_css_night\';css.type=\'text/css\';css.rel="stylesheet";var textNode=document.createTextNode(\'html{background-color:#202125!important}*{color:#999!important;box-shadow:none!important;background-color:transparent!important;border-color:#444!important;border-top-color:#444!important;border-bottom-color:#444!important;border-left-color:#444!important;border-right-color:#444!important}body{background-color:transparent!important}:after,:before{background-color:transparent!important;border-color:#444!important}a,a *{color:#88A8E8!important;text-decoration:none!important}.link:hover,.link:hover *,[role=button]:hover *,[role=link]:hover,[role=link]:hover *,[role=menuitem]:hover,[role=menuitem]:hover *,a:hover,a:hover *,a:visited:hover,a:visited:hover *,div[onclick]:hover,span[onclick]:hover{color:#F0F0F0!important}a:visited,a:visited *{color:#88a!important}.selected,.selected *,[href="#"],a.active,a.active *,a.highlight,a.highlight *{color:#DDD!important;font-weight:700!important}[class*=header],[class*=header] td,[class*=headline],[id*=header],[id*=headline],h1,h1 *,h2,h2 *,h3,h3 *,h4,h5,h6,strong{color:#DDD!important}[class*=alert],[class*=error],code,div[onclick],span[onclick]{color:#900!important}::-moz-selection{background-color:#88A8E8fa!important;color:#202125!important}::selection{background-color:#88A8E8fa!important;color:#202125!important}:focus{outline:0!important}div[role=navigation],div[style="display: block;"]{background-color:rgba(0,0,0,.5)!important}table{background-color:rgba(30,30,30,.4)!important;border-radius:6px!important}table>tbody>tr:nth-child(even),table>tbody>tr>td:nth-child(even){background-color:rgba(0,0,0,.2)!important}#ghostery-purple-bubble,#translator-popup,.hovercard,.menu,.tooltip,.vbmenu_popup,[class*=dropdown],[class*=nav] ul,[class*=popup],[class=title],[id*=Menu],[id*=menu],[id*=nav] ul,a[id*=ghosteryfirefox],a[onclick][style*=display],div[role=dialog],div[role=menu],div[style*="position:"][style*="left:"][style*=visible],div[style*="z-index:"][style*="left:"][style*=visible],div[style*="-moz-user-select"],embed,iframe,label [onclick],nav,nav ul,span[class*=script] div,ul[class*=menu],ul[style*="display:"],ul[style*="visibility:"] ul{background-color:rgba(5,5,5,.9)!important;border-radius:5px;box-shadow:1px 1px 5px #202125!important}#footer,#header,footer,header{background-color:rgba(19,19,19,.9)!important;box-shadow:0 0 5px #202125!important}body>#dialog,body>.xenOverlay{background-color:rgba(19,19,19,.96)!important;background-clip:padding-box!important;box-shadow:0 0 15px #202125,inset 0 0 0 1px rgba(200,200,200,.5),inset 0 0 5px #111!important}[id*=lightbox],[id*=overlay],blockquote{background-color:rgba(35,35,35,.9)!important;border-radius:5px}.Message code,dl,pre{background-color:rgba(5,5,5,.5)!important}.install[onclick],[role=button],a.BigButton,a.TabLink,a.button,a.submit,button,input,select{-moz-appearance:none!important;-webkit-appearance:none!important;transition:border-color .3s!important;background-color:#060606!important;color:#BBB!important;box-shadow:0 0 2px rgba(0,0,0,.9)!important}a[class*=button]:not(:empty),a[href="javascript:;"],a[id*=Button]:not(:empty),a[id*=button]:not(:empty),div[class*=button][onclick]{transition:border-color .3s!important;background-color:#060606!important;color:#BBB!important;border-color:#333!important;box-shadow:0 0 2px rgba(0,0,0,.9)!important}a[class*=button]:not(:empty):hover,a[href="javascript:;"]:hover,a[id*=Button]:not(:empty):hover,a[id*=button]:hover,div[class*=button][onclick]:hover{background-color:#151515!important;color:#FFF!important}a.button *,a.submit *,button *,input *,select *{color:#BBB!important}[role=button]:hover,a.BigButton:hover,a.TabLink:hover,a.button:hover,a.submit:hover,button:hover,input:hover,input[type=button]:hover,select:hover{border-top-color:#555!important;border-bottom-color:#555!important;border-left-color:#555!important;border-right-color:#555!important}input:focus,select:focus{box-shadow:0 0 5px #077!important}input :hover *{color:#F0F0F0!important}button[disabled],button[disabled]:focus,button[disabled]:hover,input[disabled],input[disabled]:focus,input[disabled]:hover,select[disabled],select[disabled]:focus,select[disabled]:hover{opacity:.5!important;border-color:#333!important}input[type=checkbox]{border-radius:1px!important}input[type=radio],input[type=radio]:focus{border-radius:100%!important}input[type=checkbox],input[type=radio]{min-width:12px;min-height:12px}input[type=checkbox]:checked,input[type=radio]:checked{border-color:#077!important;box-shadow:0 0 5px #077!important}select{padding-right:15px!important;background-color:#060606!important;transition:border-color .3s,background-position .3s!important}.Active .TabLink,a.BigButton:active,a.TabLink:active,a.button:active,a.submit:active,a[class*=button]:not(:empty):active,button:active,input[type=button]:active,input[type=submit]:active{background-color:#292929!important;color:#FFF!important}textarea{-moz-appearance:none!important;-webkit-appearance:none!important;background-color:rgba(0,0,0,.3)!important;border-radius:3px!important;box-shadow:inset 0 0 8px #202125!important;transition:border-color,background,.3s!important}textarea,textarea *{color:#C8C8C8!important}textarea:focus:hover,textarea:hover{border-color:#333!important}textarea:focus{background-color:rgba(0,0,0,.5)!important;border-color:#222!important}textarea:focus,textarea:focus>*{box-shadow:none!important}optgroup,option{-moz-appearance:none!important;-webkit-appearance:none!important;background-color:0 0!important;color:#666!important}optgroup{background-color:#222!important;color:#DDD!important}option:checked,option:focus,option:not([disabled]):hover{background-color:linear-gradient(#333,#292929)!important;color:#DDD!important}img{opacity:.7!important;transition:opacity .2s}#mpiv-popup,a:hover img,img:hover{opacity:1!important}.read-whole-mask .exp-mask,.se-head-tabcover,.wgt-exp-content .exp-img-mask{background-image:none!important}.s_card{background:0 0!important}\');css.appendChild(textNode);var o=document.getElementsByTagName("head");if(o.length>0&&o[0].appendChild(css)){}};'

js =
[[var x=document.getElementsByClassName("mihoyo_landscape");
  for (var i = 0; i<x.length;i++) {
      x[i].style.display="none";
  };
  
  var thisNode = document.getElementById( "mihoyo_landscape" );
  
  if ( thisNode != null && thisNode.parentElement != null ) {
      thisNode.parentElement.removeChild( thisNode );
  };]]

web.setWebChromeClient(
LuaWebChrome(
LuaWebChrome.IWebChrine {
  onProgressChanged = function(view, newProgress)
    local lpm = webprogress.getLayoutParams()
    lpm.width = newProgress * (activity.Width / 100)
    webprogress.setLayoutParams(lpm)

    web.loadUrl([[
          javascript:(function()
            { ]].. js .. [[ })()
          ]])
  end
}
)
)

web.setFocusable(false)

web.setFocusableInTouchMode(false)

web.setOnTouchListener(
View.OnTouchListener{
  onTouch = function(v, event)
    return true
  end
}
)

--print(getjs)

loaderror = false
控件隐藏(loaderr)
控件隐藏(webprogress)
控件隐藏(web)
isFinished = false

web.setWebViewClient {
  shouldOverrideUrlLoading = function(view, url)
    wurl = url
    title.setText("加载中，请稍等 ( ･ิω･ิ)")
    控件隐藏(loaderr)
    loaderror = false
    控件可见(info)
    控件可见(web)
    控件隐藏(after)
  end,
  onPageStarted = function(view, url, favicon)
    控件可见(webprogress)
    wurl = url
    title.setText("加载中，请稍等 ( ･ิω･ิ)")
    控件隐藏(loaderr)
    loaderror = false
    控件可见(info)
    控件可见(web)
    控件隐藏(after)
  end,
  onPageFinished = function(view, url)
    控件隐藏(webprogress)
    wurl = url
    if loaderror == true then
      return true
    end
    title.setText(web.getTitle())

    web.loadUrl([[
      javascript:(function()
        { ]].. js .. [[ })()
      ]])

    --[[web.evaluateJavascript("function getSource(){return \"<html>\"+document.getElementsByTagName('html')[0].innerHTML+\"</html>\";};getSource();",{
      onReceiveValue=function(result)
        local result=result
        :gsub("%%","%%;")
        :gsub("\\\\n","%%n")
        :gsub("\\n","\n")
        :gsub("%%n","\\n")
        :gsub("%%;","%%")
        :gsub("\\u003C","<")
        :gsub("\\\"","\"")
        :gsub("^\"","")
        :gsub("\"$","")
        source=result
    end})]]
    if isFinished == false then
      --[=[web.evaluateJavascript(
        [[/*
 * @name: vconsole调试
 * @Author: 腾讯
 * @version: 1.0
 * @description: 让你可以在手机调试网页
 * @include: *
 * @createTime: 2019-10-11 08:38:28
 * @updateTime: 2019-10-13 14:55:19
 */
(function () {
  /* 判断是否该执行 */
  const key = encodeURIComponent('谷花泰:vconsole调试:执行判断');
  if (window[key]) {
    return;
  };
  window[key] = true;

  /* 开始执行代码 */
  const script = document.createElement('script');
  script.src = 'https://cdn.bootcss.com/vConsole/3.3.4/vconsole.min.js';
  document.head.appendChild(script);
  setTimeout(() => {
    new VConsole()
  }, 800);
})();]],
        {
          onReceiveValue = function(result)
          end
        }
      )
       --]=]

      isFinished = true
      --print(0)
      info.text = "正在加载JS(1/2)"
      web.evaluateJavascript(
      读取文件(activity.getLuaDir("tools/exceljs.min.js")),
      {
        onReceiveValue = function(result)
        end
      }
      )
      --print(1)
      info.text = "正在加载JS(2/2)"
      web.evaluateJavascript(
      读取文件(activity.getLuaDir("tools/FileSaver.min.js")),
      {
        onReceiveValue = function(result)
        end
      }
      )
      --print(2)
      web.evaluateJavascript(
      getjs,
      {
        onReceiveValue = function(result)
          --print(result)
        end
      }
      )
     else
      return true
    end

    loaderror = false
  end,
  onReceivedError = function(view, errorCode, description, failingUrl)
    printLog(nil, errorCode, description, failingUrl)
    loaderror = true
    local furl = failingUrl:match("://(.-)/") or failingUrl:match("://(.+)")
    errwz.text = "在访问 " .. furl .. " 时出错"
    errxx.text = "如需了解更多信息，可以在线搜索此代码：" .. description
    控件可见(loaderr)
    title.setText("")
    activity.Title = furl
  end
}

web.getSettings().setSupportZoom(true)
web.getSettings().setBuiltInZoomControls(true)
web.getSettings().setDisplayZoomControls(false)
web.getSettings().setUseWideViewPort(true)
web.getSettings().setLoadWithOverviewMode(true)
web.getSettings().setJavaScriptEnabled(true)
web.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE)
web.getSettings().setAllowFileAccess(true)
web.getSettings().setAppCacheEnabled(true)
web.getSettings().setDomStorageEnabled(true)
web.getSettings().setDatabaseEnabled(true)
web.setWebContentsDebuggingEnabled(true)

function getBase64StringFromBlobUrl(blobUrl)
  return "javascript: var xhr = new XMLHttpRequest();" ..
  "xhr.open('GET', '" ..
  blobUrl ..
  "', true);" ..
  "xhr.setRequestHeader('Content-type','image/gif');" ..
  "xhr.responseType = 'blob';" ..
  "xhr.onload = function(e) {" ..
  "    if (this.status == 200) {" ..
  "        var blobFile = this.response;" ..
  "        var reader = new FileReader();" ..
  "        reader.readAsDataURL(blobFile);" ..
  "        reader.onloadend = function() {" ..
  "            base64data = reader.result;" ..
  "            lua.execute('4|'+base64data);" ..
  "        }" .. "    }" .. "};" .. "xhr.send();"
end

function saveBase64File(base64n, gifFilePath)
  local base64n = base64n:match("base64%,(.+)")
  local fileBytes = base64.decode(base64n)
  local fileName = "抽卡记录导出_" .. os.date("%m-%d_%H-%M-%S") .. ".xlsx"
  创建文件(新内置存储文件(fileName))
  写入文件(新内置存储文件(fileName), fileBytes)
  提示("保存成功：" .. 新内置存储文件(fileName))
end

控件隐藏(btn1.getParent())
控件隐藏(btn2.getParent())
控件隐藏(btn6.getParent())

web.addJSInterface(
{
  execute = function(s)
    local s1,
    s2 = s:match("(.-)|(.+)")
    activity.runOnUiThread(
    function()
      if s1 == "1" then
        info.text = s2
       elseif s1 == "2" then
        --activity.finish()
        --activity.newActivity("tools/gacha_export_result")--,{s2})
        if 文件是否存在(内置存储文件("gacha_export.tmp")) then
          删除文件(内置存储文件("gacha_export.tmp"))
        end
        创建文件(内置存储文件("gacha_export.tmp"))
        写入文件(内置存储文件("gacha_export.tmp"), s2)
       elseif s1 == "3" then
        info.text = "完成"
        控件隐藏(info)
        控件可见(btn1.getParent())
        控件可见(btn2.getParent())
        控件可见(btn6.getParent())
       elseif s1 == "4" then
        --[[创建文件(新内置存储文件("A.xlsx"))
        写入文件(新内置存储文件("A.xlsx"),s2)]]
        saveBase64File(s2)
       elseif s1 == "5" then
        local yjson = JSON.decode(s2)
        for i = 1, #yjson do
          yjson[i].item_id = nil
          if yjson[i].gacha_type == "400" then
            yjson[i].uigf_gacha_type = "301"
           else
            yjson[i].uigf_gacha_type = yjson[i].gacha_type
          end
        end
        local content = {}
        content.info = {
          ["uid"] = yjson[1].uid,
          ["lang"] = "zh-cn",
          ["export_app"] = "MUKGenshinTool",
          ["export_app_version"] = tostring(应用版本),
          ["uigf_version"] = "v2.2"
        }
        content.list = yjson

        btn6.onClick = function()
          local fileName = "抽卡记录导出_" .. os.date("%m-%d_%H-%M-%S") .. "_UIGF.json"
          创建文件(新内置存储文件(fileName))
          写入文件(新内置存储文件(fileName), JSON.encode(content))
          提示("保存成功：" .. 新内置存储文件(fileName))
        end
      end
    end
    )
  end
},
"lua"
)

web.setDownloadListener {
  onDownloadStart = function(url, userAgent, contentDisposition, mimetype, contentLength)
    returnUrl = url
    --print(url)
  end
}

波纹({TranslationClick}, "方黑")

mukactivity.setDataR("gacha_history", JSON.encode({}))
history = JSON.decode(mukactivity.getData("gacha_history"))

TranslationClick.onClick = function()
  if edit.Text:find(" ") then
    edit.Text = edit.Text:gsub(" ", "")
  end
  if edit.Text:find(" ") then
    edit.Text = edit.Text:gsub(" ", "")
  end
  web.loadUrl(edit.Text)
  table.insert(history, 1, {os.date("%m月%d日 %H时%M分%S秒"), edit.Text})
  if history[11] then
    history[11] = nil
  end
  mukactivity.setData("gacha_history", JSON.encode(history))
end

TranslationClick.setOnTouchListener(
{
  onTouch = function(v, n)
    if tostring(n):find("ACTION_DOWN") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(4)})
      _animatorZ.setDuration(128)
      --设置动画时间
      _animatorZ.setInterpolator(DecelerateInterpolator())
      --设置动画插入器，减速
      _animatorZ.start()
     elseif tostring(n):find("ACTION_UP") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(2)})
      _animatorZ.setDuration(128)
      --设置动画时间
      _animatorZ.setInterpolator(AccelerateInterpolator())
      --设置动画插入器，减速
      _animatorZ.start()
    end
  end
}
)

--Glide.with(activity).load(activity.getLuaDir("res/exam/gacha1.jpg")).skipMemoryCache(true).into(img1)
--Glide.with(activity).load(activity.getLuaDir("res/exam/gacha2.jpg")).skipMemoryCache(true).into(img2)

btn1.onClick = function()
  activity.newActivity("tools/gacha_export_result")
end
btn2.onClick = function()
  web.loadUrl(getBase64StringFromBlobUrl(returnUrl))
end

btn3.onClick = function()
  local bwz
  if 全局主题值 ~= "Night" then
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
      id = "ztbj",
      {
        TextView,
        layout_width = "-1",
        layout_height = "-2",
        textSize = "20sp",
        layout_marginTop = "24dp",
        layout_marginLeft = "24dp",
        layout_marginRight = "24dp",
        Text = "历史记录",
        Typeface = AppFont.特粗,
        textColor = primaryc
      },
      {
        GridView,
        layout_width = "-1",
        layout_height = "-1",
        layout_weight = "1",
        id = "gv",
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

  dl = BottomDialog(activity)
  dl.setView(loadlayout(dann))
  dl.setGravity(Gravity.BOTTOM)
  dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
  dl.setMinHeight(0)
  dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
  --设置圆角
  dl.setRadius(dp2px(16), 转0x(backgroundc))
  dl.setCancelable(true)
  dl.setCanceledOnTouchOutside(true)
  an = dl.show()

  local tool_list_item2 = {
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
          edit.Text = v.Text
          web.loadUrl(edit.Text)
          关闭对话框()
        end,
        OnLongClickListener = function(vn)
          for i, v in ipairs(history) do
            if v[2] == vn.Text then
              table.remove(history, i)
              提示("已删除 " .. v[1])
              关闭对话框()
            end
          end
          mukactivity.setData("gacha_history", JSON.encode(history))
          return true
        end,
        textColor = "#00000000"
      }
    }
  }

  local tladp2
  tladp2 = LuaAdapter(activity, tool_list_item2)

  gv.setAdapter(tladp2)

  for i, v in ipairs(history) do
    tladp2.add {
      tladp_text = v[1],
      tladp_activity = {
        text = v[2],
        BackgroundDrawable = 波纹2("方自适应")
      }
    }
  end
end

import "com.blankj.utilcode.util.Utils$Consumer"

function exec2(n, fun)
  ShellUtils.execCmdAsync(
  n,
  true,
  Consumer {
    accept = function(n)
      if fun then
        local result = n.result
        local successMsg = n.successMsg
        local errorMsg = n.errorMsg
        fun(result, successMsg, errorMsg)
      end
    end
  }
  )
end

exec2(
"",
function(r, s, e)
  if r == 0 then
    --提示("软件已经获取到Root")
    exec("logcat -c")
   else
    --提示("软件未获取到Root")
  end
end
)

btn4.onClick = function()
  exec2(
  "",
  function(r, s, e)
    if r == 0 then
      local log = exec("logcat -d -v long")
      log = log:gsub("%-+ beginning of[^\n]*\n", "")
      local has = false
      for v in log:gmatch("%](.-)%[") do
        if v:find("mihoyo") and v:find("log") and v:find("gacha") then
          edit.Text = v:match("(https%://.-/log)")
          has = true
        end
        if v:find("hoyoverse") and v:find("log") and v:find("gacha") then
          edit.Text = v:match("(https%://.-/log)")
          has = true
        end
      end
      if has == false then
        提示("未在日志中找到链接，请尝试反复进入抽卡历史记录界面后再试")
      end
     else
      提示("软件未获取到Root权限，无法使用该功能\n" .. e)
    end
  end
  )
end

--[[btn5.onClick=function()
  activity.newActivity("mods/chooser")
end]]
function onKeyDown(code, event)
  if string.find(tostring(event), "KEYCODE_BACK") ~= nil then
    activity.finish()
  end
end

function onResult(act, file)
  if act == "mods/chooser" then
    if file:find("%.js$") or file:find("%.json$") or file:find("%.csv$") then
      if 文件是否存在(内置存储文件("gacha_export.tmp")) then
        删除文件(内置存储文件("gacha_export.tmp"))
      end
      创建文件(内置存储文件("gacha_export.tmp"))
      写入文件(内置存储文件("gacha_export.tmp"), 读取文件(file))
      activity.newActivity("tools/gacha_export_result")
     else
      提示("文件格式错误")
    end
  end
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

分屏()
