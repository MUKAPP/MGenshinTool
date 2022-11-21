require "import"
import "mods.muk"

pageurl, shouldload, beforeload, afterload,type_,cookie = ...
--print(...)

function onCreate()
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
          ImageView,
          ColorFilter = stextc,
          src = 图标("info"),
          layout_height = "24dp",
          layout_width = "24dp",
          id = "https",
          layout_marginLeft = "8dp",
          onClick = function()
            info()
          end
        },
        {
          TextView, --标题
          Typeface = AppFont.特粗,
          textSize = "20sp",
          Text = "加载中，请稍等 ( ･ิω･ิ)",
          ellipsize = "end",
          layout_marginLeft = "16dp",
          SingleLine = true,
          textColor = primaryc,
          id = "title",
          layout_weight = "1"
        },
        {
          LinearLayout,
          layout_width = "56dp",
          layout_height = "56dp",
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
            end
          },
          {
            TextView,
            id = "_more_lay",
            layout_width = "0",
            layout_height = "0",
            layout_gravity = "top"
          }
        }
      },
      {
        RelativeLayout,
        layout_height = "-1",
        layout_width = "-1",
        {
          LuaWebView, --主体
          layout_height = "-1",
          layout_width = "-1",
          background = backgroundc,
          id = "web"
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
        },
        {
          LinearLayout,
          layout_height = "-1",
          layout_width = "-1",
          orientation = "vertical",
          Gravity = "bottom|center",
          {
            CardView,
            layout_width = "-1",
            layout_height = "-2",
            CardElevation = "6dp",
            CardBackgroundColor = 转0x(textc) - 0x21000000,
            Radius = "8dp",
            layout_margin = "16dp",
            id = "thirdpart",
            alpha = 0,
            Y = dp2px(56),
            {
              LinearLayout,
              layout_height = -2,
              layout_width = "-1",
              gravity = "left|center",
              padding = "16dp",
              paddingTop = "12dp",
              paddingBottom = "12dp",
              {
                TextView,
                textColor = 转0x(backgroundc),
                textSize = "14sp",
                layout_height = -2,
                layout_width = -1,
                text = "网站请求跳转到第三方软件",
                Typeface = AppFont.标准,
                layout_weight = "1"
              },
              {
                CardView,
                layout_width = "-2",
                layout_height = "-2",
                radius = "4dp",
                background = primaryc,
                layout_marginLeft = "8dp",
                Elevation = "1dp",
                onClick = function()
                  closethirdpart()
                  xpcall(
                  function()
                    local uri = Uri.parse(thirdparturl)
                    local intent = Intent(Intent.ACTION_VIEW, uri)
                    activity.startActivity(intent)
                  end,
                  function(e)
                    提示("拉起第三方应用失败")
                  end
                  )
                end,
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-2",
                  textSize = "14sp",
                  paddingRight = "16dp",
                  paddingLeft = "16dp",
                  Typeface = AppFont.特粗,
                  paddingTop = "8dp",
                  paddingBottom = "8dp",
                  Text = "跳转",
                  textColor = backgroundc,
                  BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                  ColorStateList(int[0].class {int {}}, int {bwz})
                  )
                }
              },
              {
                CardView,
                layout_width = "-2",
                layout_height = "-2",
                radius = "2dp",
                background = "#00000000",
                layout_marginLeft = "8dp",
                Elevation = "0",
                onClick = function()
                  closethirdpart()
                end,
                {
                  TextView,
                  layout_width = "-1",
                  layout_height = "-2",
                  textSize = "14sp",
                  Typeface = AppFont.特粗,
                  paddingRight = "16dp",
                  paddingLeft = "16dp",
                  paddingTop = "8dp",
                  paddingBottom = "8dp",
                  Text = "取消",
                  textColor = 转0x(backgroundc),
                  BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                  ColorStateList(int[0].class {int {}}, int {bwz})
                  )
                }
              }
            }
          }
        }
      }
    }
  }

  设置视图(layout)

  波纹({back, _more}, "圆主题")
  波纹({xz}, "方主题")

  web.removeView(web.getChildAt(0))

  import "org.jsoup.*"

  ------------
  pageurl=activity.getLuaDir("res/JSBridgeUnitTest.html")

  if type_=="hoyobbscapacha"
    import "mods.hoyobbs"
    web.clearCache(true)

    web.getSettings().setUserAgentString(hoyo_ua1)

    local map=HashMap()
    map.put("x-requested-with", "com.mihoyo.hyperion")
    map.put("upgrade-insecure-requests", "1")
    map.put("cache-control", "max-age=0")
    web.getSettings().setUserAgentString(hoyo_ua1)
    CookieSyncManager.createInstance(this)
    cookieManager = CookieManager.getInstance()
    cookieManager.setAcceptCookie(true)
    cookieManager.removeSessionCookie() --移除
    --[[cookieManager.setCookie(
    pageurl,
    cookie
    )
    cookieManager.setCookie(".mihoyo.com", cookie) --cookies是在HttpClient中获得的cookie]]
    CookieSyncManager.getInstance().sync()

    --[[CookieManager.getInstance().setCookie(
    pageurl,
    cookie
    )]]

    web.setCookie(".mihoyo.com", cookie)
    --[[web.setCookie(
    pageurl,
    cookie
    )]]
    web.loadUrl(pageurl,map)
   else
    web.loadUrl(pageurl)
  end

  --PopupWindow
  Popup_layout = {
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

  Popup_list_item = {
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

  popadp = LuaAdapter(activity, Popup_list_item)

  Popup_list.setAdapter(popadp)

  popadp.add {popadp_text = "刷新"}
  popadp.add {popadp_text = "前进"}
  popadp.add {popadp_text = "后退"}
  popadp.add {popadp_text = "停止加载"}
  popadp.add {popadp_text = "浏览器打开"}

  Popup_list.setOnItemClickListener(
  AdapterView.OnItemClickListener {
    onItemClick = function(parent, v, pos, id)
      pop.dismiss()
      local s = v.Tag.popadp_text.Text
      if s == "刷新" then
        web.reload()
      end
      if s == "前进" then
        web.goForward()
      end
      if s == "后退" then
        web.goBack()
      end
      if s == "停止加载" then
        web.stopLoading()
      end
      if s == "浏览器打开" then
        浏览器打开(web.getUrl())
      end
    end
  }
  )

  import "com.lua.*"

  静态渐变(转0x(primaryc) - 转0x("#9f000000"), 转0x(primaryc), webprogress, "横")

  darkmode =
  'if(!document.getElementById(\'via_inject_css_night\')){var css=document.createElement(\'style\');css.id=\'via_inject_css_night\';css.type=\'text/css\';css.rel="stylesheet";var textNode=document.createTextNode(\'html{background-color:#202125!important}*{color:#999!important;box-shadow:none!important;background-color:transparent!important;border-color:#444!important;border-top-color:#444!important;border-bottom-color:#444!important;border-left-color:#444!important;border-right-color:#444!important}body{background-color:transparent!important}:after,:before{background-color:transparent!important;border-color:#444!important}a,a *{color:#88A8E8!important;text-decoration:none!important}.link:hover,.link:hover *,[role=button]:hover *,[role=link]:hover,[role=link]:hover *,[role=menuitem]:hover,[role=menuitem]:hover *,a:hover,a:hover *,a:visited:hover,a:visited:hover *,div[onclick]:hover,span[onclick]:hover{color:#F0F0F0!important}a:visited,a:visited *{color:#88a!important}.selected,.selected *,[href="#"],a.active,a.active *,a.highlight,a.highlight *{color:#DDD!important;font-weight:700!important}[class*=header],[class*=header] td,[class*=headline],[id*=header],[id*=headline],h1,h1 *,h2,h2 *,h3,h3 *,h4,h5,h6,strong{color:#DDD!important}[class*=alert],[class*=error],code,div[onclick],span[onclick]{color:#900!important}::-moz-selection{background-color:#88A8E8fa!important;color:#202125!important}::selection{background-color:#88A8E8fa!important;color:#202125!important}:focus{outline:0!important}div[role=navigation],div[style="display: block;"]{background-color:rgba(0,0,0,.5)!important}table{background-color:rgba(30,30,30,.4)!important;border-radius:6px!important}table>tbody>tr:nth-child(even),table>tbody>tr>td:nth-child(even){background-color:rgba(0,0,0,.2)!important}#ghostery-purple-bubble,#translator-popup,.hovercard,.menu,.tooltip,.vbmenu_popup,[class*=dropdown],[class*=nav] ul,[class*=popup],[class=title],[id*=Menu],[id*=menu],[id*=nav] ul,a[id*=ghosteryfirefox],a[onclick][style*=display],div[role=dialog],div[role=menu],div[style*="position:"][style*="left:"][style*=visible],div[style*="z-index:"][style*="left:"][style*=visible],div[style*="-moz-user-select"],embed,iframe,label [onclick],nav,nav ul,span[class*=script] div,ul[class*=menu],ul[style*="display:"],ul[style*="visibility:"] ul{background-color:rgba(5,5,5,.9)!important;border-radius:5px;box-shadow:1px 1px 5px #202125!important}#footer,#header,footer,header{background-color:rgba(19,19,19,.9)!important;box-shadow:0 0 5px #202125!important}body>#dialog,body>.xenOverlay{background-color:rgba(19,19,19,.96)!important;background-clip:padding-box!important;box-shadow:0 0 15px #202125,inset 0 0 0 1px rgba(200,200,200,.5),inset 0 0 5px #111!important}[id*=lightbox],[id*=overlay],blockquote{background-color:rgba(35,35,35,.9)!important;border-radius:5px}.Message code,dl,pre{background-color:rgba(5,5,5,.5)!important}.install[onclick],[role=button],a.BigButton,a.TabLink,a.button,a.submit,button,input,select{-moz-appearance:none!important;-webkit-appearance:none!important;transition:border-color .3s!important;background-color:#060606!important;color:#BBB!important;box-shadow:0 0 2px rgba(0,0,0,.9)!important}a[class*=button]:not(:empty),a[href="javascript:;"],a[id*=Button]:not(:empty),a[id*=button]:not(:empty),div[class*=button][onclick]{transition:border-color .3s!important;background-color:#060606!important;color:#BBB!important;border-color:#333!important;box-shadow:0 0 2px rgba(0,0,0,.9)!important}a[class*=button]:not(:empty):hover,a[href="javascript:;"]:hover,a[id*=Button]:not(:empty):hover,a[id*=button]:hover,div[class*=button][onclick]:hover{background-color:#151515!important;color:#FFF!important}a.button *,a.submit *,button *,input *,select *{color:#BBB!important}[role=button]:hover,a.BigButton:hover,a.TabLink:hover,a.button:hover,a.submit:hover,button:hover,input:hover,input[type=button]:hover,select:hover{border-top-color:#555!important;border-bottom-color:#555!important;border-left-color:#555!important;border-right-color:#555!important}input:focus,select:focus{box-shadow:0 0 5px #077!important}input :hover *{color:#F0F0F0!important}button[disabled],button[disabled]:focus,button[disabled]:hover,input[disabled],input[disabled]:focus,input[disabled]:hover,select[disabled],select[disabled]:focus,select[disabled]:hover{opacity:.5!important;border-color:#333!important}input[type=checkbox]{border-radius:1px!important}input[type=radio],input[type=radio]:focus{border-radius:100%!important}input[type=checkbox],input[type=radio]{min-width:12px;min-height:12px}input[type=checkbox]:checked,input[type=radio]:checked{border-color:#077!important;box-shadow:0 0 5px #077!important}select{padding-right:15px!important;background-color:#060606!important;transition:border-color .3s,background-position .3s!important}.Active .TabLink,a.BigButton:active,a.TabLink:active,a.button:active,a.submit:active,a[class*=button]:not(:empty):active,button:active,input[type=button]:active,input[type=submit]:active{background-color:#292929!important;color:#FFF!important}textarea{-moz-appearance:none!important;-webkit-appearance:none!important;background-color:rgba(0,0,0,.3)!important;border-radius:3px!important;box-shadow:inset 0 0 8px #202125!important;transition:border-color,background,.3s!important}textarea,textarea *{color:#C8C8C8!important}textarea:focus:hover,textarea:hover{border-color:#333!important}textarea:focus{background-color:rgba(0,0,0,.5)!important;border-color:#222!important}textarea:focus,textarea:focus>*{box-shadow:none!important}optgroup,option{-moz-appearance:none!important;-webkit-appearance:none!important;background-color:0 0!important;color:#666!important}optgroup{background-color:#222!important;color:#DDD!important}option:checked,option:focus,option:not([disabled]):hover{background-color:linear-gradient(#333,#292929)!important;color:#DDD!important}img{opacity:.7!important;transition:opacity .2s}#mpiv-popup,a:hover img,img:hover{opacity:1!important}.read-whole-mask .exp-mask,.se-head-tabcover,.wgt-exp-content .exp-img-mask{background-image:none!important}.s_card{background:0 0!important}\');css.appendChild(textNode);var o=document.getElementsByTagName("head");if(o.length>0&&o[0].appendChild(css)){}};'

  js = ""

  -------MiHoYoJSInterface-------
  function jsResult(data_)
    return {
      retcode=0,
      message="",
      data=data_,
    }
  end
  jsinterface={
    execute=function(s)
      local etype,jscon=s:match("(.+)> (.+)")
      print(etype,jscon)
      jscon_=JSON.decode(jscon)
      activity.runOnUiThread(function()
        if etype=="postMessage"
          if jscon_.method=="showAlertDialog"
            --[[{
              "method":"showAlertDialog",
              "payload":{
                "title":"喵喵喵？",
                "message":"呜呜呜？",
                "buttons":[
                {"title":"确定","style":"primary"},
                {"title":"取消","style":"cancel"}
                ]
              },
              "callback":"showAlertDialogCallback"
            }]]
            双按钮对话框(jscon_.payload.title,jscon_.payload.message,
            jscon_.payload.buttons[1].title,jscon_.payload.buttons[2].title,
            function()
              local resultData=jsResult({
                buttonIndex=0,
              })
              web.evaluateJavascript("javascript:mhyWebBridge(\""..jscon_.callback.."\","
              ..JSON.encode(resultData)..")",{onReceiveValue = function(result)end})
              关闭对话框()
              end,function()
              local resultData=jsResult({
                buttonIndex=1,
              })
              web.evaluateJavascript("javascript:mhyWebBridge(\""..jscon_.callback.."\","
              ..JSON.encode(resultData)..")",{onReceiveValue = function(result)end})
              关闭对话框()
            end)
          end
        end
      end)
      return con
    end,
  }
  web.addJSInterface(jsinterface,"LuaBridge")
  web.addJSInterface({
    execute=function(s)
  end},"MiHoYoJSInterface")
  -------------------------------

  web.setWebChromeClient(
  LuaWebChrome(
  LuaWebChrome.IWebChrine {
    onProgressChanged = function(view, newProgress)
      local lpm = webprogress.getLayoutParams()
      lpm.width = newProgress * (activity.Width / 100)
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
            local types, num = "", 0
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

  loaderror = false
  控件隐藏(loaderr)

  function 设置Cookie(context, url, content)
    CookieSyncManager.createInstance(context)
    local cookieManager = CookieManager.getInstance()
    cookieManager.setAcceptCookie(true)
    cookieManager.removeSessionCookie()
    cookieManager.removeAllCookie()
    if content ~= nil then
      cookieManager.setCookie(url, content)
    end
    CookieSyncManager.getInstance().sync()
  end

  --设置Cookie(this, "mihoyo.com", nil)

  web.setWebViewClient {
    shouldOverrideUrlLoading = function(view, url)
      if url:match("(.-)%:") ~= "http" and url:match("(.-)%:") ~= "https" then
        thirdparturl = url
        openthirdpart()
        return true
      end
      wurl = url
      控件隐藏(https)
      title.setText("加载中，请稍等 ( ･ิω･ิ)")
      activity.Title = "加载中"
      控件隐藏(loaderr)
      loaderror = false
      if shouldload then
        loadstring(shouldload)()
      end
    end,
    onPageStarted = function(view, url, favicon)
      控件可见(webprogress)
      wurl = url
      title.setText("加载中，请稍等 ( ･ิω･ิ)")
      控件隐藏(https)
      activity.Title = "加载中"
      控件隐藏(loaderr)
      loaderror = false

      if beforeload then
        loadstring(beforeload)()
      end
    end,
    onPageFinished = function(view, url)
      控件隐藏(webprogress)
      wurl = url
      if loaderror == true then
        return true
      end
      控件可见(https)
      if wurl:sub(1, 8) == "https://" then
        https.setImageBitmap(loadbitmap(图标("https")))
        https.setColorFilter(0xff4CAF50)
       else
        https.setColorFilter(转0x(stextc))
        https.setImageBitmap(loadbitmap(图标("info")))
      end
      title.setText(web.getTitle())
      if 全局主题值 == "Night" then
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

      activity.Title = web.getTitle()

      if type_=="hoyobbscapacha"
        web.getSettings().setAppCacheEnabled(false)
      end

      -------MiHoYoJSInterface 替换-------
      web.evaluateJavascript([[let c = {};
c.postMessage = (str) =>
  chrome.webview.hostObjects.MiHoYoWebBridge.OnMessage(str);
c.closePage = () => c.postMessage('{"method":"closePage"}');
window.MiHoYoJSInterface = c;]],{
        onReceiveValue = function(result)
        end
      })
      web.evaluateJavascript([[window.MiHoYoJSInterface.postMessage_ = window.MiHoYoJSInterface.postMessage;
window.MiHoYoJSInterface.postMessage = function(val){
    return window.LuaBridge.execute("postMessage> "+val);
};
]],{
        onReceiveValue = function(result)
        end
      })
      -------------------------------

      loaderror = false
      if afterload then
        loadstring(afterload)()
      end
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
    end,
    shouldInterceptRequest = function(view, url)
      --print(url)
    end
  }

  web.getSettings().setSupportZoom(true)
  web.getSettings().setBuiltInZoomControls(true)
  web.getSettings().setDefaultFontSize(14)
  web.getSettings().setDisplayZoomControls(false)
  web.getSettings().setUseWideViewPort(true)
  web.getSettings().setLoadWithOverviewMode(true)
  web.getSettings().setJavaScriptEnabled(true)
  web.getSettings().setAllowFileAccess(true)
  web.getSettings().setAppCacheEnabled(true)
  web.getSettings().setDomStorageEnabled(true)
  web.getSettings().setDatabaseEnabled(true)
  web.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE)

  function webinfo()
    头 = wurl:match("(.+)://")
    if 头 == nil then
      颜色 = "#424242"
      头 = "about:blank"
      文本 = "空白页"
      链接 = " | 空白页"
      颜色 = "#ff4CAF50"
      文本 = "当无链接时加载的空白页面"
     else
      头 = 头 .. "://"
      链接 = web.getUrl():match("://(.+)")
      if 头 == "https://" then
        颜色 = "#ff4CAF50"
        文本 = "您与此网站之间建立了加密链接"
       else
        颜色 = stextc
        文本 = "您与此网站之间未建立加密链接"
      end
    end
    local gd2 = GradientDrawable()
    gd2.setColor(转0x(backgroundc))
    --填充
    gd2.setCornerRadii({dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8)})
    --圆角
    gd2.setShape(0)
    --形状，0矩形，1圆形，2线，3环形
    local dann = {
      LinearLayout,
      layout_width = "-1",
      layout_height = "-1",
      {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-2",
        Elevation = "4dp",
        BackgroundDrawable = gd2,
        layout_marginBottom = "24dp",
        {
          LinearLayout,
          orientation = "vertical",
          layout_width = "-1",
          layout_height = "-1",
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-2",
            {
              TextView,
              layout_width = "-2",
              layout_height = "-2",
              textSize = "16sp",
              layout_marginTop = "24dp",
              layout_marginLeft = "24dp",
              Typeface = AppFont.标准,
              Text = 头,
              textColor = 颜色,
              onClick = function()
                复制文本(web.getUrl())
                提示("已复制网址")
              end
            },
            {
              TextView,
              layout_width = "-1",
              layout_height = "-2",
              textSize = "16sp",
              layout_marginTop = "24dp",
              layout_marginRight = "24dp",
              Typeface = AppFont.标准,
              Text = 链接,
              textColor = textc,
              onClick = function()
                复制文本(web.getUrl())
                提示("已复制网址")
              end
            }
          },
          {
            TextView,
            layout_width = "-1",
            layout_height = "-2",
            textSize = "14sp",
            layout_marginBottom = "24dp",
            layout_marginRight = "24dp",
            layout_marginTop = "8dp",
            layout_marginLeft = "24dp",
            Typeface = AppFont.特粗,
            Text = 文本,
            textColor = stextc
          }
        }
      }
    }

    dl = AlertDialog.Builder(activity)
    dl.setView(loadlayout(dann))
    an = dl.show()
    local window = an.getWindow()
    window.setBackgroundDrawable(ColorDrawable(0x00000000))
    local wlp = window.getAttributes()
    wlp.gravity = Gravity.TOP
    wlp.width = WindowManager.LayoutParams.MATCH_PARENT
    wlp.height = WindowManager.LayoutParams.WRAP_CONTENT
    window.setAttributes(wlp)
  end

  function info()
    if wurl:sub(1, 8) == "https://" then
      https.setImageBitmap(loadbitmap(图标("https")))
      https.setColorFilter(0xff4CAF50)
     else
      https.setColorFilter(转0x(stextc))
      https.setImageBitmap(loadbitmap(图标("info")))
    end
    webinfo()
  end

  控件隐藏(https)

  web.setDownloadListener {
    onDownloadStart = function(url, userAgent, contentDisposition, mimetype, contentLength)
      --[[local i = Intent(Intent.ACTION_VIEW);
      i.setData(Uri.parse(url));
      activity.startActivity(i);]]
      --print(url,contentDisposition,mimetype,contentLength)
      size = "未知"
      xpcall(
      function()
        size = tostring(contentLength / 1024 / 1024):sub(1, 4) .. "MB"
      end,
      function()
        size = "未知"
      end
      )
      xpcall(
      function()
        filename = string.match(url, ".+/([^/]*%.%w+)$")
      end,
      function()
        filename = os.date("%m-%d_%H-%M-%S")
      end
      )
      if filename == nil then
        filename = os.date("%m-%d_%H-%M-%S")
      end
      双按钮对话框(
      "下载文件",
      "文件描述: " .. filename .. "\n文件大小: " .. size,
      "下载",
      "取消",
      function()
        关闭对话框()
        下载文件(url, filename)
      end,
      function()
        关闭对话框()
      end
      )
    end
  }

  function closethirdpart()
    local id = thirdpart
    mfbha =
    ViewAnimator.animate({id}).translationY({id.translationY, dp2px(64)}).alpha({id.alpha, 0}).interpolator(
    AccelerateInterpolator()
    ).duration(256).onStop(
    {
      onStop = function()
        控件隐藏(id)
      end
    }
    ).start()
  end

  thirdparturl = ""

  function openthirdpart()
    local id = thirdpart
    控件可见(id)
    mfbsa =
    ViewAnimator.animate({id}).translationY({id.translationY, 0}).alpha({id.alpha, 1}).interpolator(
    OvershootInterpolator()
    ).duration(256).onStop(
    {
      onStop = function()
        控件可见(id)
      end
    }
    ).start()
  end

  分屏()
end

function onKeyDown(code, event)
  if string.find(tostring(event), "KEYCODE_BACK") ~= nil then
    if pop.isShowing() then
      pop.dismiss()
      return true
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
