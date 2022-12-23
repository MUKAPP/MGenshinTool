require "import"

import "mods.muk"

activity.Title = "圣遗物强化模拟器"
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
                    id = "_wp",
                    {
                        CardView,
                        CardElevation = "0dp",
                        CardBackgroundColor = backgroundc,
                        Radius = "8dp",
                        layout_width = "-1",
                        layout_height = "-2",
                        layout_margin = "8dp",
                        layout_marginLeft = "16dp",
                        layout_marginRight = "16dp",
                        layout_marginBottom = "8dp",
                        id = "card",
                        {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = cardbackc,
                            Radius = "8dp",
                            layout_width = "-1",
                            layout_height = "-2",
                            {
                                LinearLayout,
                                orientation = "vertical",
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                {
                                    TextView,
                                    text = "圣遗物",
                                    textColor = primaryc,
                                    textSize = "16sp",
                                    gravity = "center|left",
                                    Typeface = AppFont.特粗,
                                    padding = "16dp",
                                    paddingBottom = "4dp",
                                    id = "aname"
                                },
                                {
                                    TextView,
                                    text = "位置",
                                    textColor = textc,
                                    textSize = "12sp",
                                    gravity = "center|left",
                                    Typeface = AppFont.细体,
                                    id = "aPos",
                                    layout_height = "-2",
                                    layout_width = "-2",
                                    padding = "16dp",
                                    paddingTop = "0",
                                    paddingBottom = "8dp"
                                },
                                {
                                    CardView,
                                    CardElevation = "0dp",
                                    CardBackgroundColor = cardbackc,
                                    Radius = "4dp",
                                    layout_width = "-1",
                                    layout_height = "-2",
                                    layout_marginLeft = "16dp",
                                    layout_marginRight = "16dp",
                                    {
                                        LinearLayout,
                                        layout_width = "-1",
                                        layout_height = "-2",
                                        {
                                            LinearLayout,
                                            layout_width = "-1",
                                            layout_height = "-2",
                                            padding = "16dp",
                                            paddingTop = "8dp",
                                            paddingBottom = "8dp",
                                            orientation = "vertical",
                                            layout_gravity = "center",
                                            layout_weight = "1",
                                            {
                                                TextView,
                                                text = "主词条",
                                                textColor = primaryc,
                                                textSize = "14sp",
                                                gravity = "center|left",
                                                Typeface = AppFont.标准,
                                                id = "amain",
                                                layout_width = "-2",
                                                layout_height = "-2"
                                                --layout_marginLeft="16dp";
                                                --layout_marginRight="16dp";
                                            },
                                            {
                                                TextView,
                                                text = "233",
                                                textColor = primaryc,
                                                textSize = "16sp",
                                                gravity = "center|left",
                                                Typeface = AppFont.粗体,
                                                id = "amainVal",
                                                layout_height = "-2",
                                                layout_width = "-2"
                                                --layout_marginLeft="16dp";
                                                --layout_marginRight="16dp";
                                                --paddingBottom="4dp",
                                            },
                                            {
                                                CardView,
                                                CardElevation = "0dp",
                                                CardBackgroundColor = cardbackc,
                                                Radius = "2dp",
                                                layout_width = "-2",
                                                layout_height = "-2",
                                                paddingTop = "4dp",
                                                {
                                                    LinearLayout,
                                                    layout_width = "-1",
                                                    layout_height = "-2",
                                                    padding = "4dp",
                                                    paddingTop = "1dp",
                                                    paddingBottom = "1dp",
                                                    {
                                                        TextView,
                                                        text = "等级",
                                                        textColor = textc,
                                                        textSize = "12sp",
                                                        gravity = "center|left",
                                                        Typeface = AppFont.细体,
                                                        id = "amainGrade",
                                                        layout_height = "-2",
                                                        layout_width = "-2"
                                                    }
                                                }
                                            }
                                        },
                                        {
                                            CardView,
                                            CardElevation = "0dp",
                                            CardBackgroundColor = cardbackc,
                                            Radius = "4dp",
                                            layout_width = "64dp",
                                            layout_height = "64dp",
                                            layout_margin = "16dp",
                                            layout_marginBottom = "8dp",
                                            layout_marginTop = "8dp",
                                            layout_gravity = "center",
                                            id = "imgw",
                                            {
                                                ImageView,
                                                id = "img",
                                                scaleType = "fitCenter",
                                                layout_width = "-1",
                                                layout_height = "-1",
                                                colorFilter = viewshaderc
                                            }
                                        }
                                    }
                                },
                                {
                                    TextView,
                                    text = "副词条",
                                    textColor = textc,
                                    textSize = "14sp",
                                    gravity = "center|left",
                                    Typeface = AppFont.标准,
                                    paddingLeft = "16dp",
                                    paddingRight = "16dp",
                                    paddingBottom = "16dp",
                                    paddingTop = "8dp",
                                    id = "atext",
                                    layout_width = "-1",
                                    layout_weight = "1"
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
                            Text = "使用20级大狗粮(你日常强化全歪的圣遗物)",
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
                            Text = "使用4级小狗粮",
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
                            Text = "圣遗物评分",
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
                            Text = "抽取圣遗物",
                            textColor = textc,
                            id = "btn4"
                        }
                    }
                }
            }
        }
    }
}

