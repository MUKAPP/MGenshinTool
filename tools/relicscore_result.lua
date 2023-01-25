require "import"
import "mods.muk"

activity.Title = "圣遗物评分"

tab3 = ...

layout = {
    LinearLayout,
    orientation = "vertical",
    layout_width = "fill",
    layout_height = "fill",
    Gravity = "center|top",
    background = backgroundc,
    {
        LinearLayout,
        layout_width = "fill",
        layout_height = "56dp",
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
                id = "fh",
                onClick = function()
                    关闭页面()
                end
            }
        },
        {
            TextView,
            text = activity.Title,
            textColor = primaryc,
            textSize = "20sp",
            id = "_title",
            SingleLine = true,
            layout_width = "-1",
            gravity = "center|left",
            paddingLeft = "16dp",
            layout_weight = "1",
            Typeface = AppFont.特粗
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
        ScrollView,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-1",
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
                                        text = "值",
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
                            paddingBottom = "12dp",
                            paddingTop = "8dp",
                            id = "atext",
                            layout_width = "-1",
                            layout_weight = "1"
                        },
                        {
                            CardView,
                            CardElevation = "0dp",
                            CardBackgroundColor = primaryc,
                            Radius = "4dp",
                            layout_width = "-1",
                            layout_height = "-2",
                            layout_marginLeft = "16dp",
                            layout_marginRight = "16dp",
                            {
                                LinearLayout,
                                layout_width = "-1",
                                layout_height = "-2",
                                padding = "16dp",
                                paddingTop = "8dp",
                                paddingBottom = "8dp",
                                orientation = "vertical",
                                {
                                    TextView,
                                    text = "最终得分",
                                    textColor = backgroundc,
                                    textSize = "18sp",
                                    gravity = "center|left",
                                    Typeface = AppFont.特粗,
                                    id = "ascore",
                                    layout_width = "-1",
                                    layout_height = "-2"
                                },
                                {
                                    TextView,
                                    text = "评语",
                                    textColor = backgroundc,
                                    textSize = "14sp",
                                    gravity = "center|left",
                                    Typeface = AppFont.斜体,
                                    id = "comment",
                                    layout_width = "-1",
                                    layout_height = "-2"
                                }
                            }
                        },
                        {
                            TextView,
                            text = "———— 应急食品 ————",
                            textColor = stextc,
                            textSize = "12sp",
                            gravity = "center",
                            Typeface = AppFont.特细,
                            id = "right",
                            layout_width = "-1",
                            layout_height = "-2",
                            layout_marginTop = "8dp"
                        },
                        {
                            TextView,
                            text = tab3.method .. " " .. 应用版本名,
                            textColor = stextc,
                            textSize = "10sp",
                            gravity = "right|center",
                            Typeface = AppFont.特细,
                            layout_width = "-1",
                            layout_height = "16dp",
                            paddingRight = "8dp"
                        }
                    }
                }
            },
            {
                LinearLayout,
                orientation = "vertical",
                layout_width = "-1",
                layout_height = "-2",
                Gravity = "center",
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
                    {
                        ImageView,
                        src = 图标("save"),
                        layout_width = "56dp",
                        layout_height = "56dp",
                        padding = "16dp",
                        id = "TranslationClick",
                        ColorFilter = backgroundc
                    }
                }
            }
        }
    }
}

activity.setContentView(loadlayout(layout))

波纹({ fh }, "圆主题")
波纹({ TranslationClick }, "方黑")

all = {}

rccom = {
    --普通c
    withPer = {
        { 1.33, "攻击力" },
        { 1, "暴击伤害" },
        { 2, "暴击率" }
    },
    val = {
        { 0.33, "元素精通" },
        { 0.05, "攻击力" }
    },
    other = 1
}

rhutao = {
    --胡桃
    withPer = {
        { 0.5, "攻击力" },
        { 1, "生命值" },
        { 1, "暴击伤害" },
        { 2, "暴击率" }
    },
    val = {
        { 0.33, "元素精通" },
        { 0.15, "攻击力" },
        { 0.0075, "生命值" }
    },
    other = 1
}

rcde = {
    --防御c
    withPer = {
        { 1.33, "防御力" },
        { 1, "暴击伤害" },
        { 2, "暴击率" }
    },
    val = {
        { 0.1, "防御力" }
    },
    other = 1
}

rraiden = {
    --雷电将军
    withPer = {
        { 0.5, "元素充能效率" },
        { 1.33, "攻击力" },
        { 1, "暴击伤害" },
        { 2, "暴击率" }
    },
    val = {
        { 0.05, "攻击力" }
    },
    other = 1
}

--生命奶和生命盾
--攻击奶、
--防御盾、
--精通拐、

score = 0

local ok = {}

tab3 = luajava.astable(tab3, true)

for i, v in ipairs(tab3.table) do
    tab3.table[i][2] = tab3.table[i][2]:gsub("％", "%%")
    tab3.table[i][2] = tab3.table[i][2]:gsub("%-", "")
end

if tab3.method == "普通C" then
    all = rccom
elseif tab3.method == "胡桃" then
    all = rhutao
