require "import"
import "mods.muk"

import "android.content.pm.ActivityInfo"

aid, bv, pagesinfo, page = ...
pagesinfo = luajava.astable(pagesinfo, true)

function onCreate()
    layout = {
        RelativeLayout;
        layout_height = "-1";
        layout_width = "-1";
        background = backgroundc;
        {
            LuaWebView; --主体
            layout_height = "-1";
            layout_width = "-1";
            background = "#ffffff";
            id = "web";
        };
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
            --background=viewshaderc;
            {
                TextView;
                layout_width = "-1";
                layout_height = "2dp";
                id = "webprogress";
            };
        };
        {
            LinearLayout;
            layout_height = "-1";
            layout_width = "-1";
            orientation = "vertical";
            {
                CardView;
                CardElevation = "0dp";
                CardBackgroundColor = barbackgroundc;
                Radius = "18dp";
                layout_width = "32dp";
                layout_height = "32dp";
                layout_margin = dp2px(8) + 状态栏高度;
                alpha = 0.6,
                {
                    ImageView;
                    ColorFilter = textc;
                    src = 图标("arrow_back");
                    layout_height = "-1";
                    layout_width = "-1";
                    padding = "4dp";
                    id = "back";
                    onClick = function() activity.finish() end;
                };
            },
        };
    };

    设置视图(layout)

    波纹({ back }, "圆主题")
    波纹({ xz }, "方主题")

    全屏()

    web.removeView(web.getChildAt(0))

    import "org.jsoup.*"

    --activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);--竖屏

    local url = "https://www.bilibili.com/blackboard/html5mobileplayer.html?aid=" ..
        aid .. "&bvid=" .. bv .. "&hq=true&high_quality=1"
    url = url .. "&cid="
    url = url .. pagesinfo[tointeger(page) or 1][1]

    local width = pagesinfo[tointeger(page) or 1][2]
    local height = pagesinfo[tointeger(page) or 1][3]

    if width >= height then
        if screenX <= screenY then
            activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE); --横屏
        end
    else
        if screenX >= screenY then
            activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE); --横屏
        end
    end

    web.loadUrl(url)

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
        { 
          var x=document.getElementsByClassName("mplayer-btn-widescreen");
            for (var i = 0; i<x.length;i++) {
                   x[i].style.display="none";
                 };
        })()
      ]]     );
        end,
    }));

    loaderror = false
    控件隐藏(loaderr)

    web.setWebViewClient {
        shouldOverrideUrlLoading = function(view, url)
            wurl = url
            activity.Title = "加载中"
            loaderror = false
            控件隐藏(loaderr)
        end,
        onPageStarted = function(view, url, favicon)
            控件可见(webprogress)
            wurl = url
            activity.Title = "加载中"
            loaderror = false
            控件隐藏(loaderr)
        end,
        onPageFinished = function(view, url)
            控件隐藏(webprogress)
            wurl = url
            if loaderror == true then
                return true
            end
            activity.Title = web.getTitle()
            loaderror = false

            web.loadUrl([[
      javascript:(function()
        { 
          var x=document.getElementsByClassName("mplayer-btn-widescreen");
            for (var i = 0; i<x.length;i++) {
                   x[i].style.display="none";
                 };
        })()
      ]]     );
        end,
        onReceivedError = function(view, errorCode, description, failingUrl)
            printLog(nil, errorCode, description, failingUrl)
            loaderror = true
            local furl = failingUrl:match("://(.-)/") or failingUrl:match("://(.+)")
            errwz.text = "在访问 " .. furl .. " 时出错"
            errxx.text = "如需了解更多信息，可以在线搜索此代码：" .. description
            控件可见(loaderr)
            activity.Title = furl
        end,
        shouldInterceptRequest = function(view, url)
            if url:find("getUserGameRolesByCookie") then
                --web.getCookie()
                web.post(Runnable {
                    run = function()
                    end
                })
            end
        end,
        onHideCustomView = function()
            print("hide")
        end,
        onShowCustomView = function(view, callback)
            print(view, callback)
        end,
    }

    web.getSettings().setSupportZoom(true);
    web.getSettings().setBuiltInZoomControls(true);
    web.getSettings().setDefaultFontSize(14);
    web.getSettings().setDisplayZoomControls(false);
    web.getSettings().setUseWideViewPort(true);
    web.getSettings().setLoadWithOverviewMode(true);
    web.getSettings().setJavaScriptEnabled(true);
    web.getSettings().setAllowFileAccess(true);
    web.getSettings().setAppCacheEnabled(true);
    web.getSettings().setDomStorageEnabled(true);
    web.getSettings().setDatabaseEnabled(true);

    --web.getSettings().setUserAgentString("Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RKQ1.210518.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/91.0.4472.120 Mobile Safari/537.36 miHoYoBBS/2.10.1");

end

function onKeyDown(code, event)
    if string.find(tostring(event), "KEYCODE_BACK") ~= nil then

    end
end