设置视图(layout)

波纹({ back, _more }, "圆主题")
波纹({ btn1 }, "方主题")
波纹({ btn2, btn3, btn4 }, "方自适应")

transitioner = LayoutTransition()
_wp.setLayoutTransition(transitioner)

btn1.onClick = function()
    if 强化ing == true then
        return true
    end
    强化ing = true
    local mediaPlayer = MediaPlayer()
    mediaPlayer.reset()
    mediaPlayer.setDataSource(activity.getLuaDir("res/relic.mp3"))
    activity.setVolumeControlStream(AudioManager.STREAM_MUSIC)
    mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC)
    mediaPlayer.prepareAsync()
    mediaPlayer.setOnPreparedListener(
        MediaPlayer.OnPreparedListener {
            onPrepared = function(mediaPlayer)
                mediaPlayer.start()
            end
        }
    )
    ViewAnimator.animate({ btn1.getParent() }).scale({ 1, 0.9, 1 }).interpolator(OvershootInterpolator()).duration(1600)
        .onStop(
            {
                onStop = function()
                    强化(20)
                end
            }
        ).start()
end
btn2.onClick = function()
    if 强化ing == true then
        return true
    end
    强化ing = true
    local mediaPlayer = MediaPlayer()
    mediaPlayer.reset()
    mediaPlayer.setDataSource(activity.getLuaDir("res/relic.mp3"))
    activity.setVolumeControlStream(AudioManager.STREAM_MUSIC)
    mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC)
    mediaPlayer.prepareAsync()
    mediaPlayer.setOnPreparedListener(
        MediaPlayer.OnPreparedListener {
            onPrepared = function(mediaPlayer)
                mediaPlayer.start()
            end
        }
    )
    ViewAnimator.animate({ btn2.getParent() }).scale({ 1, 0.9, 1 }).interpolator(OvershootInterpolator()).duration(1600)
        .onStop(
            {
                onStop = function()
                    强化(4)
                end
            }
        ).start()
end

all = {
    withPer = {
        { 1.5, "攻击力" },
        { 1.5, "暴击伤害" },
        { 3, "暴击率" },
        { 1, "元素充能效率" }
    },
    val = {
        { 0.25, "元素精通" },
        { 0.2, "攻击力" }
    },
    other = 1
}

local relic_all = import "artifacts"

local deleteNo4Star = 0
for i = 1, #relic_all do
    if relic_all[i - deleteNo4Star].maxStar ~= 5 then
        printLog("deleteNot5Star", relic_all[i - deleteNo4Star])
        table.remove(relic_all, i - deleteNo4Star)
        deleteNo4Star = deleteNo4Star + 1
    end
end

--print(dump(relic_all))

entry_val = {
    ["防御力"] = { 16, 19, 21, 23 },
    ["防御力%"] = { 5.1, 5.8, 6.6, 7.3 },
    ["生命值"] = { 209, 239, 269, 299 },
    ["生命值%"] = { 4.1, 4.7, 5.3, 5.8 },
    ["攻击力"] = { 14, 16, 18, 19 },
    ["攻击力%"] = { 4.1, 4.7, 5.3, 5.8 },
    ["元素充能效率%"] = { 4.5, 5.2, 5.8, 6.5 },
    ["元素精通"] = { 16, 19, 21, 23 },
    ["暴击率%"] = { 2.7, 3.1, 3.5, 3.9 },
    ["暴击伤害%"] = { 5.4, 6.2, 7.0, 7.8 }
}

function 更新()
    entry_str = ""
    if pentry then
        local qhitem = ""
        local function addqh(n)
            if qhitem == "" then
                qhitem = n
            else
                qhitem = qhitem .. "\n" .. n
            end
        end

        for i = 1, #pentry do
            if #pentry[i] == 2 then
                if pentry[i][1]:find "%%" then
                    addqh(pentry[i][1]:gsub("%%", "") .. "  0 --> " .. pentry[i][2] .. "%")
                else
                    addqh(pentry[i][1] .. "  0 --> " .. pentry[i][2])
                end
            else
                if pentry[i][1]:find "%%" then
                    addqh(pentry[i][1]:gsub("%%", "") .. "  " .. pentry[i][2] .. "%" .. " --> " .. pentry[i][3] .. "%")
                else
                    addqh(pentry[i][1] .. "  " .. pentry[i][2] .. " --> " .. pentry[i][3])
                end
            end
        end
        单按钮对话框(
            "圣遗物强化",
            qhitem,
            "确定",
            function()
                关闭对话框()
            end
        )
    end

    for i = 1, #entry do
        local entryzhi = tostring(entry[i][2])
        if entry[i][1]:find "%%" then
            entryzhi = entryzhi .. "%"
        end
        if entry_str == "" then
            entry_str = entry[i][1]:gsub("%%", "") .. " +" .. entryzhi
        else
            entry_str = entry_str .. "\n" .. entry[i][1]:gsub("%%", "") .. " +" .. entryzhi
        end
    end
    atext.Text = entry_str