elseif tab3.method == "防御C" then
    all = rcde
elseif tab3.method == "雷电将军" then
    all = rraiden
end

for i, v in ipairs(tab3.table) do
    --print(i,dump(v))
    if tostring(v[2]):find("%%") then
        local n = v[2]:gsub("%%", "")
        for i2, v2 in ipairs(all.withPer) do
            for i3, v3 in ipairs(all.withPer[i2]) do
                if v[1]:find(v3) then
                    score = score + n * all.withPer[i2][1]
                    --print(v[1])
                    ok[#ok + 1] = v[1]
                end
            end
        end
    else
        local n = v[2]
        --print(v[1],n)
        for i2, v2 in ipairs(all.val) do
            for i3, v3 in ipairs(all.val[i2]) do
                if v[1]:find(v3) then
                    score = score + n * all.val[i2][1]
                    --print(v[1])
                    ok[#ok + 1] = v[1]
                end
            end
        end
    end
end

score = score + (#tab3.table - #ok)
--print(#tab3.table,#ok,score)

gradeNum = tab3.grade

if gradeNum:find("%+") then
    gradeNum = gradeNum:match("%+(.+)")
end

gradeNum = tonumber(gradeNum)

if gradeNum == nil then
    gradeNum = 20
end

mainPos = tab3.mainPos

if tab3.method == "普通C" then
    all = rccom
    if tab3.main[1] == "暴击伤害" or tab3.main[1] == "暴击率" then
        all.max = 62.854
    elseif tab3.main[1] == "攻击力" and mainPos ~= "死之羽" then
        all.max = 62.94
    else
        all.max = 69.704
    end
elseif tab3.method == "胡桃" then
    all = rhutao
    if tab3.main[1] == "暴击伤害" or tab3.main[1] == "暴击率" then
        all.max = 62.89
    elseif tab3.main[1] == "生命值" and mainPos ~= "生之花" then
        all.max = 64.89
    elseif tab3.main[1] == "元素精通" then
        all.max = 63.1
    else
        all.max = 67.79
    end
elseif tab3.method == "防御C" then
    all = rcde
    if tab3.main[1] == "暴击伤害" or tab3.main[1] == "暴击率" then
        all.max = 59.609
    elseif tab3.main[1] == "防御力" then
        all.max = 57.7
    else
        all.max = 66.409
    end
elseif tab3.method == "雷电将军" then
    all = rraiden
    if tab3.main[1] == "暴击伤害" or tab3.main[1] == "暴击率" then
        all.max = 58.764
    elseif tab3.main[1] == "元素充能效率" then
        all.max = 63.314
    else
        all.max = 65.564
    end
end

score = score / all.max * 100

--print(score,gradeNum)

if gradeNum == 20 then
    score = score
elseif gradeNum >= 16 then
    score = score * 1.13
elseif gradeNum >= 12 then
    score = score * 1.30
elseif gradeNum >= 8 then
    score = score * 1.54
elseif gradeNum >= 4 then
    score = score * 1.87
elseif gradeNum >= 0 then
    score = score * 2.4
end

output = ""

for i, v in ipairs(tab3.table) do
    if output == "" then
        output = tab3.table[i][1] .. " " .. tab3.table[i][2]
    else
        output = output .. "\n" .. tab3.table[i][1] .. " " .. tab3.table[i][2]
    end
end

aname.Text = tab3.name
aPos.Text = mainPos
amain.Text = tab3.main[1]
amainVal.Text = tab3.main[2]
atext.Text = output
amainGrade.Text = tab3.grade
ascore.Text = "评分：" .. string.format("%.2f", tostring(score)) .. "分"

if score > 100 then
    comment.Text = "在原神里追求超极品圣遗物是否搞错了什么"
elseif score >= 90 then
    comment.Text = "快报你的地址，我帮你打救护车，记得把这个圣遗物邮给我"
elseif score >= 80 then
    comment.Text = "吃好喝好，一路走好"
elseif score > 70 then
    comment.Text = "不错了，满足吧，你已经开始献祭寿命了"
elseif score > 60 then
    comment.Text = "最中肯的圣遗物，可能用到关服"
elseif score > 40 then
    comment.Text = "加油，再努力一下，说不定下一个还是这分数"
elseif score > 20 then
    comment.Text = "可怜，摸摸头，看看体力满20了没有"
else
    comment.Text = "……耽误太多时间，体力可就溢出了"
end

控件隐藏(right)

TranslationClick.onClick = function()
    控件可见(right)
    ti = Ticker()
    ti.Period = 200
    ti.onTick = function()
        ti.stop()
        local filename = os.date("%m-%d_%H-%M-%S") .. ".png"
        保存图片(内置存储("Pictures/MUKGenshinTool/" .. filename), loadBitmapFromViewBySystem(card))
        提示("已保存到：" .. 内置存储("Pictures/MUKGenshinTool/" .. filename))
        控件隐藏(right)
    end
    ti.start()
end

TranslationClick.setOnTouchListener(
    {
        onTouch = function(v, n)
            if tostring(n):find("ACTION_DOWN") then
                local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", { xf1.translationZ, dp2px(4) })
                _animatorZ.setDuration(128)
                --设置动画时间
                _animatorZ.setInterpolator(DecelerateInterpolator())
                --设置动画插入器，减速
                _animatorZ.start()
            elseif tostring(n):find("ACTION_UP") then
                local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", { xf1.translationZ, dp2px(2) })
                _animatorZ.setDuration(128)
                --设置动画时间
                _animatorZ.setInterpolator(AccelerateInterpolator())
                --设置动画插入器，减速
                _animatorZ.start()
            end
        end
    }
)

if mainPos == ("生之花") then
    mainPos = "flower"
elseif mainPos == ("死之羽") then
    mainPos = "feather"
elseif mainPos == ("时之沙") then
    mainPos = "sand"
elseif mainPos == ("空之杯") then
    mainPos = "cup"
elseif mainPos == "理之冠" then
    mainPos = "head"
end

relic_all = import "artifacts"
relic_id = JSON.decode(读取文件(activity.getLuaDir("res/metadata/Simple/ReliquarySet.json")))

imgUrl = "https://upload-bbs.mihoyo.com/game_record/genshin/equip"
newImgUrl = "https://dummyimage.com/256x256/ffffff/000000&text="

for i, v in pairs(relic_all) do
    for i2, v2 in pairs(v) do
        if type(v2) == "table" then
            if v2[2] then
                if v2[1] == tab3.name then
                    --print(v["eng"])
                    local pos_
                    if v2[2] == "flower" then
                        pos_ = "4"
                    elseif v2[2] == "feather" then
                        pos_ = "2"
                    elseif v2[2] == "sand" then
                        pos_ = "5"
                    elseif v2[2] == "cup" then
                        pos_ = "1"
                    elseif v2[2] == "head" then
                        pos_ = "3"
                    end
                    --aname.Text = v[1]
                    local id
                    for i, v3 in ipairs(relic_id) do
                        if v3.Name == v["chs"] then
                            id = tointeger(v3.Id - 200000)
                        end
                    end
                    Glide.with(activity).load(imgUrl .. "/UI_RelicIcon_" .. id .. "_" .. pos_ .. ".png").transition(
                        DrawableTransitionOptions.with(DrawableCrossFadeFactory.Builder(328).setCrossFadeEnabled(true).build())
                    ).--.asBitmap()
                        --.skipMemoryCache(true)
                        into(img)
                end
            end
        end
    end
end

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

popadp.add { popadp_text = "评分算法" }

Popup_list.setOnItemClickListener(
    AdapterView.OnItemClickListener {
        onItemClick = function(parent, v, pos, id)
            pop.dismiss()
            local s = v.Tag.popadp_text.Text
            if s == "评分算法" then
                单按钮对话框(
                    "评分算法",
                    [[应急食品的圣遗物评分满分为100分
不同版本应急食品的评分不能对比（评分卡片右下角有版本）
————————————
1. 普通c
  带百分比
    | 攻击力*1.33
    | 暴击伤害*1
    | 暴击率*2

  不带百分比
    | 元素精通*0.33
    | 攻击力*0.05

  其他词条不论数值多少只给词条分1分

  若主词条为 暴击率/暴击伤害 则 最终评分=以上评分总和/62.854*100
  若主词条为 攻击力 且 位置为死之羽 则 最终评分=以上评分总和/62.94*100
  其他主词条 最终评分=以上评分总和/69.704*100
————————————
2. 胡桃
  带百分比
    | 攻击力*0.5
    | 生命值*1
    | 暴击伤害*1
    | 暴击率*2

  不带百分比
    | 元素精通*0.33
    | 攻击力*0.15
    | 生命值*0.0075

  其他词条不论数值多少只给词条分1分

  若主词条为 暴击率/暴击伤害 则 最终评分=以上评分总和/62.89*100
  若主词条为 生命值 且 位置为生之花 则 最终评分=以上评分总和/64.89*100
  若主词条为 元素精通 则 最终评分=以上评分总和/63.1*100
  其他主词条 最终评分=以上评分总和/67.79*100
————————————
3. 防御c
  带百分比
    | 防御力*1.33
    | 暴击伤害*1
    | 暴击率*2

  不带百分比
    | 防御力*0.1

  其他词条不论数值多少只给词条分1分

  若主词条为 暴击率/暴击伤害 则 最终评分=以上评分总和/59.609*100
  若主词条为 防御力 则 最终评分=以上评分总和/57.7*100
  其他主词条 最终评分=以上评分总和/66.409*100
————————————
4. 雷电将军
  带百分比
    | 攻击力*1.33
    | 暴击伤害*1
    | 暴击率*2
    | 元素充能效率*0.5

  不带百分比
    | 攻击力*0.05

  其他词条不论数值多少只给词条分1分

  若主词条为 暴击率/暴击伤害 则 最终评分=以上评分总和/58.764*100
  若主词条为 元素充能效率 则 最终评分=以上评分总和/63.314*100
  其他主词条 最终评分=以上评分总和/65.564*100
]]                   ,
                    "关闭",
                    function()
                        关闭对话框()
                    end
                )
            end
        end
    }
)

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

分屏()
