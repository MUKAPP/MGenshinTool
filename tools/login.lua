require "import"
import "mods.muk"
import "mods.hoyobbs"

relogin = ...

function onCreate()
    layout = {
        RelativeLayout;
        layout_height = "-1";
        layout_width = "-1";
        background = backgroundc;
        {
            LinearLayout;
            layout_height = "-1";
            layout_width = "-1";
            orientation = "vertical";
            {
                LinearLayout; --标题栏
                orientation = "horizontal";
                layout_height = "56dp";
                layout_width = "-1";
                background = barbackgroundc;
                gravity = "center|left";
                id = "mActionBar";
                {
                    LinearLayout;
                    orientation = "horizontal";
                    layout_height = "56dp";
                    layout_width = "56dp";
                    gravity = "center";
                    {
                        ImageView;
                        ColorFilter = primaryc;
                        src = 图标("arrow_back");
                        layout_height = "32dp";
                        layout_width = "32dp";
                        padding = "4dp";
                        id = "back";
                        onClick = function() 关闭页面() end;
                    };
                };
                {
                    TextView; --标题
                    Typeface = AppFont.特粗;
                    textSize = "20sp";
                    Text = "加载中，请稍等 ( ･ิω･ิ)";
                    ellipsize = "end";
                    layout_marginLeft = "16dp";
                    SingleLine = true;
                    textColor = primaryc;
                    id = "title";
                    layout_weight = "1";
                };
                {
                    LinearLayout;
                    layout_width = "56dp";
                    layout_height = "56dp";
                    --background=backgroundc;
                    gravity = "center";
                    {
                        ImageView;
                        layout_width = "32dp";
                        layout_height = "32dp";
                        padding = "4dp";
                        ColorFilter = primaryc;
                        src = 图标("more_vert");
                        id = "_more";
                        onClick = function()
                            --pop.showAsDropDown(_more_lay,dp2px(-8-192),dp2px(8))
                            pop.showAsDropDown(_more_lay)
                        end;
                    };
                    {
                        TextView;
                        id = "_more_lay";
                        layout_width = "0",
                        layout_height = "0",
                        layout_gravity = "top";
                    };
                };
            };
            {
                RelativeLayout;
                layout_height = "-1";
                layout_width = "-1";
                {
                    LinearLayout,
                    layout_width = "-1",
                    layout_height = "-1",
                    orientation = "vertical",
                    {
                        LuaWebView; --主体
                        layout_height = "-1";
                        layout_width = "-1";
                        background = "#ffffff";
                        layout_weight = "1",
                        id = "web";
                    };
                    {
                        CardView,
                        CardElevation = "0dp",
                        CardBackgroundColor = 转0x(primaryc) - 0xde000000,
                        Radius = "0dp",
                        layout_width = "-1",
                        layout_height = "-2",
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
                            Text = "确认登录成功后点击这里",
                            onClick = function()
                                if web.getCookie():find("login_ticket") then
                                    提示("请等待")
                                    --[[
     mi18nLang=zh-cn;
     _MHYUUID=65c09e00-9e03-4003-a8e2-4d4035e401ae; 
     ltoken=Kd6eaYj1ss7pxnZVljnxp7nwwUvbU12yWunEqubV; 
     ltuid=183512966;
     UM_distinctid=18421ba2595b0e-0433d53be28b5a-7d5d5474-144000-18421ba2596e75; 
     cookie_token=GDZP09JOEYKKUGPNqtN52AU7fU2Jt4MKhrM4JII0; 
     account_id=183512966;
     DEVICEFP=38d7ec378578c; 
     login_uid=183512966; 
     login_ticket=OuiM0rYbVYp77MvW0GvGivMxan6aEaIFNEJIqTRf]]
                                    ---@type string
                                    local multiToken      = web.getCookie()
                                    local multiTokenTable = cookieSplit(multiToken)
                                    printLog("getCookie multiToken", multiTokenTable)

                                    Http.get(ApiTakumiAuthApi ..
                                        "/getMultiTokenByLoginTicket?login_ticket=" ..
                                        multiTokenTable.login_ticket ..
                                        "&uid=" .. multiTokenTable.login_uid .. "&token_types=3",
                                        function(code, content)
                                            if code == 200 then
                                                printLog("getMultiTokenByLoginTicket", code, content)
                                                local content = JSON.decode(content)
                                                if content.retcode == 0 then
                                                    local stoken_ = ""
                                                    for _, v in ipairs(content.data.list) do
                                                        if v.name == "stoken" then
                                                            stoken_ = v.token
                                                        end
                                                    end
                                                    stokenV1 = mergeSplit({
                                                        stuid = multiTokenTable.login_uid,
                                                        stoken = stoken_,
                                                    })
                                                    printLog("stokenV1", stokenV1)

                                                    local map = HashMap()
                                                    map.put("User-Agent", hoyo_ua2)
                                                    map.put("Content-Type", "application/json")
                                                    map.put("x-rpc-aigis", "")
                                                    map.put("x-rpc-app_id", "bll8iq97cem8")
                                                    map.put("x-rpc-app_version", mihoyobbs_Version)
                                                    map.put("x-rpc-client_type", mihoyobbs_Client_type)
                                                    map.put("x-rpc-device_id", device_id)
                                                    map.put("x-rpc-game_biz", "bbs_cn")
                                                    map.put("x-rpc-sdk_version", "1.3.1.2")

                                                    map.put("DS", getLoginDS())
                                                    Http.post(PassportApi ..
                                                        "/account/ma-cn-session/app/getTokenBySToken", "", stokenV1, nil
                                                        , map, function(code, content)
                                                        printLog("getTokenBySToken", content)
                                                        if code == 200 then
                                                            local content = JSON.decode(content)
                                                            if content.retcode == 0 then
                                                                stokenV2table = {
                                                                    ["stuid"] = content.data.user_info.aid,
                                                                    ["stoken"] = content.data.token.token,
                                                                    ["mid"] = content.data.user_info.mid,
                                                                }
                                                                stokenV2 = mergeSplit(stokenV2table)
                                                                printLog("stokenV2", stokenV2)

                                                                --获取ltoken
                                                                map.put("DS", getLoginDS())
                                                                Http.get(PassportApiAuthApi .. "/getLTokenBySToken",
                                                                    stokenV2, nil
                                                                    , map, function(code, content)
                                                                    printLog("getLTokenBySToken", code,
                                                                        content)
                                                                    if code == 200 then
                                                                        local content = JSON.decode(content)
                                                                        if content.retcode == 0 then
                                                                            stokenV2table.ltuid = stokenV2table.stuid
                                                                            stokenV2table.ltoken = content.data.ltoken
                                                                            --获取cookie_token
                                                                            map.put("DS", getLoginDS())
                                                                            Http.get(PassportApiAuthApi ..
                                                                                "/getCookieAccountInfoBySToken",
                                                                                stokenV2, nil
                                                                                , map, function(code, content)
                                                                                printLog("getCookieAccountInfoBySToken",
                                                                                    code,
                                                                                    content)
                                                                                if code == 200 then
                                                                                    local content = JSON.decode(content)
                                                                                    if content.retcode == 0 then
                                                                                        stokenV2table.account_id = stokenV2table
                                                                                            .stuid
                                                                                        stokenV2table.cookie_token = content
                                                                                            .data
                                                                                            .cookie_token
                                                                                        stokenV2 = mergeSplit(stokenV2table)
                                                                                        printLog("stokenV2", stokenV2)
                                                                                        提示("登录成功")
                                                                                        if relogin then
                                                                                            activity.result({ stokenV2,
                                                                                                true })
                                                                                        else
                                                                                            activity.result({ stokenV2 })
                                                                                        end
                                                                                    else
                                                                                        if content.message == nil then
                                                                                            content.message = content.retcode
                                                                                        end
                                                                                        提示("登录失败：" ..
                                                                                            content.message)
                                                                                    end
                                                                                end
                                                                            end)
                                                                        else
                                                                            if content.message == nil then
                                                                                content.message = content.retcode
                                                                            end
                                                                            提示("登录失败：" .. content.message)
                                                                        end
                                                                    end
                                                                end)
                                                            else
                                                                if content.message == nil then
                                                                    content.message = content.retcode
                                                                end
                                                                提示("登录失败：" .. content.message)
                                                            end
                                                        end
                                                    end)
                                                else
                                                    if content.message == nil then
                                                        content.message = content.retcode
                                                    end
                                                    提示("请求失败：" .. content.message)
                                                end
                                            else
                                                提示("请求失败，错误码：" .. code)
                                            end
                                        end)

                                else
                                    提示("登录失败，Cookie内未找到必要参数，请尝试重新登录")
                                    activity.result({})
                                end
                            end,
                            textColor = primaryc,
                            id = "loginsuccess"
                        }
                    },
                },
                {
                    LinearLayout,
                    layout_width = "-1",
                    layout_height = "-1",
                    orientation = "vertical",
                    padding = "24dp";
                    paddingTop = "16dp";
                    background = backgroundc;
                    --gravity="center";
                    id = "loaderr";
                    {
                        CardView;
                        CardElevation = "0dp";
                        CardBackgroundColor = cardbackc;
                        Radius = "8dp";
                        layout_width = "-1";
                        layout_height = "-2";
                        {
                            LinearLayout,
                            layout_width = "-1",
                            layout_height = "-1",
                            orientation = "vertical",
                            padding = "28dp";
                            {
                                TextView;
                                text = ":(";
                                textColor = primaryc;
                                textSize = "48sp";
                                layout_height = "-2";
                                layout_width = "-1",
                                Typeface = AppFont.特粗;
                            };
                            {
                                TextView;
                                text = "Not Found";
                                textColor = primaryc;
                                textSize = "36sp";
                                layout_height = "-2";
                                layout_width = "-1",
                                paddingTop = "8dp";
                                Typeface = AppFont.特粗;
                            };
                            {
                                TextView,
                                textSize = "18sp",
                                textColor = primaryc,
                                text = "你要找的网页跑丢了！",
                                Typeface = AppFont.标准;
                                paddingTop = "8dp";
                            },
                            {
                                TextView,
                                textSize = "14sp",
                                textColor = textc,
                                text = "在访问 https://www.mukapp.top 时出错",
                                Typeface = AppFont.标准;
                                paddingTop = "16dp";
                                id = "errwz";
                            },
                            {
                                TextView,
                                textSize = "14sp",
                                textColor = stextc,
                                text = "建议：\n- 检查您的网络连接或者刷新网页\n- 检查网站运作是否正常",
                                Typeface = AppFont.标准;
                                paddingTop = "16dp";
                            },
                            {
                                TextView,
                                textSize = "14sp",
                                textColor = stextc,
                                text = "如需了解更多信息，可以在线搜索此代码：ERR_MUKNB",
                                Typeface = AppFont.标准;
                                paddingTop = "16dp";
                                id = "errxx";
                            },
                        },
                    },
                    {
                        CardView;
                        CardElevation = "0dp";
                        CardBackgroundColor = 转0x(primaryc) - 0xde000000;
                        Radius = "8dp";
                        layout_width = "-1";
                        layout_height = "-2";
                        layout_marginTop = "24dp";
                        {
                            TextView;
                            layout_width = "-1";
                            layout_height = "-1";
                            textSize = "16sp";
                            paddingRight = "16dp";
                            paddingLeft = "16dp";
                            Typeface = AppFont.特粗;
                            paddingTop = "12dp";
                            paddingBottom = "12dp";
                            gravity = "center";
                            Text = "刷新";
                            onClick = function() web.reload() end;
                            textColor = primaryc;
                            id = "xz";
                        };
                    };
                },
                {
                    LinearLayout;
                    layout_height = "-1";
                    layout_width = "-1";
                    orientation = "vertical";
                    background = viewshaderc;
                    {
                        TextView;
                        layout_width = "-1";
                        layout_height = "2dp";
                        id = "webprogress";
                    };
                };
                {
                    LinearLayout,
                    layout_height = "-1";
                    layout_width = "-1";
                    orientation = "vertical";
                    Gravity = "bottom|center",
                    {
                        CardView,
                        layout_width = "-1";
                        layout_height = "-2";
                        CardElevation = "6dp",
                        CardBackgroundColor = 转0x(textc) - 0x21000000,
                        Radius = "8dp",
                        layout_margin = "16dp";
                        id = "thirdpart",
                        alpha = 0,
                        Y = dp2px(56),
                        {
                            LinearLayout,
                            layout_height = -2,
                            layout_width = "-1";
                            gravity = "left|center",
                            padding = "16dp";
                            paddingTop = "12dp";
                            paddingBottom = "12dp";
                            {
                                TextView,
                                textColor = 转0x(backgroundc),
                                textSize = "14sp";
                                layout_height = -2,
                                layout_width = -1,
                                text = "网站请求跳转到第三方软件\n（如果要登录帐号直接在该页面登录就行，不用拉起米游社）";
                                Typeface = AppFont.标准,
                                layout_weight = "1",
                            },
                            {
                                CardView;
                                layout_width = "-2";
                                layout_height = "-2";
                                radius = "4dp";
                                background = primaryc;
                                layout_marginLeft = "8dp";
                                Elevation = "1dp";
                                onClick = function()
                                    closethirdpart()
                                    xpcall(function()
                                        local uri = Uri.parse(thirdparturl);
                                        local intent = Intent(Intent.ACTION_VIEW, uri);
                                        activity.startActivity(intent);
                                    end, function(e)
                                        提示("拉起第三方应用失败")
                                    end)
                                end;
                                {
                                    TextView;
                                    layout_width = "-1";
                                    layout_height = "-2";
                                    textSize = "14sp";
                                    paddingRight = "16dp";
                                    paddingLeft = "16dp";
                                    Typeface = AppFont.特粗;
                                    paddingTop = "8dp";
                                    paddingBottom = "8dp";
                                    Text = "跳转";
                                    textColor = backgroundc;
                                    BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                                        ColorStateList(int[0].class { int {} }, int { bwz }));
                                };
                            };
                            {
                                CardView;
                                layout_width = "-2";
                                layout_height = "-2";
                                radius = "2dp";
                                background = "#00000000";
                                layout_marginLeft = "8dp";
                                Elevation = "0";
                                onClick = function()
                                    closethirdpart()
                                end;
                                {
                                    TextView;
                                    layout_width = "-1";
                                    layout_height = "-2";
                                    textSize = "14sp";
                                    Typeface = AppFont.特粗;
                                    paddingRight = "16dp";
                                    paddingLeft = "16dp";
                                    paddingTop = "8dp";
                                    paddingBottom = "8dp";
                                    Text = "取消";
                                    textColor = 转0x(backgroundc);
                                    BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                                        ColorStateList(int[0].class { int {} }, int { bwz }));
                                };
                            };
                        }
                    }
                }
            };
        };
    };

    设置视图(layout)

    波纹({ back, _more }, "圆主题")
    波纹({ xz, loginsuccess }, "方主题")

    web.removeView(web.getChildAt(0))

    import "org.jsoup.*"

    url = [[https://user.mihoyo.com/#/login/password]]

    CookieManager.getInstance().removeAllCookies(nil)
    CookieManager.getInstance().flush()

    CookieSyncManager.createInstance(this)
    cookieManager = CookieManager.getInstance()
    cookieManager.setAcceptCookie(true)
    cookieManager.removeSessionCookie() --移除
    cookieManager.setCookie(
        url,
        ""
    )
    cookieManager.setCookie(".mihoyo.com", "") --cookies是在HttpClient中获得的cookie
    CookieSyncManager.getInstance().sync()

    CookieManager.getInstance().setCookie(
        url,
        ""
    )

    web.setCookie(".mihoyo.com", "")
    web.setCookie(
        url,
        ""
    )

    local map = HashMap()
    web.loadUrl(url, map)

    --PopupWindow
    Popup_layout = {
        LinearLayout,
        {
            CardView,
            CardElevation = "8dp",
            CardBackgroundColor = ctbackc,
            Radius = "8dp",
            layout_width = "-1",
            layout_height = "-2",
            layout_margin = "8dp",
            layout_marginBottom = "12dp",
            {
                GridView,
                layout_height = "-1",
                layout_width = "-1",
                NumColumns = 1,
                id = "Popup_list",
                paddingTop = "8dp",
                paddingBottom = "8dp",
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
        LinearLayout;
        layout_width = "-1";
        layout_height = "48dp";
        {
            TextView;
            id = "popadp_text";
            textColor = textc;
            layout_width = "-1";
            layout_height = "-1";
            textSize = "14sp";
            gravity = "left|center";
            paddingLeft = "16dp";
            Typeface = AppFont.标准;
        };
    };

    popadp = LuaAdapter(activity, Popup_list_item)

    Popup_list.setAdapter(popadp)

    popadp.add { popadp_text = "刷新", }
    popadp.add { popadp_text = "前进", }
    popadp.add { popadp_text = "后退", }
    popadp.add { popadp_text = "停止加载", }

    Popup_list.setOnItemClickListener(AdapterView.OnItemClickListener {
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
        end
    })

    import "com.lua.*"

    静态渐变(转0x(primaryc) - 转0x("#9f000000"), 转0x(primaryc), webprogress, "横")

    js = ""

    web.setWebChromeClient(LuaWebChrome(LuaWebChrome.IWebChrine {
        onProgressChanged = function(view, newProgress)
            local lpm = webprogress.getLayoutParams()
            lpm.width = newProgress * (activity.Width / 100)
            webprogress.setLayoutParams(lpm)
            web.loadUrl([[
      javascript:(function()
        { ]] .. js .. [[ })()
      ]]     );
        end,
        onShowFileChooser = function(view, valueCallbackuri, fileChooserParams)
            uploadMessageAboveL = valueCallbackuri
            local intet = Intent(Intent.ACTION_GET_CONTENT);
            intet.addCategory(Intent.CATEGORY_OPENABLE);
            if fileChooserParams.getAcceptTypes() then
                if tostring(fileChooserParams.getAcceptTypes()):find("/") then
                    intet.setType(fileChooserParams.getAcceptTypes());
                    --print(fileChooserParams.getAcceptTypes())
                else
                    if fileChooserParams.getAcceptTypes()[0] ~= ""
                        and fileChooserParams.getAcceptTypes()[0]:find("/") then
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
                            if not pcall(function()
                                local a = fileChooserParams.getAcceptTypes()[num]
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
            if mukactivity.getData("Web_Upload_All_Types_File") == "true" then
                intet.setType("*/*");
            end
            activity.startActivityForResult(Intent.createChooser(intet, "File Chooser"), 1);
            --准备回调
            onActivityResult = function(req, res, intent)
                if (res == Activity.RESULT_CANCELED) then
                    if (uploadMessageAboveL ~= nil) then
                        uploadMessageAboveL.onReceiveValue(nil);
                    end
                end
                local results
                if (res == Activity.RESULT_OK) then
                    if (uploadMessageAboveL == nil or type(uploadMessageAboveL) == "number") then
                        return;
                    end
                    if (intent ~= nil) then
                        local dataString = intent.getDataString();
                        local clipData = intent.getClipData();
                        if (clipData ~= nil) then
                            results = Uri[clipData.getItemCount()];
                            for i = 0, clipData.getItemCount() - 1 do
                                local item = clipData.getItemAt(i);
                                results[i] = item.getUri();
                            end
                        end
                        if (dataString ~= nil) then
                            results = Uri[1];
                            results[0] = Uri.parse(dataString)
                        end
                    end
                end
                if (results ~= nil) then
                    uploadMessageAboveL.onReceiveValue(results);
                    uploadMessageAboveL = nil;
                end
            end
            return true;
        end,
    }));

    loaderror = false
    控件隐藏(loaderr)


    web.setWebViewClient {
        shouldOverrideUrlLoading = function(view, url)
            if url:match("(.-)%:") ~= "http" and url:match("(.-)%:") ~= "https" then
                thirdparturl = url
                openthirdpart()
                return true
            end
            wurl = url
            title.setText("加载中，请稍等 ( ･ิω･ิ)")
            activity.Title = "加载中"
            控件隐藏(loaderr)
            loaderror = false
        end,
        onPageStarted = function(view, url, favicon)
            控件可见(webprogress)
            wurl = url
            title.setText("加载中，请稍等 ( ･ิω･ิ)")
            activity.Title = "加载中"
            控件隐藏(loaderr)
            loaderror = false
        end,
        onPageFinished = function(view, url)
            控件隐藏(webprogress)
            wurl = url
            if loaderror == true then
                return true
            end

            title.setText(web.getTitle())
            activity.Title = web.getTitle()

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
        end,
        shouldInterceptRequest = function(view, url)
            if url:find("getUserGameRolesByCookie") then
                --web.getCookie()
                web.post(Runnable {
                    run = function()
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

    web.setDownloadListener {
        onDownloadStart = function(url, userAgent, contentDisposition, mimetype, contentLength)
            --[[local i = Intent(Intent.ACTION_VIEW);
      i.setData(Uri.parse(url));
      activity.startActivity(i);]]
            --print(url,contentDisposition,mimetype,contentLength)
            size = "未知"
            xpcall(function()
                size = tostring(contentLength / 1024 / 1024):sub(1, 4) .. "MB"
            end, function()
                size = "未知"
            end)
            xpcall(function()
                filename = string.match(url, ".+/([^/]*%.%w+)$")
            end, function()
                filename = os.date("%m-%d_%H-%M-%S")
            end)
            if filename == nil then
                filename = os.date("%m-%d_%H-%M-%S")
            end
            双按钮对话框("下载文件",
                "文件描述: " .. filename .. "\n文件大小: " .. size,
                "下载",
                "取消", function()
                    关闭对话框()
                    下载文件(url, filename)
                end, function()
                关闭对话框()
            end)
        end
    };

    function closethirdpart()
        local id = thirdpart
        mfbha = ViewAnimator.animate({ id })
            .translationY({ id.translationY, dp2px(64) })
            .alpha({ id.alpha, 0 })
            .interpolator(AccelerateInterpolator())
            .duration(256)
            .onStop({
                onStop = function()
                    控件隐藏(id)
                end
            })
            .start()
    end

    thirdparturl = ""

    function openthirdpart()

        local id = thirdpart
        控件可见(id)
        mfbsa = ViewAnimator.animate({ id })
            .translationY({ id.translationY, 0 })
            .alpha({ id.alpha, 1 })
            .interpolator(OvershootInterpolator())
            .duration(256)
            .onStop({
                onStop = function()
                    控件可见(id)
                end
            })
            .start()
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
