require "import"
import "mods.muk"
import "mods.hoyobbs"

function onCreate()
  layout={
    RelativeLayout;
    layout_height="-1";
    layout_width="-1";
    background=backgroundc;
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      orientation="vertical";
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
          Text="加载中，请稍等 ( ･ิω･ิ)";
          ellipsize="end";
          layout_marginLeft="16dp";
          SingleLine=true;
          textColor=primaryc;
          id="title";
          layout_weight="1";
        };
        {
          LinearLayout;
          layout_width="56dp";
          layout_height="56dp";
          --background=backgroundc;
          gravity="center";
          {
            ImageView;
            layout_width="32dp";
            layout_height="32dp";
            padding="4dp";
            ColorFilter=primaryc;
            src=图标("more_vert");
            id="_more";
            onClick=function()
              --pop.showAsDropDown(_more_lay,dp2px(-8-192),dp2px(8))
              pop.showAsDropDown(_more_lay)
            end;
          };
          {
            TextView;
            id="_more_lay";
            layout_width="0",
            layout_height="0",
            layout_gravity="top";
          };
        };
      };
      {
        RelativeLayout;
        layout_height="-1";
        layout_width="-1";
        {
          LinearLayout,
          layout_width="-1",
          layout_height="-1",
          Gravity = "center",
          {
            ProgressBar,
            layout_width = "56dp",
            layout_height = "56dp",
            id="pb",
          },
        },
        {
          LuaWebView;--主体
          layout_height="-1";
          layout_width="-1";
          background=backgroundc;
          id="web";
        };
        {
          LinearLayout,
          layout_width="-1",
          layout_height="-1",
          orientation="vertical",
          padding="24dp";
          paddingTop="16dp";
          background=backgroundc;
          --gravity="center";
          id="loaderr";
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-1",
              orientation="vertical",
              padding="28dp";
              {
                TextView;
                text=":(";
                textColor=primaryc;
                textSize="48sp";
                layout_height="-2";
                layout_width="-1",
                Typeface=AppFont.特粗;
              };
              {
                TextView;
                text="Not Found";
                textColor=primaryc;
                textSize="36sp";
                layout_height="-2";
                layout_width="-1",
                paddingTop="8dp";
                Typeface=AppFont.特粗;
              };
              {
                TextView,
                textSize="18sp",
                textColor=primaryc,
                text="你要找的网页跑丢了！",
                Typeface=AppFont.标准;
                paddingTop="8dp";
              },
              {
                TextView,
                textSize="14sp",
                textColor=textc,
                text="在访问 https://www.mukapp.top 时出错",
                Typeface=AppFont.标准;
                paddingTop="16dp";
                id="errwz";
              },
              {
                TextView,
                textSize="14sp",
                textColor=stextc,
                text="建议：\n- 检查您的网络连接或者刷新网页\n- 检查网站运作是否正常",
                Typeface=AppFont.标准;
                paddingTop="16dp";
              },
              {
                TextView,
                textSize="14sp",
                textColor=stextc,
                text="如需了解更多信息，可以在线搜索此代码：ERR_MUKNB",
                Typeface=AppFont.标准;
                paddingTop="16dp";
                id="errxx";
              },
            },
          },
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(primaryc)-0xde000000;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_marginTop="24dp";
            {
              TextView;
              layout_width="-1";
              layout_height="-1";
              textSize="16sp";
              paddingRight="16dp";
              paddingLeft="16dp";
              Typeface=AppFont.特粗;
              paddingTop="12dp";
              paddingBottom="12dp";
              gravity="center";
              Text="刷新";
              onClick=function()web.reload()end;
              textColor=primaryc;
              id="xz";
            };
          };
        },
        {
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          --background=viewshaderc;
          {
            TextView;
            layout_width="-1";
            layout_height="2dp";
            id="webprogress";
          };
        };
        {
          LinearLayout,
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          Gravity="bottom|center",
          {
            CardView,
            layout_width="-1";
            layout_height="-2";
            CardElevation="6dp",
            CardBackgroundColor=转0x(textc)-0x21000000,
            Radius="8dp",
            layout_margin="16dp";
            id="thirdpart",
            alpha=0,
            Y=dp2px(56),
            {
              LinearLayout,
              layout_height=-2,
              layout_width="-1";
              gravity="left|center",
              padding="16dp";
              paddingTop="12dp";
              paddingBottom="12dp";
              {
                TextView,
                textColor=转0x(backgroundc),
                textSize="14sp";
                layout_height=-2,
                layout_width=-1,
                text="网站请求跳转到第三方软件\n（如果要登录帐号直接在该页面登录就行，不用拉起米游社）";
                Typeface=AppFont.标准,
                layout_weight="1",
              },
              {
                CardView;
                layout_width="-2";
                layout_height="-2";
                radius="4dp";
                background=primaryc;
                layout_marginLeft="8dp";
                Elevation="1dp";
                onClick=function()
                  closethirdpart()
                  xpcall(function()
                    local uri = Uri.parse(thirdparturl);
                    local intent = Intent(Intent.ACTION_VIEW, uri);
                    activity.startActivity(intent);
                    end,function(e)
                    提示("拉起第三方应用失败")
                  end)
                end;
                {
                  TextView;
                  layout_width="-1";
                  layout_height="-2";
                  textSize="14sp";
                  paddingRight="16dp";
                  paddingLeft="16dp";
                  Typeface=AppFont.特粗;
                  paddingTop="8dp";
                  paddingBottom="8dp";
                  Text="跳转";
                  textColor=backgroundc;
                  BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                };
              };
              {
                CardView;
                layout_width="-2";
                layout_height="-2";
                radius="2dp";
                background="#00000000";
                layout_marginLeft="8dp";
                Elevation="0";
                onClick=function()
                  closethirdpart()
                end;
                {
                  TextView;
                  layout_width="-1";
                  layout_height="-2";
                  textSize="14sp";
                  Typeface=AppFont.特粗;
                  paddingRight="16dp";
                  paddingLeft="16dp";
                  paddingTop="8dp";
                  paddingBottom="8dp";
                  Text="取消";
                  textColor=转0x(backgroundc);
                  BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                };
              };
            }
          }
        }
      };
    };
  };

  设置视图(layout)

  波纹({back,_more},"圆主题")
  波纹({xz},"方主题")

  web.removeView(web.getChildAt(0))

  pb.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(转0x(primaryc), PorterDuff.Mode.SRC_ATOP))

  import "org.jsoup.*"

  CookieManager.getInstance().removeAllCookies(nil)
  CookieManager.getInstance().flush()

  CookieSyncManager.createInstance(this)
  cookieManager = CookieManager.getInstance()
  cookieManager.setAcceptCookie(true)
  cookieManager.removeSessionCookie() --移除
  cookieManager.setCookie(
  "https://user.mihoyo.com",
  ""
  )
  cookieManager.setCookie(".mihoyo.com", "") --cookies是在HttpClient中获得的cookie
  CookieSyncManager.getInstance().sync()

  CookieManager.getInstance().setCookie(
  "https://user.mihoyo.com",
  ""
  )

  web.setCookie(".mihoyo.com", "")
  web.setCookie(
  "https://user.mihoyo.com",
  ""
  )

  web.loadUrl(
  "https://user.mihoyo.com"
  )

  local map = HashMap()
  web.loadUrl("https://user.mihoyo.com/#/login/captcha",map)

  --PopupWindow
  Popup_layout={
    LinearLayout;
    {
      CardView;
      CardElevation="6dp";
      CardBackgroundColor=ctbackc;
      Radius="8dp";
      layout_width="-1";
      layout_height="-2";
      layout_margin="8dp";
      {
        GridView;
        layout_height="-1";
        layout_width="-1";
        NumColumns=1;
        id="Popup_list";
      };
    };
  };

  pop=PopupWindow(activity)
  pop.setContentView(loadlayout(Popup_layout))
  pop.setWidth(dp2px(192))
  pop.setHeight(-2)

  pop.setOutsideTouchable(true)
  pop.setBackgroundDrawable(ColorDrawable(0x00000000))

  Popup_list_item={
    LinearLayout;
    layout_width="-1";
    layout_height="48dp";
    {
      TextView;
      id="popadp_text";
      textColor=textc;
      layout_width="-1";
      layout_height="-1";
      textSize="14sp";
      gravity="left|center";
      paddingLeft="16dp";
      Typeface=AppFont.标准;
    };
  };

  popadp=LuaAdapter(activity,Popup_list_item)

  Popup_list.setAdapter(popadp)

  popadp.add{popadp_text="刷新",}
  popadp.add{popadp_text="前进",}
  popadp.add{popadp_text="后退",}
  popadp.add{popadp_text="停止加载",}

  Popup_list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent, v, pos,id)
      pop.dismiss()
      local s=v.Tag.popadp_text.Text
      if s=="刷新" then
        web.reload()
      end
      if s=="前进" then
        web.goForward()
      end
      if s=="后退" then
        web.goBack()
      end
      if s=="停止加载" then
        web.stopLoading()
      end
    end
  })

  import "com.lua.*"

  静态渐变(转0x(primaryc)-转0x("#9f000000"),转0x(primaryc),webprogress,"横")

  js=""

  web.setWebChromeClient(LuaWebChrome(LuaWebChrome.IWebChrine{
    onProgressChanged=function(view, newProgress)
      local lpm=webprogress.getLayoutParams()
      lpm.width=newProgress*(activity.Width/100)
      webprogress.setLayoutParams(lpm)
      if 全局主题值=="Night" or 全局主题值=="Star" then
        web.loadUrl([[
      javascript:(function()
        { ]]..darkmodejs..[[ })()
      ]]);
      end
      web.loadUrl([[
      javascript:(function()
        { ]]..js..[[ })()
      ]]);
    end,
    onShowFileChooser=function(view,valueCallbackuri,fileChooserParams)
      uploadMessageAboveL=valueCallbackuri
      local intet = Intent(Intent.ACTION_GET_CONTENT);
      intet.addCategory(Intent.CATEGORY_OPENABLE);
      if fileChooserParams.getAcceptTypes() then
        if tostring(fileChooserParams.getAcceptTypes()):find("/") then
          intet.setType(fileChooserParams.getAcceptTypes());
          --print(fileChooserParams.getAcceptTypes())
         else
          if fileChooserParams.getAcceptTypes()[0]~="" and fileChooserParams.getAcceptTypes()[0]:find("/") then
            local types,num="",0
            while true do
              local n=(fileChooserParams.getAcceptTypes()[num])
              if n:find("%.") then
                --n=n:gsub("%.","*/")
              end
              if types=="" then
                types=n
               else
                types=types..";"..n
              end
              num=num+1
              if not pcall(function()
                  local a=fileChooserParams.getAcceptTypes()[num]
                end) then
                break
              end
            end
            intet.setType(types);
           else
            intet.setType("*/*");
            --print("* /1")
          end
        end
       else
        intet.setType("*/*");
        --print("* /2")
      end
      if mukactivity.getData("Web_Upload_All_Types_File")=="true" then
        intet.setType("*/*");
      end
      activity.startActivityForResult(Intent.createChooser(intet, "File Chooser"), 1);
      --准备回调
      onActivityResult=function(req,res,intent)
        if (res == Activity.RESULT_CANCELED) then
          if(uploadMessageAboveL~=nil )then
            uploadMessageAboveL.onReceiveValue(nil);
          end
        end
        local results
        if (res == Activity.RESULT_OK)then
          if(uploadMessageAboveL==nil or type(uploadMessageAboveL)=="number")then
            return;
          end
          if (intent ~= nil) then
            local dataString = intent.getDataString();
            local clipData = intent.getClipData();
            if (clipData ~= nil) then
              results = Uri[clipData.getItemCount()];
              for i = 0,clipData.getItemCount()-1 do
                local item = clipData.getItemAt(i);
                results[i] = item.getUri();
              end
            end
            if (dataString ~= nil) then
              results = Uri[1];
              results[0]=Uri.parse(dataString)
            end
          end
        end
        if(results~=nil)then
          uploadMessageAboveL.onReceiveValue(results);
          uploadMessageAboveL = nil;
        end
      end
      return true;
    end,
  }));

  loaderror=false
  控件隐藏(loaderr)

  web.setWebViewClient{
    shouldOverrideUrlLoading=function(view,url)
      if url:match("(.-)%:")~="http" and url:match("(.-)%:")~="https" then
        thirdparturl=url
        openthirdpart()
        return true
      end
      wurl=url
      title.setText("加载中，请稍等 ( ･ิω･ิ)")
      activity.Title="加载中"
      控件隐藏(loaderr)
      loaderror=false
    end,
    onPageStarted=function(view,url,favicon)
      控件可见(webprogress)
      wurl=url
      title.setText("加载中，请稍等 ( ･ิω･ิ)")
      activity.Title="加载中"
      控件隐藏(loaderr)
      loaderror=false
    end,
    onPageFinished=function(view,url)
      控件隐藏(webprogress)
      wurl=url
      if loaderror==true then
        return true
      end
      title.setText(web.getTitle())
      if 全局主题值=="Night" then
        web.loadUrl([[
      javascript:(function()
        { ]]..darkmodejs..[[ })()
      ]]);
      end
      activity.Title=web.getTitle()

      if wurl:find("account") and wurl:find("home") then
        cookie=web.getCookie()
        
        printLog("Cookie",cookie)
        if web.getCookie():find("login_ticket") then
          提示("登录成功")
          控件隐藏(web)

          Http.get("https://webapi.account.mihoyo.com/Api/login_by_cookie?t="..os.time(),cookie,nil,nil,
          function(code,content)
            printLog("Hoyoapi login_by_cookie",content)
            if code~=200
              提示("获取失败，请检查网络："..code)
              return true
            end
            content=JSON.decode(content)
            local account_id=content.data.account_info.account_id
            local weblogin_token=content.data.account_info.weblogin_token

            Http.get("https://api-takumi.mihoyo.com/auth/api/getMultiTokenByLoginTicket?login_ticket="..weblogin_token.."&token_types=3&uid="..account_id,cookie,nil,nil,
            function(code,content)
              if code~=200
                提示("获取失败，请检查网络："..code)
                return true
              end
              printLog("Hoyoapi getMultiTokenByLoginTicket",content)
              content=JSON.decode(content)
              printLog("Hoyoapi getMultiTokenByLoginTicket(format)",content)
              _cookie2= "stuid=" .. account_id .. '; '
              for i,v in ipairs(content.data.list)
                _cookie2=_cookie2..v.name.."="..v.token.."; "
              end
              cookie2=cookie.."; ".._cookie2
              printLog("newCookie",cookie2)

              Http.get("https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",cookie2,nil,nil,
              function(code,content)
                if code~=200
                  提示("获取失败，请检查网络："..code)
                  return true
                end
                printLog("Hoyoapi getUserGameRolesByCookie",content)
                content=JSON.decode(content)
                printLog("Hoyoapi getUserGameRolesByCookie(format)",content)
                local function next(game_uid,game_biz,region)
                  local map = HashMap()
                  map.put("Content-Type", "application/json;charset=utf-8")
                  map.put("Host", "api-takumi.mihoyo.com")
                  map.put("Accept", "application/json, text/plain, */*")
                  map.put("x-rpc-app_version", "2.28.1")
                  map.put("x-rpc-client_type", "5")
                  map.put("x-rpc-device_id",string.upper(tostring(UUID.randomUUID())))
                  local function getDs()
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

                    local c = string.lower(MD5("salt=ulInCDohgEs557j0VsPDYnQaaz6KJcv5&t=" .. i .. "&r=" .. r))
                    return i .. "," .. r .. "," .. c
                  end
                  map.put("DS", getDs())


                  --[[map.put("Origin", "https://webstatic.mihoyo.com")
                  map.put(
                  "User-Agent",
                  getUA().." miHoYoBBS/"..mihoyobbs_Version
                  )
                  map.put("Referer", "https://webstatic.mihoyo.com/bbs/event/signin-ys/index.html?bbs_auth_required=true&act_id="..act_id.."&utm_source=bbs&utm_medium=mys&utm_campaign=icon")
                  map.put("X-Requested-With", "com.mihoyo.hyperion") ]]

                  Http.post("https://api-takumi.mihoyo.com/binding/api/genAuthKey",JSON.encode{
                    "auth_appid":"webview_gacha",
                    "game_biz":game_biz,
                    "game_uid":game_uid,
                    "region":region},cookie2,nil,map,
                  function(code,content)
                    if code~=200
                      提示("获取失败，请检查网络："..code)
                      return true
                    end
                    printLog("Hoyoapi genAuthKey",content)
                    content=JSON.decode(content)
                    local link="https://hk4e-api.mihoyo.com/event/gacha_info/api/getGachaLog?win_mode=fullscreen&authkey_ver=1&sign_type=2&auth_appid=webview_gacha&init_type=301&gacha_id=b4ac24d133739b7b1d55173f30ccf980e0b73fc1&lang=zh-cn&device_type=mobile&game_version=CNRELiOS3.0.0_R10283122_S10446836_D10316937&plat_type=ios&game_biz=" .. game_biz .. "&authkey=" .. URLEncoder.encode(content.data.authkey) .. "&region=" .. region .. "&timestamp="..os.time().."&gacha_type=301&page=1&size=20&end_id=0"

                    printLog("link",link)
                    提示("获取成功")
                    activity.result({link})
                  end)
                end
                if #content.data.list>0
                  if #content.data.list==1
                    local game_uid=content.data.list[1].game_uid
                    local game_biz=content.data.list[1].game_biz
                    local region=content.data.list[1].region

                    next(game_uid,game_biz,region)
                   else
                    --多账号
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
                            radius = "4dp",
                            background = primaryc,
                            layout_marginTop = "8dp",
                            layout_marginLeft = "8dp",
                            layout_marginRight = "24dp",
                            layout_marginBottom = "24dp",
                            Elevation = "1dp",
                            onClick = function()
                              关闭对话框(ansuid)
                              activity.finish()
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
                              Text = "返回",
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
                          textColor = "#00000000",
                        }
                      }
                    }

                    local suidadp
                    suidadp = LuaAdapter(activity, suiditem)
                    for i=1,#content.data.list do
                      local game_uid=content.data.list[i].game_uid
                      local game_biz=content.data.list[i].game_biz
                      local region=content.data.list[i].region
                      suidadp.add {
                        tladp_text = game_uid,
                        tladp_activity = {
                          BackgroundDrawable = 波纹2("方自适应"),
                          onClick = function(v)
                            关闭对话框(ansuid)
                            next(game_uid,game_biz,region)
                          end,
                        }
                      }
                    end

                    suidgv.setAdapter(suidadp)
                  end
                 else
                  提示("该米游社账号未绑定原神账号")
                end
              end)
            end)
          end)
         else
          提示("登录失败，Cookie内未找到必要参数，请尝试重新登录")
          activity.finish()
        end
      end

      printLog("WEB onPageFinished","url",wurl)

      loaderror=false
    end,
    onReceivedError=function(view,errorCode,description,failingUrl)
      printLog(nil,errorCode,description,failingUrl)
      loaderror=true
      local furl=failingUrl:match("://(.-)/") or failingUrl:match("://(.+)")
      errwz.text="在访问 "..furl.." 时出错"
      errxx.text="如需了解更多信息，可以在线搜索此代码："..description
      控件可见(loaderr)
      title.setText("")
      activity.Title=furl
    end,
    shouldInterceptRequest=function(view,url)
      if url:find("getUserGameRolesByCookie") then
        --web.getCookie()
        web.post(Runnable{
          run=function()
            --[[Http.get(url,web.getCookie(),nil,nil,
            function(code,con)
              local con=JSON.decode(con)
              --print(con.data.list[0])
              --web.loadUrl("https://api-takumi.mihoyo.com/event/bbs_sign_reward/info?act_id=e202009291139501&region=cn_gf01&uid=114640851")
            end)]]
          end
        })
      end
    end
  }

  web.getSettings().setSupportZoom(true);
  web.getSettings().setBuiltInZoomControls(true);
  web.getSettings().setDefaultFontSize(14);
  web.getSettings().setDisplayZoomControls(false);
  web.getSettings().setUseWideViewPort(true);
  web.getSettings().setLoadWithOverviewMode(true);
  web.getSettings().setJavaScriptEnabled(true);
  web.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
  web.getSettings().setAllowFileAccess(true);
  web.getSettings().setAppCacheEnabled(true);
  web.getSettings().setDomStorageEnabled(true);
  web.getSettings().setDatabaseEnabled(true);

  --web.getSettings().setUserAgentString("Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RKQ1.210518.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/91.0.4472.120 Mobile Safari/537.36 miHoYoBBS/2.10.1");

  web.setDownloadListener{
    onDownloadStart=function(url, userAgent, contentDisposition, mimetype, contentLength)
      --[[local i = Intent(Intent.ACTION_VIEW);
      i.setData(Uri.parse(url));
      activity.startActivity(i);]]
      --print(url,contentDisposition,mimetype,contentLength)
      size="未知"
      xpcall(function()
        size=tostring(contentLength/1024/1024):sub(1,4).."MB"
        end,function()
        size="未知"
      end)
      xpcall(function()
        filename= string.match(url, ".+/([^/]*%.%w+)$")
        end,function()
        filename=os.date("%m-%d_%H-%M-%S")
      end)
      if filename==nil then
        filename=os.date("%m-%d_%H-%M-%S")
      end
      双按钮对话框("下载文件",
      "文件描述: "..filename.."\n文件大小: "..size,
      "下载",
      "取消",function()
        关闭对话框()
        下载文件(url,filename)
        end,function()
        关闭对话框()
      end)
    end
  };

  function closethirdpart()
    local id=thirdpart
    mfbha=ViewAnimator.animate({id})
    .translationY({id.translationY, dp2px(64)})
    .alpha({id.alpha, 0})
    .interpolator(AccelerateInterpolator())
    .duration(256)
    .onStop({
      onStop=function()
        控件隐藏(id)
      end
    })
    .start()
  end

  thirdparturl=""

  function openthirdpart()

    local id=thirdpart
    控件可见(id)
    mfbsa=ViewAnimator.animate({id})
    .translationY({id.translationY, 0})
    .alpha({id.alpha, 1})
    .interpolator(OvershootInterpolator())
    .duration(256)
    .onStop({
      onStop=function()
        控件可见(id)
      end
    })
    .start()
  end

  分屏()
end

function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if pop.isShowing() then
      pop.dismiss()
      return true
    end
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