end

function 新圣遗物()
    控件可见(btn1.getParent())
    控件可见(btn2.getParent())

    pentry = nil

    local mp = {
        "生之花",
        "死之羽",
        "时之沙",
        "空之杯",
        "理之冠"
    }

    mainPosName = mp[math.random(1, 5)]
    grade = 0

    if mainPosName == ("生之花") then
        mainPos = "flower"
    elseif mainPosName == ("死之羽") then
        mainPos = "feather"
    elseif mainPosName == ("时之沙") then
        mainPos = "sand"
    elseif mainPosName == ("空之杯") then
        mainPos = "cup"
    elseif mainPosName == "理之冠" then
        mainPos = "head"
    end

    aPos.text = mainPosName

    imgUrl = "https://pan.mukapp.top/genshin_artifact-main/src/images/artifacts"

    local relicm = relic_all[math.random(1, #relic_all)]

    for i, v in pairs(relicm) do
        if type(v) == "table" then
            if v[2] == mainPos then
                local pos_
                if v[2] == "cup" then
                    pos_ = "goblet"
                else
                    pos_ = v[2]
                end
                aname.Text = v[1]
                Glide.with(activity).load(imgUrl .. "/" .. relicm["name2"] .. "_" .. pos_ .. ".png").transition(
                    DrawableTransitionOptions.with(DrawableCrossFadeFactory.Builder(328).setCrossFadeEnabled(true).build())
                ).--.asBitmap()
                    --.skipMemoryCache(true)
                    into(img)
            end
        end
    end

    amainGrade.text = tostring("+" .. grade)

    entry_name = {
        "防御力",
        "防御力%",
        "生命值",
        "生命值%",
        "攻击力",
        "攻击力%",
        "元素充能效率%",
        "元素精通",
        "暴击率%",
        "暴击伤害%"
    }

    entry_num = math.random(3, 4)
    entry = {}

    for i = 1, entry_num do
        local nen = math.random(1, #entry_name)
        entry[#entry + 1] = {
            entry_name[nen],
            entry_val[entry_name[nen]][math.random(1, 4)]
        }
        table.remove(entry_name, nen)
    end

    更新()

    --print(dump(entry))
end

function 强化(n)
    if activity.isFinishing() == true then
        提示("给你炒饭")
        return true
    end
    pentry = {}
    pgrade = grade
    grade = grade + n
    if grade > 20 then
        grade = 20
    end

    amainGrade.text = tostring("+" .. grade)

    for i = 1, (grade - pgrade) / 4 do
        if entry_num == 3 then
            entry_num = entry_num + 1
            local nen = math.random(1, #entry_name)
            local ran = entry_val[entry_name[nen]][math.random(1, 4)]
            entry[#entry + 1] = {
                entry_name[nen],
                ran
            }
            pentry[#pentry + 1] = {
                entry_name[nen],
                ran
            }
            table.remove(entry_name, nen)
        else
            local nen = math.random(1, 4)
            local plus = entry_val[entry[nen][1]][math.random(1, 4)]
            entry[nen][2] = entry[nen][2] + plus
            pentry[#pentry + 1] = {
                entry[nen][1],
                entry[nen][2] - plus,
                entry[nen][2]
            }
        end
    end
    更新()
    if grade == 20 then
        控件隐藏(btn1.getParent())
        控件隐藏(btn2.getParent())

        for i = 1, 4 do
            if entry[i][1] == "防御力" then
                if entry[i][2] > 70 then
                    提示("你怎么不强化啊")
                end
            end
            if entry[i][1] == "生命值" then
                if entry[i][2] > 800 then
                    提示("你怎么不强化啊")
                end
            end
            if entry[i][1] == "攻击力" then
                if entry[i][2] > 70 then
                    提示("你怎么不强化啊")
                end
            end
        end
    end
    强化ing = false
end

btn3.onClick = function()
    if 强化ing == true then
        return true
    end
    local etab = {}
    for i, v in ipairs(entry) do
        if entry[i][1]:find "%%" then
            etab[#etab + 1] = { entry[i][1]:match("(.+)%%"), tostring(entry[i][2]) .. "%" }
        else
            etab[#etab + 1] = { entry[i][1], tostring(entry[i][2]) }
        end
    end
    activity.newActivity(
        "tools/relicscore_result",
        {
            {
                ["name"] = aname.Text,
                ["main"] = { "主词条", "233" },
                ["grade"] = amainGrade.Text,
                ["mainPos"] = mainPosName,
                table = etab,
                ["method"] = "普通C"
            }
        }
    )
end

btn4.onClick = function()
    if 强化ing == true then
        return true
    end
    新圣遗物()
end

新圣遗物()

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
