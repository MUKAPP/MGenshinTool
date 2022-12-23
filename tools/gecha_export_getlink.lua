require "import"
import "mods.muk"
import "mods.hoyobbs"

import "androidx.recyclerview.widget.GridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

function onCreate()
    layout = {
        LinearLayout,
        orientation = "vertical",
        layout_width = "fill",
        layout_height = "fill",
        Gravity = "center|top",
        background = backgroundc;
        {
            LinearLayout,
            layout_width = "fill",
            layout_height = "56dp",
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
                    id = "fh";
                    onClick = function() activity.finish() end;
                };
            };
            {
                TextView;
                text = "获取抽卡记录链接";
                textColor = primaryc;
                textSize = "20sp";
                id = "_title";
                SingleLine = true;
                layout_width = "-1",
                gravity = "center|left";
                paddingLeft = "16dp";
                layout_weight = "1",
                Typeface = AppFont.特粗;
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
                Gravity = "center",
                {
                    ProgressBar,
                    layout_width = "56dp",
                    layout_height = "56dp",
                    id = "pb",
                },
            },
            {
                RecyclerView,
                --layout_marginTop="20dp",
                layout_width = "-1",
                layout_height = "-1",
                id = "rv",
                paddingLeft = "8dp",
                paddingRight = "8dp",
                background = backgroundc;
            },
        },
    }

    设置视图(layout)

    波纹({ back }, "圆主题")

    transitioner = LayoutTransition()
    rv.getParent().setLayoutTransition(transitioner)

    pb.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(转0x(primaryc), PorterDuff.Mode.SRC_ATOP))

    function getLink(cookie2)
        --cookie2 = [[mid=0ookdpg0di_mhy;stuid=183512966;account_id=183512966;cookie_token=S0iayFDftnMea46dYOGTcdPg6Oy5ie4kBFnmFnoR;ltuid=183512966;ltoken=qxaOocOCLHdIeQESUZtjcqPKZzgEbKQ274Ov6ja3;stoken=v2_Cj1l58DtxNtytovdOvpOxdJ5PQvi9KRMzwY960B5mVF6Qw4HFJW3LdZD0laRa8a1QOdGy4-9Ul6iOGN_YYhMTUzPV-JhkXFcGJSjlVoZtYSZNFHuVwBq]]
        Http.get("https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn"
            , cookie2, nil, nil,
            function(code, content)
                printLog("Hoyoapi getUserGameRolesByCookie", content)
                if code ~= 200 then
                    提示("获取失败，请检查网络：" .. code)
                    控件可见(rv)
                    return true
                end
                content = JSON.decode(content)
                if content.retcode ~= 0 then
                    提示("获取失败：" .. content.message)
                    控件可见(rv)
                    return true
                end
                printLog("Hoyoapi getUserGameRolesByCookie(format)", content)
                local function next(game_uid, game_biz, region)
                    local map = HashMap()
                    map.put("Content-Type", "application/json;charset=utf-8")
                    map.put("Host", "api-takumi.mihoyo.com")
                    map.put("Accept", "application/json, text/plain, */*")
                    map.put("x-rpc-app_version", "2.28.1")
                    map.put("x-rpc-client_type", "5")
                    map.put("x-rpc-device_id", string.upper(tostring(UUID.randomUUID())))
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

                        local c = string.lower(MD5("salt=ulInCDohgEs557j0VsPDYnQaaz6KJcv5&t="
                            .. i .. "&r=" .. r))
                        return i .. "," .. r .. "," .. c
                    end

                    map.put("DS", getDs())

                    Http.post("https://api-takumi.mihoyo.com/binding/api/genAuthKey",
                        JSON.encode {
                            ["auth_appid"] = "webview_gacha",
                            ["game_biz"] = game_biz,
                            ["game_uid"] = game_uid,
                            ["region"] = region
                        }, cookie2, nil, map,
                        function(code, content)
                            if code ~= 200 then
                                提示("获取失败，请检查网络：" .. code)
                                控件可见(rv)
                                return true
                            end
                            printLog("Hoyoapi genAuthKey", content)
                            content = JSON.decode(content)
                            local link = "https://hk4e-api.mihoyo.com/event/gacha_info/api/getGachaLog?win_mode=fullscreen&authkey_ver=1&sign_type=2&auth_appid=webview_gacha&init_type=301&gacha_id=b4ac24d133739b7b1d55173f30ccf980e0b73fc1&lang=zh-cn&device_type=mobile&game_version=CNRELiOS3.0.0_R10283122_S10446836_D10316937&plat_type=ios&game_biz="
                                ..
                                game_biz ..
                                "&authkey=" ..
                                URLEncoder.encode(content.data.authkey) ..
                                "&region=" ..
                                region ..
                                "&timestamp=" ..
                                os.time() .. "&gacha_type=301&page=1&size=20&end_id=0"

                            printLog("link", link)
                            提示("获取成功")
                            activity.result({ link })
                        end)
                end

                if #content.data.list > 0 then
                    if #content.data.list == 1 then
                        local game_uid = content.data.list[1].game_uid
                        local game_biz = content.data.list[1].game_biz
                        local region = content.data.list[1].region

                        next(game_uid, game_biz, region)
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
                                            BackgroundDrawable = activity.Resources.getDrawable(ripples)
                                                .setColor(
                                                    ColorStateList(int[0].class { int {} },
                                                        int { bwz })
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
                        for i = 1, #content.data.list do
                            local game_uid = content.data.list[i].game_uid
                            local game_biz = content.data.list[i].game_biz
                            local region = content.data.list[i].region
                            suidadp.add {
                                tladp_text = game_uid,
                                tladp_activity = {
                                    BackgroundDrawable = 波纹2("方自适应"),
                                    onClick = function(v)
                                        关闭对话框(ansuid)
                                        next(game_uid, game_biz, region)
                                    end,
                                }
                            }
                        end

                        suidgv.setAdapter(suidadp)
                    end
                else
                    控件可见(rv)
                    提示("该米游社账号未绑定原神账号")
                end
            end)
    end

    tool_list_item = {
        LinearLayout;
        layout_width = "-1";
        layout_height = "-2";
        onClick = function() end;
        {
            CardView;
            CardElevation = "0dp";
            CardBackgroundColor = cardbackc;
            Radius = "8dp";
            layout_width = "-1";
            layout_height = "-2";
            layout_margin = "8dp";
            id = "tlb";
            {
                LinearLayout,
                orientation = "vertical",
                layout_width = "-1",
                layout_height = "-1",
                {
                    TextView;
                    id = "tladp_text";
                    textSize = "16sp";
                    gravity = "left|center";
                    Typeface = AppFont.粗体;
                    layout_width = "-1";
                    layout_height = "-1";
                    padding = "16dp";
                    paddingTop = "14dp";
                    paddingBottom = "14dp";
                    textColor = textc,
                    onClick = function(v)
                        local data = {}
                        xpcall(function()
                            data = JSON.decode(mukactivity.getData("myscookies"))
                        end, function(e)
                            mukactivity.setData("myscookies", JSON.encode({}))
                            data = JSON.decode(mukactivity.getData("myscookies"))
                        end)

                        getLink(data[v.Text])
                        控件隐藏(rv)
                        printLog("COOKIE", data[v.Text])
                    end;
                };
            };
        };
    };

    --tladp=LuaAdapter(activity,tool_list_item)

    --gv.setAdapter(tladp)

    function addt(name)
        data[#data + 1] = { name }
    end

    data = {}

    function 更新()
        data = {}
        local data2 = {}
        xpcall(function()
            data2 = JSON.decode(mukactivity.getData("myscookies"))
        end, function(e)
            mukactivity.setData("myscookies", JSON.encode({}))
            data2 = JSON.decode(mukactivity.getData("myscookies"))
        end)

        for i, v in pairs(data2) do
            addt(i)
        end
        adp.notifyDataSetChanged()
    end

    rholder = function(parent, viewType)
        local views = {}
        holder = LuaRecyclerHolder(loadlayout(tool_list_item, views))
        holder.view.setTag(views)
        return holder
    end

    adp = LuaRecyclerViewAdapter(LuaAdapterCreator({
        getItemCount = function()
            return #data
        end,
        getItemViewType = function(position)
            return 0
        end,
        onCreateViewHolder = rholder,
        onBindViewHolder = function(holder, position)
            view = holder.view.getTag()
            view.tladp_text.Text = data[position + 1]
            view.tladp_text.setBackgroundDrawable(波纹2("方自适应"))
        end,
    }))

    rv.setAdapter(adp)

    local gvmanager = GridLayoutManager(activity, 1)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                return int(1)
            end
        }))

    rv.setLayoutManager(gvmanager)

    更新()

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
