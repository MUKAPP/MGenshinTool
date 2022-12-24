require "import"
import "mods.muk"

import "androidx.recyclerview.widget.GridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

activity.Title = "每日素材"

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
                onClick = function() 关闭页面() end;
            };
        };
        {
            TextView;
            text = activity.Title;
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
        {
            LinearLayout;
            layout_width = "32dp";
            layout_height = "56dp";
            --background=backgroundc;
            gravity = "center";
            layout_marginRight = "12dp",
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
        LinearLayout; --教程
        orientation = "vertical";
        layout_height = "-1";
        layout_width = "-1";
        {
            RelativeLayout;
            layout_height = "48dp";
            layout_width = "-1";
            background = "#00000000";
            id = "dym1",
            {
                LinearLayout;
                layout_height = "-1";
                layout_width = "-1";
                {
                    LinearLayout;
                    layout_width = "-1";
                    layout_weight = "1",
                    layout_height = "-1";
                    gravity = "center";
                    id = "jc1";
                    onClick = function() jcpage(0) end;
                    {
                        TextView;
                        layout_width = "-2";
                        layout_height = "-2";
                        Text = "一/四";
                        Typeface = AppFont.粗体;
                        textSize = "14sp";
                        textColor = primaryc;
                    };
                };
                {
                    LinearLayout;
                    layout_width = "-1";
                    layout_weight = "1",
                    layout_height = "-1";
                    gravity = "center";
                    id = "jc2";
                    onClick = function() jcpage(1) end;
                    {
                        TextView;
                        layout_width = "-2";
                        layout_height = "-2";
                        Text = "二/五";
                        Typeface = AppFont.粗体;
                        textSize = "14sp";
                        textColor = stextc;
                    };
                };
                {
                    LinearLayout;
                    layout_width = "-1";
                    layout_weight = "1",
                    layout_height = "-1";
                    gravity = "center";
                    id = "jc3";
                    onClick = function() jcpage(2) end;
                    {
                        TextView;
                        layout_width = "-2";
                        layout_height = "-2";
                        Text = "三/六";
                        Typeface = AppFont.粗体;
                        textSize = "14sp";
                        textColor = stextc;
                    };
                };
                {
                    LinearLayout;
                    layout_width = "-1";
                    layout_weight = "1",
                    layout_height = "-1";
                    gravity = "center";
                    id = "jc7";
                    onClick = function() jcpage(3) end;
                    {
                        TextView;
                        layout_width = "-2";
                        layout_height = "-2";
                        Text = "日";
                        Typeface = AppFont.粗体;
                        textSize = "14sp";
                        textColor = stextc;
                    };
                };
            };
            {
                LinearLayout;
                layout_height = "8dp";
                layout_width = activity.getWidth() / 4;
                id = "page_scroll";
                layout_alignParentBottom = "true";
                Gravity = "center";
                {
                    CardView;
                    background = primaryc;
                    elevation = "0";
                    radius = "4dp";
                    layout_height = "8dp";
                    layout_marginTop = "4dp";
                    layout_width = "32dp";
                };
            };
        };
        {
            PageView;
            layout_height = "-1";
            layout_width = "-1";
            id = "jc";

            pages = {

                {
                    LinearLayout;
                    orientation = "vertical";
                    layout_height = "-1";
                    layout_width = "-1";
                    {
                        RelativeLayout;
                        layout_height = "48dp";
                        layout_width = "-1";
                        background = "#00000000";
                        id = "dym2",
                        {
                            LinearLayout;
                            layout_height = "-1";
                            layout_width = "-1";
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page1_1";
                                onClick = function()
                                    jcmon.showPage(0)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "角色天赋素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = primaryc;
                                };
                            };
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page1_2";
                                onClick = function()
                                    jcmon.showPage(1)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "武器突破素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = stextc;
                                };
                            };
                        };
                        {
                            LinearLayout;
                            layout_height = "8dp";
                            layout_width = activity.getWidth() / 2;
                            id = "page_scroll1";
                            layout_alignParentBottom = "true";
                            Gravity = "center";
                            {
                                CardView;
                                background = primaryc;
                                elevation = "0";
                                radius = "4dp";
                                layout_height = "8dp";
                                layout_marginTop = "4dp";
                                layout_width = "72dp";
                            };
                        };
                    };
                    {
                        PageView;
                        layout_height = "-1";
                        layout_width = "-1";
                        id = "jcmon";
                        onPageChangeListener = {
                            onPageScrolled = function(v, a, b, c)
                                local w = activity.getWidth() / 2
                                local wd = c / 2
                                page_scroll1.setX(wd + w * a)
                            end,
                            onPageSelected = function(vi, v)
                                page1_num = v + 1
                                local x = primaryc
                                local c = stextc
                                local c1 = c
                                local c2 = c
                                if v == 0 then
                                    c1 = x
                                end
                                if v == 1 then
                                    c2 = x
                                end
                                page1_1.getChildAt(0).setTextColor(转0x(c1))
                                page1_2.getChildAt(0).setTextColor(转0x(c2))
                            end
                        },
                        pages = {
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page1",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page1b",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                        },
                    },
                },

                {
                    LinearLayout;
                    orientation = "vertical";
                    layout_height = "-1";
                    layout_width = "-1";
                    {
                        RelativeLayout;
                        layout_height = "48dp";
                        layout_width = "-1";
                        background = "#00000000";
                        id = "dym3",
                        {
                            LinearLayout;
                            layout_height = "-1";
                            layout_width = "-1";
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page2_1";
                                onClick = function()
                                    jctue.showPage(0)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "角色天赋素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = primaryc;
                                };
                            };
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page2_2";
                                onClick = function()
                                    jctue.showPage(1)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "武器突破素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = stextc;
                                };
                            };
                        };
                        {
                            LinearLayout;
                            layout_height = "8dp";
                            layout_width = activity.getWidth() / 2;
                            id = "page_scroll2";
                            layout_alignParentBottom = "true";
                            Gravity = "center";
                            {
                                CardView;
                                background = primaryc;
                                elevation = "0";
                                radius = "4dp";
                                layout_height = "8dp";
                                layout_marginTop = "4dp";
                                layout_width = "72dp";
                            };
                        };
                    };
                    {
                        PageView;
                        layout_height = "-1";
                        layout_width = "-1";
                        id = "jctue";
                        onPageChangeListener = {
                            onPageScrolled = function(v, a, b, c)
                                local w = activity.getWidth() / 2
                                local wd = c / 2
                                page_scroll2.setX(wd + w * a)
                            end,
                            onPageSelected = function(vi, v)
                                page2_num = v + 1
                                local x = primaryc
                                local c = stextc
                                local c1 = c
                                local c2 = c
                                if v == 0 then
                                    c1 = x
                                end
                                if v == 1 then
                                    c2 = x
                                end
                                page2_1.getChildAt(0).setTextColor(转0x(c1))
                                page2_2.getChildAt(0).setTextColor(转0x(c2))
                            end
                        },
                        pages = {
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page2",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page2b",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                        },
                    },
                },

                {
                    LinearLayout;
                    orientation = "vertical";
                    layout_height = "-1";
                    layout_width = "-1";
                    {
                        RelativeLayout;
                        layout_height = "48dp";
                        layout_width = "-1";
                        background = "#00000000";
                        id = "dym4",
                        {
                            LinearLayout;
                            layout_height = "-1";
                            layout_width = "-1";
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page3_1";
                                onClick = function()
                                    jcwed.showPage(0)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "角色天赋素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = primaryc;
                                };
                            };
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page3_2";
                                onClick = function()
                                    jcwed.showPage(1)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "武器突破素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = stextc;
                                };
                            };
                        };
                        {
                            LinearLayout;
                            layout_height = "8dp";
                            layout_width = activity.getWidth() / 2;
                            id = "page_scroll3";
                            layout_alignParentBottom = "true";
                            Gravity = "center";
                            {
                                CardView;
                                background = primaryc;
                                elevation = "0";
                                radius = "4dp";
                                layout_height = "8dp";
                                layout_marginTop = "4dp";
                                layout_width = "72dp";
                            };
                        };
                    };
                    {
                        PageView;
                        layout_height = "-1";
                        layout_width = "-1";
                        id = "jcwed";
                        onPageChangeListener = {
                            onPageScrolled = function(v, a, b, c)
                                local w = activity.getWidth() / 2
                                local wd = c / 2
                                page_scroll3.setX(wd + w * a)
                            end,
                            onPageSelected = function(vi, v)
                                page3_num = v + 1
                                local x = primaryc
                                local c = stextc
                                local c1 = c
                                local c2 = c
                                if v == 0 then
                                    c1 = x
                                end
                                if v == 1 then
                                    c2 = x
                                end
                                page3_1.getChildAt(0).setTextColor(转0x(c1))
                                page3_2.getChildAt(0).setTextColor(转0x(c2))
                            end
                        },
                        pages = {
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page3",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page3b",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                        },
                    },
                },

                {
                    LinearLayout;
                    orientation = "vertical";
                    layout_height = "-1";
                    layout_width = "-1";
                    {
                        RelativeLayout;
                        layout_height = "48dp";
                        layout_width = "-1";
                        background = "#00000000";
                        id = "dym8",
                        {
                            LinearLayout;
                            layout_height = "-1";
                            layout_width = "-1";
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page7_1";
                                onClick = function()
                                    jcsun.showPage(0)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "角色天赋素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = primaryc;
                                };
                            };
                            {
                                LinearLayout;
                                layout_width = "-1";
                                layout_weight = "1",
                                layout_height = "-1";
                                gravity = "center";
                                id = "page7_2";
                                onClick = function()
                                    jcsun.showPage(1)
                                end;
                                {
                                    TextView;
                                    layout_width = "-2";
                                    layout_height = "-2";
                                    Text = "武器突破素材";
                                    Typeface = AppFont.粗体;
                                    textSize = "14sp";
                                    textColor = stextc;
                                };
                            };
                        };
                        {
                            LinearLayout;
                            layout_height = "8dp";
                            layout_width = activity.getWidth() / 2;
                            id = "page_scroll7";
                            layout_alignParentBottom = "true";
                            Gravity = "center";
                            {
                                CardView;
                                background = primaryc;
                                elevation = "0";
                                radius = "4dp";
                                layout_height = "8dp";
                                layout_marginTop = "4dp";
                                layout_width = "72dp";
                            };
                        };
                    };
                    {
                        PageView;
                        layout_height = "-1";
                        layout_width = "-1";
                        id = "jcsun";
                        onPageChangeListener = {
                            onPageScrolled = function(v, a, b, c)
                                local w = activity.getWidth() / 2
                                local wd = c / 2
                                page_scroll7.setX(wd + w * a)
                            end,
                            onPageSelected = function(vi, v)
                                page4_num = v + 1
                                local x = primaryc
                                local c = stextc
                                local c1 = c
                                local c2 = c
                                if v == 0 then
                                    c1 = x
                                end
                                if v == 1 then
                                    c2 = x
                                end
                                page7_1.getChildAt(0).setTextColor(转0x(c1))
                                page7_2.getChildAt(0).setTextColor(转0x(c2))
                            end
                        },
                        pages = {
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page7",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                            {
                                RecyclerView,
                                --layout_marginTop="20dp",
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "page7b",
                                paddingLeft = "8dp",
                                paddingRight = "8dp",
                            },
                        },
                    },
                },

            },
        };
    };

}

activity.setContentView(loadlayout(layout))

波纹({ fh, _more, jc1, jc2, jc3, jc7,
    page1_1, page1_2, page2_1, page2_2, page3_1, page3_2,
    page7_1, page7_2, }, "圆主题")

page_num = 1
page1_num = 1
page2_num = 1
page3_num = 1
page4_num = 1

all_person = {
    ["Albedo"] = { "阿贝多", 5 },
    ["Ambor"] = { "安柏", 4 },
    ["Barbara"] = { "芭芭拉", 4 },
    ["Bennett"] = { "班尼特", 4 },
    ["Beidou"] = { "北斗", 4 },
    ["Chongyun"] = { "重云", 4 },
    ["Tartaglia"] = { "达达利亚", 5 },
    ["Diona"] = { "迪奥娜", 4 },
    ["Diluc"] = { "迪卢克", 5 },
    ["Fischl"] = { "菲谢尔", 4 },
    ["Ganyu"] = { "甘雨", 5 },
    ["Hutao"] = { "胡桃", 5 },
    ["Kaeya"] = { "凯亚", 4 },
    ["Klee"] = { "可莉", 5 },
    ["Keqing"] = { "刻晴", 5 },
    ["Razor"] = { "雷泽", 4 },
    ["Lisa"] = { "丽莎", 4 },
    ["Rosaria"] = { "罗莎莉亚", 4 },
    ["Mona"] = { "莫娜", 5 },
    ["Ningguang"] = { "凝光", 4 },
    ["Noel"] = { "诺艾尔", 4 },
    ["Qin"] = { "琴", 5 },
    ["Qiqi"] = { "七七", 5 },
    ["Sucrose"] = { "砂糖", 4 },
    ["Venti"] = { "温迪", 5 },
    ["Xiangling"] = { "香菱", 4 },
    ["Xiao"] = { "魈", 5 },
    ["Xingqiu"] = { "行秋", 4 },
    ["Xinyan"] = { "辛焱", 4 },
    ["Feiyan"] = { "烟绯", 4 },
    ["Zhongli"] = { "钟离", 5 },
    ["Eula"] = { "优菈", 5 },
    ["Kazuha"] = { "枫原万叶", 5 },
    ["Ayaka"] = { "神里绫华", 5 },
    ["Yoimiya"] = { "宵宫", 5 },
    ["Sayu"] = { "早柚", 4 },
    ["Aloy"] = { "埃洛伊", 5 },
    ["Sara"] = { "九条裟罗", 4 },
    ["Shougun"] = { "雷电将军", 5 },
    ["Kokomi"] = { "珊瑚宫心海", 5 },
    ["Tohma"] = { "托马", 4 },
    ["Itto"] = { "荒泷一斗", 5 },
    ["Gorou"] = { "五郎", 4 },
    ["Yunjin"] = { "云堇", 4 },
    ["Shenhe"] = { "申鹤", 5 },
    ["Yae"] = { "八重神子", 5 },
    ["Ayato"] = { "神里绫人", 5 },
    ["Shinobu"] = { "久岐忍", 4 },
    ["Yelan"] = { "夜兰", 5 },
    ["Heizo"] = { "鹿野院平藏", 4 },
    ["Tighnari"] = { "提纳里", 5 },
    ["Collei"] = { "柯莱", 4 },
    ["Dori"] = { "多莉", 4 },
    ["Cyno"] = { "赛诺", 5 },
    ["Nilou"] = { "妮露", 5 },
    ["Candace"] = { "坎蒂丝", 4 },
    ["Nahida"] = { "纳西妲", 5 },
    ["Layla"] = { "莱依拉", 4 },
    ["Wanderer"] = { "流浪者", 5 },
    ["Faruzan"] = { "珐露珊", 4 },
}

繁荣 = { "Qiqi", "Keqing", "Xiao", "Shenhe", "Yelan", "Ningguang" }
黄金 = { "Zhongli", "Xinyan", "Beidou", "Xingqiu", "Feiyan" }
勤劳 = { "Ganyu", "Hutao", "Kazuha", "Yunjin", "Chongyun", "Xiangling", }

自由 = { "Tartaglia", "Klee", "Aloy", "Ambor", "Sucrose", "Barbara", "Diona" }
抗争 = { "Eula", "Qin", "Mona", "Diluc", "Bennett", "Noel", "Razor" }
诗文 = { "Venti", "Albedo", "Lisa", "Kaeya", "Fischl", "Rosaria" }

浮世 = { "Yoimiya", "Kokomi", "Tohma", "Heizo", }
风雅 = { "Ayaka", "Itto", "Ayato", "Sara", "Shinobu", }
天光 = { "Shougun", "Yae", "Gorou", "Sayu", }

诤言 = { "Tighnari", "Cyno", "Candace", "Faruzan" }
巧思 = { "Nahida", "Dori", "Layla", }
笃行 = { "Nilou", "Wanderer", "Collei", }

talenttab = {
    ["Mon"] = {
        { "繁荣", "s0", 繁荣 },
        { "自由", "s5", 自由 },
        { "浮世", "s6", 浮世 },
        { "诤言", "s9", 诤言 },
    },
    ["Tue"] = {
        { "勤劳", "s3", 勤劳 },
        { "抗争", "s2", 抗争 },
        { "风雅", "s7", 风雅 },
        { "巧思", "s10", 巧思 },
    },
    ["Wed"] = {
        { "黄金", "s1", 黄金 },
        { "诗文", "s4", 诗文 },
        { "天光", "s8", 天光 },
        { "笃行", "s11", 笃行 },
    },
    ["Sun"] = {
        { "繁荣", "s0", 繁荣 },
        { "自由", "s5", 自由 },
        { "浮世", "s6", 浮世 },
        { "勤劳", "s3", 勤劳 },
        { "抗争", "s2", 抗争 },
        { "风雅", "s7", 风雅 },
        { "黄金", "s1", 黄金 },
        { "诗文", "s4", 诗文 },
        { "天光", "s8", 天光 },
        { "诤言", "s9", 诤言 },
        { "巧思", "s10", 巧思 },
        { "笃行", "s11", 笃行 },
    },
}


all_weapon = {
    高塔孤王 = {
        { "风鹰剑", "AquilaFavonia", "sword", 5, "Falcon" },
        { "松籁响起之时", "SongOfBrokenPines", "sword2", 5, "Widsith" },

        { "西风剑", "FavoniusSword", "sword", 4, "Zephyrus" },
        { "宗室长剑", "RoyalLongsword", "sword", 4, "Theocrat" },
        { "暗巷闪光", "TheAlleyFlash", "sword", 4, "Outlaw" },
        { "辰砂之纺锤", "CinnabarSpindle", "sword", 4, "Opus" },
        { "钟剑", "TheBell", "sword2", 4, "Troupe" },
        { "雪葬的星银", "SnowTombedStarsilver", "sword2", 4, "Dragonfell" },
        { "西风秘典", "FavoniusCodex", "book", 4, "Zephyrus" },
        { "宗室秘法录", "RoyalGrimoire", "book", 4, "Theocrat" },
        { "绝弦", "TheStringless", "bow", 4, "Troupe" },
        { "苍翠猎弓", "TheViridescentHunt", "bow", 4, "Viridescent" },
        { "幽夜华尔兹", "MitternachtsWaltz", "bow", 4, "Nachtblind" },

        { "冷刃", "CoolSteel", "sword", 3, "Steel" },
        { "铁影阔剑", "FerrousShadow", "sword2", 3, "Glaive" },
        { "魔导绪论", "MagicGuide", "book", 3, "Intro" },
        { "鸦羽弓", "RavenBow", "bow", 3, "Crowfeather" },

        { "银剑", "SilverSword", "sword", 2, "Silver" },
        { "口袋魔导书", "PocketGrimoire", "book", 2, "Pocket" },

        { "无锋剑", "DullBlade", "sword", 1, "Blunt" },
        { "学徒笔记", "ApprenticesNotes", "book", 1, "Apprentice" },
    },
    孤云寒林 = {
        { "斫峰之刃", "SummitShaper", "sword", 5, "Kunwu" },
        { "若水", "AquaSimulacra", "bow", 5, "Kirin" },
        { "和璞鸢", "PrimordialJadeWingedSpear", "stick", 5, "Morax" },

        { "匣里龙吟", "LionsRoar", "sword", 4, "Rockkiller" },
        { "黑岩长剑", "BlackcliffLongsword", "sword", 4, "Blackrock" },
        { "白影剑", "Whiteblind", "sword2", 4, "Exotic" },
        { "千岩古剑", "LithicBlade", "sword2", 4, "Lapis" },
        { "匣里日月", "SolarPearl", "book", 4, "Resurrection" },
        { "黑岩绯玉", "BlackcliffAgate", "book", 4, "Blackrock" },
        { "弓藏", "Rust", "bow", 4, "Recluse" },
        { "黑岩战弓", "BlackcliffWarbow", "bow", 4, "Blackrock" },
        { "流月针", "CrescentPike", "stick", 4, "Exotic" },

        { "暗铁剑", "DarkIronSword", "sword", 3, "Darker" },
        { "翡玉法球", "EmeraldOrb", "book", 3, "Jade" },
        { "弹弓", "Slingshot", "bow", 3, "Sling" },
        { "白缨枪", "WhiteTassel", "stick", 3, "Ruby" },
    },
    凛风奔狼 = {
        { "天空之刃", "SkywardBlade", "sword", 5, "Dvalin" },
        { "天空之傲", "SkywardPride", "sword2", "5", "Dvalin" },
        { "天空之卷", "SkywardAtlas", "book", "5", "Dvalin" },
        { "天空之翼", "SkywardHarp", "bow", "5", "Dvalin" },
        { "终末嗟叹之诗", "ElegyOfTheEnd", "bow", "5", "Widsith" },

        { "笛剑", "TheFlute", "sword", 4, "Troupe" },
        { "黑剑", "TheBlackSword", "sword", 4, "Bloodstained" },
        { "降临之剑", "SwordOfDescension", "sword", 4, "Psalmus" },
        { "祭礼大剑", "SacrificialGreatsword", "sword2", "4", "Fossil" },
        { "流浪乐章", "TheWidsith", "book", "4", "Troupe" },
        { "暗巷的酒与诗", "WindAndSong", "book", "4", "Outlaw" },
        { "嘟嘟可故事集", "DodocoTales", "book", "4", "Ludiharpastum" },
        { "祭礼弓", "SacrificialBow", "bow", "4", "Fossil" },
        { "决斗之枪", "Deathmatch", "stick", 4, "Gladiator" },
        { "龙脊长枪", "DragonspineSpear", "stick", 4, "Everfrost" },
        { "风信之锋", "MissiveWindspear", "stick", 4, "Windvane" },

        { "黎明神剑", "HarbingerOfDawn", "sword", 3, "Dawn" },
        { "沐浴龙血的剑", "BloodstainedGreatsword", "sword2", "3", "Siegfry" },
        { "讨龙英杰谭", "ThrillingTalesOfDragonSlayers", "book", "3", "Pulpfic" },
        { "神射手之誓", "SharpshootersOath", "bow", "3", "Arjuna" },

        { "佣兵重剑", "OldMercsPal", "sword2", 2, "Oyaji" },
        { "历练的猎弓", "SeasonedHuntersBow", "bow", "2", "Old" },

        { "猎弓", "HuntersBow", "bow", "1", "Hunters" },
    },
    雾海云间 = {
        { "磐岩结绿", "PrimordialJadeCutter", "sword", 5, "Morax" },
        { "无工之剑", "TheUnforged", "sword2", 5, "Kunwu" },
        { "息灾", "CalamityQueller", "stick", 5, "Santika" },

        { "雨裁", "Rainslasher", "sword2", 4, "Perdue" },
        { "试作斩岩", "PrototypeRancour", "sword", 4, "Proto" },
        { "黑岩斩刀", "BlackcliffSlasher", "sword2", 4, "Blackrock" },
        { "试作金珀", "PrototypeAmber", "book", 4, "Proto" },
        { "昭心", "EyeOfPerception", "book", 4, "Truelens" },
        { "试作澹月", "PrototypeCrescent", "bow", 4, "Proto" },
        { "匣里灭辰", "DragonsBane", "stick", 4, "Stardust" },
        { "黑岩刺枪", "BlackcliffPole", "stick", 4, "Blackrock" },
        { "宗室猎枪", "RoyalSpear", "stick", 4, "Theocrat" },

        { "吃虎鱼刀", "FilletBlade", "sword", 3, "Sashimi" },
        { "以理服人", "DebateClub", "sword2", 3, "Reasoning" },
        { "甲级宝珏", "TwinNephrite", "book", 3, "Phoney" },
        { "信使", "Messenger", "bow", 3, "Msg" },
        { "钺矛", "Halberd", "stick", 3, "Halberd" },
    },
    狮牙斗士 = {
        { "苍古自由之誓", "FreedomSworn", "sword", 5, "Widsith" },
        { "狼的末路", "WolfsGravestone", "sword2", 5, "Wolfmound" },
        { "四风原典", "LostPrayerToTheSacredWinds", "book", 5, "Fourwinds" },
        { "阿莫斯之弓", "AmosBow", "bow", 5, "Amos" },
        { "天空之脊", "SkywardSpine", "stick", 5, "Dvalin" },

        { "祭礼剑", "SacrificialSword", "sword", 4, "Fossil" },
        { "腐殖之剑", "FesteringDesire", "sword", 4, "Magnum" },
        { "西风大剑", "FavoniusGreatsword", "sword2", 4, "Zephyrus" },
        { "宗室大剑", "RoyalGreatsword", "sword2", 4, "Theocrat" },
        { "祭礼残章", "SacrificialFragments", "book", 4, "Fossil" },
        { "忍冬之果", "Frostbearer", "book", 4, "Everfrost" },
        { "西风猎弓", "FavoniusWarbow", "bow", 4, "Zephyrus" },
        { "宗室长弓", "RoyalBow", "bow", 4, "Theocrat" },
        { "风花之颂", "WindblumeOde", "bow", 4, "Fleurfair" },
        { "暗巷猎手", "AlleyHunter", "bow", 4, "Outlaw" },
        { "西风长枪", "FavoniusLance", "stick", 4, "Zephyrus" },

        { "旅行剑", "TravelersHandySword", "sword", 3, "Traveler" },
        { "白铁大剑", "WhiteIronGreatsword", "sword2", 3, "Tin" },
        { "异世界行记", "OtherworldlyStory", "book", 3, "Lightnov" },
        { "反曲弓", "RecurveBow", "bow", 3, "Curve" },

        { "铁尖枪", "IronPoint", "stick", 2, "Rod" },

        { "训练大剑", "WasterGreatsword", "sword2", 1, "Aniki" },
        { "新手长枪", "BeginnersProtector", "stick", 1, "Gewalt" },
    },
    漆黑陨铁 = {
        { "尘世之锁", "MemoryOfDust", "book", 5, "Kunwu" },
        { "贯虹之槊", "VortexVanquisher", "stick", 5, "Kunwu" },
        { "护摩之杖", "StaffOfHoma", "stick", 5, "Homa" },

        { "铁蜂刺", "IronSting", "sword", 4, "Exotic" },
        { "试作古华", "PrototypeArchaic", "sword2", 4, "Proto" },
        { "螭骨剑", "SerpentSpine", "sword2", 4, "Kione" },
        { "衔珠海皇", "LuxuriousSeaLord", "sword2", 4, "MillenniaTuna" },
        { "万国诸海图谱", "MappaMare", "book", 4, "Exotic" },
        { "钢轮弓", "CompoundBow", "bow", 4, "Exotic" },
        { "落霞", "FadingTwilight", "bow", 4, "Fallensun" },
        { "试作星镰", "PrototypeStarglitter", "stick", 4, "Proto" },
        { "千岩长枪", "LithicSpear", "stick", 4, "Lapis" },

        { "飞天御剑", "SkyriderSword", "sword", 3, "Mitsurugi" },
        { "飞天大御剑", "SkyriderGreatsword", "sword2", 3, "Mitsurugi" },
        { "黑缨枪", "BlackTassel", "stick", 3, "Noire" },
    },
    远海夷地 = {
        { "雾切之回光", "MistsplitterReforged", "sword", 5, "Narukami" },
        { "不灭月华", "EverlastingMoonglow", "book", 5, "Kaleido" },

        { "天目影打刀", "AmenomaKageuchi", "sword", 4, "Bakufu" },
        { "恶王丸", "Akuoumaru", "sword2", 4, "Maria" },
        { "证誓之明瞳", "OathswornEye", "book", 4, "Jyanome" },
        { "白辰之环", "HakushinRing", "book", 4, "Bakufu" },
    },
    鸣神御灵 = {
        { "波乱月白经津", "HaranGeppakuFutsu", "sword", 5, "Amenoma" },
        { "赤角石溃杵", "RedhornStonethresher", "sword2", 5, "Itadorimaru" },
        { "飞雷之弦振", "ThunderingPulse", "bow", 5, "Narukami" },

        { "东花坊时雨", "ToukabouShigure", "sword", 4, "Kasabouzu" },
        { "桂木斩长正", "KatsuragikiriNagamasa", "sword2", 4, "Bakufu" },
        { "破魔之弓", "Hamayumi", "bow", 4, "Bakufu" },
        { "掠食者", "Predator", "bow", 4, "Predator" },
        { "曚云之月", "MouunsMoon", "bow", 4, "Maria" },
    },
    今昔剧画 = {
        { "神乐之真意", "KagurasVerity", "book", 5, "Narukami" },
        { "冬极白星", "PolarStar", "bow", 5, "Worldbane" },
        { "薙草之稻光", "EngulfingLightning", "stick", 5, "Narukami" },

        { "笼钓瓶一心", "CursedBlade", "sword", 4, "Youtou" },
        { "喜多院十文字", "KitainCrossSpear", "stick", 4, "Bakufu" },
        { "渔获", "TheCatch", "stick", 4, "Mori" },
        { "断浪长鳍", "WavebreakersFin", "stick", 4, "Maria" },
    },
    谧林涓露 = {
        { "圣显之钥", "KeyOfKhajNisut", "sword", 5, "Deshret" },

        { "西福斯的月光", "XiphosMoonlight", "sword", 4, "Pleroma" },
        { "原木刀", "SapwoodBlade", "sword", 4, "Arakalari" },
        { "森林王器", "ForestRegalia", "sword2", 4, "Arakalari" },
    },
    绿洲花园 = {
        { "千夜浮梦", "", "book", 5, "Ayus" },
        { "赤沙之杖", "StaffOfTheScarletSands", "stick", 5, "Deshret" },

        { "流浪的晚星", "WanderingEvenstar", "book", 4, "Pleroma" },
        { "盈满之实", "FruitOfFulfillment", "book", 4, "Arakalari" },
        { "贯月矢", "Moonpiercer", "stick", 4, "Arakalari" },
    },
    烈日权威 = {
        { "图莱杜拉的回忆", "TulaytullahsRemembrance", "book", 5, "Alaya" },
        { "猎人之径", "HuntersPath", "bow", 5, "Ayus" },

        { "玛海菈的水色", "MakhairaAquamarine", "sword2", 4, "Pleroma" },
        { "王下近侍", "KingsSquire", "bow", 4, "Arakalari" },
        { "竭泽", "Trawler", "bow", 4, "Fin" },
    },
}

weapontab = {
    ["Mon"] = {
        { "高塔孤王", "w0" },
        { "孤云寒林", "w1" },
        { "远海夷地", "w6" },
        { "谧林涓露", "w11" },
    },
    ["Tue"] = {
        { "凛风奔狼", "w2" },
        { "雾海云间", "w5" },
        { "鸣神御灵", "w7" },
        { "绿洲花园", "w9" },
    },
    ["Wed"] = {
        { "狮牙斗士", "w4" },
        { "漆黑陨铁", "w3" },
        { "今昔剧画", "w8" },
        { "烈日权威", "w10" },
    },
    ["Sun"] = {
        { "高塔孤王", "w0" },
        { "孤云寒林", "w1" },
        { "远海夷地", "w6" },
        { "谧林涓露", "w11" },

        { "凛风奔狼", "w2" },
        { "雾海云间", "w5" },
        { "鸣神御灵", "w7" },
        { "绿洲花园", "w9" },

        { "狮牙斗士", "w4" },
        { "漆黑陨铁", "w3" },
        { "今昔剧画", "w8" },
        { "烈日权威", "w10" },
    },
}

daytab = {
    ["Mon"] = 0,
    ["Tue"] = 1,
    ["Wed"] = 2,
    ["Thu"] = 0,
    ["Fri"] = 1,
    ["Sat"] = 2,
    ["Sun"] = 6,
}

function jcpage(z) --主页
    jc.showPage(z)
end

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
jcpage(daytab[week])

imgUrl = "https://api.mukapp.top/genshin_artifact-main/src/images/characters/"
imgUrl2 = "https://upload-bbs.mihoyo.com/game_record/genshin/equip/UI_EquipIcon_"
imgUrl3 = "https://upload-bbs.mihoyo.com/game_record/genshin/character_icon/UI_AvatarIcon_"

--用表存放数据
for i = 1, 7 do
    loadstring("data" .. i .. "={}")()
    loadstring("data" .. i .. "_type={}")()
end

for i = 1, 7 do
    loadstring("data" .. i .. "b={}")()
    loadstring("data" .. i .. "b_type={}")()
end

item_title = {
    RelativeLayout,
    layout_width = "-1",
    layout_height = "-2",
    {
        TextView;
        --textColor=primaryc;
        --textSize="16sp";
        --gravity="center|left";
        --Typeface=AppFont.特粗;
        --padding="16dp";
        --paddingLeft="8dp",
        --paddingBottom="0";
        layout_width = "-1",
        layout_height = "8dp",
        textColor = "#00000000",
        id = "title",
    };
}

item_stitle = {
    RelativeLayout,
    layout_width = "-1",
    layout_height = "-2",
    {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            TextView;
            textColor = primaryc;
            textSize = "14sp";
            gravity = "center|left";
            Typeface = AppFont.粗体;
            layout_width = "-2",
            layout_height = "-1",
            layout_marginLeft = "8dp";
            paddingTop = "8dp",
            paddingBottom = "8dp",
            --layout_weight="1",
            layout_gravity = "center",
            id = "stitle",
        };
        {
            CardView;
            CardElevation = "0dp";
            CardBackgroundColor = cardbackc;
            Radius = "4dp";
            layout_width = "-2";
            layout_height = "-1";
            layout_margin = "16dp";
            layout_marginBottom = "8dp";
            layout_marginTop = "8dp";
            layout_gravity = "center",
            {
                LinearLayout,
                layout_width = "-2",
                layout_height = "-1",
                {
                    RelativeLayout,
                    layout_width = "24dp";
                    layout_height = "24dp";
                    {
                        ImageView;
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                        id = "simg1",
                    };
                    {
                        ImageView;
                        id = "stimg_1";
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                    },
                };
                {
                    RelativeLayout,
                    layout_width = "24dp";
                    layout_height = "24dp";
                    {
                        ImageView;
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                        id = "simg2",
                    };
                    {
                        ImageView;
                        id = "stimg_2";
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                    };
                },
                {
                    RelativeLayout,
                    layout_width = "24dp";
                    layout_height = "24dp";
                    {
                        ImageView;
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                        id = "simg3",
                    };
                    {
                        ImageView;
                        id = "stimg_3";
                        scaleType = "fitCenter";
                        layout_width = "-1";
                        layout_height = "-1";
                        colorFilter = viewshaderc;
                    };
                },
            },
        },
    },
}

item_item = {
    RelativeLayout,
    layout_width = "-1",
    layout_height = "-2",
    {
        CardView;
        CardElevation = "0dp";
        CardBackgroundColor = cardbackc;
        Radius = "4dp";
        layout_width = "-1";
        layout_height = "-2";
        layout_marginLeft = "8dp";
        layout_marginRight = "8dp";
        layout_marginTop = "8dp",
        layout_marginBottom = "8dp",
        {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-2",
            --orientation="vertical",
            gravity = "center",
            {
                RelativeLayout,
                layout_width = "48dp";
                layout_height = "48dp";
                {
                    ImageView;
                    scaleType = "fitCenter";
                    layout_width = "-1";
                    layout_height = "-1";
                    colorFilter = viewshaderc;
                    id = "imgb",
                };
                {
                    ImageView;
                    --src=imgUrl..v..".png";
                    scaleType = "fitCenter";
                    layout_width = "-1";
                    layout_height = "-1";
                    colorFilter = viewshaderc;
                    id = "img",
                },
            },
            {
                TextView;
                id = "name",
                textColor = textc;
                textSize = "14sp";
                gravity = "center";
                Typeface = AppFont.标准;
                layout_width = "-1",
                layout_height = "-1",
            };
        },
    },
}

item_blank = {
    RelativeLayout,
    layout_width = "-1",
    layout_height = "24dp",
    background = "#212121",
}

rholder = function(parent, viewType)
    if viewType == 1 then
        local views = {}
        holder1 = LuaRecyclerHolder(loadlayout(item_title, views))
        holder1.view.setTag(views)
        return holder1
    elseif viewType == 2 then
        local views = {}
        holder2 = LuaRecyclerHolder(loadlayout(item_stitle, views))
        holder2.view.setTag(views)
        return holder2
    elseif viewType == 3 then
        local views = {}
        holder3 = LuaRecyclerHolder(loadlayout(item_item, views))
        holder3.view.setTag(views)
        return holder3
    elseif viewType == 4 then
        local views = {}
        holder4 = LuaRecyclerHolder(loadlayout(item_blank, views))
        holder4.view.setTag(views)
        return holder4
    end
end

local adp1 = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data1
    end,
    getItemViewType = function(position)
        return data1_type[position + 1]
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter1.getItemViewType(position) == 1 then
            view.title.Text = data1[position + 1][1]
        elseif adapter1.getItemViewType(position) == 2 then
            view.stitle.Text = data1[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data1[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data1[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data1[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background2.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter1.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data1[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data1[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data1[position + 1][2]
        end
    end,
}))

local adp1b = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data1b
    end,
    getItemViewType = function(position)
        return data1b_type[position + 1]
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter1b.getItemViewType(position) == 1 then
            view.title.Text = data1b[position + 1][1]
        elseif adapter1b.getItemViewType(position) == 2 then
            view.stitle.Text = data1b[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data1b[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data1b[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data1b[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background5.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter1b.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data1b[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data1b[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data1b[position + 1][2]
        end
    end,
}))

local adp2 = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data2
    end,
    getItemViewType = function(position)
        return loadstring("return data" .. (2) .. "_type[" .. (position + 1) .. "]")()
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter2.getItemViewType(position) == 1 then
            view.title.Text = data2[position + 1][1]
        elseif adapter2.getItemViewType(position) == 2 then
            view.stitle.Text = data2[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data2[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data2[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data2[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background2.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter2.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data2[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data2[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data2[position + 1][2]
        end
    end,
}))

local adp2b = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data2b
    end,
    getItemViewType = function(position)
        return data2b_type[position + 1]
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter2b.getItemViewType(position) == 1 then
            view.title.Text = data2b[position + 1][1]
        elseif adapter2b.getItemViewType(position) == 2 then
            view.stitle.Text = data2b[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data2b[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data2b[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data2b[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background5.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter2b.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data2b[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data2b[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data2b[position + 1][2]
        end
    end,
}))

local adp3 = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data3
    end,
    getItemViewType = function(position)
        return loadstring("return data" .. (3) .. "_type[" .. (position + 1) .. "]")()
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter3.getItemViewType(position) == 1 then
            view.title.Text = data3[position + 1][1]
        elseif adapter3.getItemViewType(position) == 2 then
            view.stitle.Text = data3[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data3[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data3[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data3[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background2.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter3.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data3[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data3[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data3[position + 1][2]
        end
    end,
}))

local adp3b = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data3b
    end,
    getItemViewType = function(position)
        return data3b_type[position + 1]
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter3b.getItemViewType(position) == 1 then
            view.title.Text = data3b[position + 1][1]
        elseif adapter3b.getItemViewType(position) == 2 then
            view.stitle.Text = data3b[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data3b[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data3b[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data3b[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background5.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter3b.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data3b[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data3b[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data3b[position + 1][2]
        end
    end,
}))

local adp7 = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data7
    end,
    getItemViewType = function(position)
        return loadstring("return data" .. (7) .. "_type[" .. (position + 1) .. "]")()
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter7.getItemViewType(position) == 1 then
            view.title.Text = data7[position + 1][1]
        elseif adapter7.getItemViewType(position) == 2 then
            view.stitle.Text = data7[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data7[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data7[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data7[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background2.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter7.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data7[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data7[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data7[position + 1][2]
        end
    end,
}))

local adp7b = LuaRecyclerViewAdapter(LuaAdapterCreator({
    getItemCount = function()
        return #data7b
    end,
    getItemViewType = function(position)
        return data7b_type[position + 1]
    end,
    onCreateViewHolder = rholder,
    onBindViewHolder = function(holder, position)
        view = holder.view.getTag()
        if adapter7b.getItemViewType(position) == 1 then
            view.title.Text = data7b[position + 1][1]
        elseif adapter7b.getItemViewType(position) == 2 then
            view.stitle.Text = data7b[position + 1][1]
            Glide.with(this)
                .load(File(activity.getLuaDir(data7b[position + 1][2])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_1);
            Glide.with(this)
                .load(File(activity.getLuaDir(data7b[position + 1][3])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_2);
            Glide.with(this)
                .load(File(activity.getLuaDir(data7b[position + 1][4])))
                .override(dp2px(24), dp2px(24))
                .into(view.stimg_3);

            Glide.with(this)
                .load(File(activity.getLuaDir("res/background5.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg1);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background4.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg2);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/background3.png")))
                .override(dp2px(24), dp2px(24))
                .into(view.simg3);
        elseif adapter7b.getItemViewType(position) == 3 then
            Glide.with(this)
                .load(data7b[position + 1][1])
                .override(dp2px(48), dp2px(48))
                .into(view.img);
            Glide.with(this)
                .load(File(activity.getLuaDir("res/" .. data7b[position + 1][3] .. ".png")))
                .override(dp2px(48), dp2px(48))
                .into(view.imgb)
            view.name.Text = data7b[position + 1][2]
        end
    end,
}))

adapter1 = adp1
adapter2 = adp2
adapter3 = adp3
adapter7 = adp7

page1.setAdapter(adapter1)
page2.setAdapter(adapter2)
page3.setAdapter(adapter3)
page7.setAdapter(adapter7)

adapter1b = adp1b
adapter2b = adp2b
adapter3b = adp3b
adapter7b = adp7b

page1b.setAdapter(adapter1b)
page2b.setAdapter(adapter2b)
page3b.setAdapter(adapter3b)
page7b.setAdapter(adapter7b)

local localtable = {}
local localtable2 = {}

function addlocaltable(num, n)
    if num == 1 then
        localtable[#localtable + 1] = n
    elseif num == 2 then
        localtable2[#localtable2 + 1] = n
    end
end

function addlocaltable_start(num, tab)
    if num == 1 then
        localtable = tab
    elseif num == 2 then
        localtable2 = tab
    end
end

function addlocaltable_end(num, tab)
    if num == 1 then
        tab = localtable
        localtable = {}
    elseif num == 2 then
        tab = localtable2
        localtable2 = {}
    end
end

function addtalent(i, v)

    --local lastclock=os.clock()

    addlocaltable_start(1, loadstring("return data" .. (v + 1))())
    addlocaltable_start(2, loadstring("return data" .. (v + 1) .. "_type")())

    addlocaltable(1, { "角色天赋素材" })
    addlocaltable(2, 1)

    --table.insert(loadstring("return data"..(v+1))(),{"角色天赋素材"})
    --table.insert(loadstring("return data"..(v+1).."_type")(),1)

    local ntab = talenttab[i]
    for i2 = 1, #ntab do
        local sttext = ntab[i2][1];

        local stsrc1 = "res/daily/" .. ntab[i2][2] .. "_3.png"

        local stsrc2 = "res/daily/" .. ntab[i2][2] .. "_2.png"

        local stsrc3 = "res/daily/" .. ntab[i2][2] .. "_1.png"

        addlocaltable(1, { sttext, stsrc1, stsrc2, stsrc3 })
        addlocaltable(2, 2)
        --table.insert(loadstring("return data"..(v+1))(),{sttext,stsrc1,stsrc2,stsrc3})
        --table.insert(loadstring("return data"..(v+1).."_type")(),2)

        local tab = ntab[i2][3]
        --遍历tab数据
        for k, v1 in ipairs(tab) do
            if all_person[v1] then
                if all_person[v1][2] == 5 then
                    pcolor = "background5"
                else
                    pcolor = "background4"
                end
                local pname = all_person[v1][1];
                local ping = imgUrl3 .. v1 .. ".png?x-oss-process=image/crop,w_200,h_200,y_5,g_north"
                addlocaltable(1, { ping, pname, pcolor })
                addlocaltable(2, 3)
                --table.insert(loadstring("return data"..(v+1))(),{ping,pname,pcolor})
                --table.insert(loadstring("return data"..(v+1).."_type")(),3)
            else
                print(v)
            end
        end
    end

    addlocaltable_end(1, loadstring("return data" .. (v + 1))())
    addlocaltable_end(2, loadstring("return data" .. (v + 1) .. "_type")())

    addlocaltable_start(1, loadstring("return data" .. (v + 1) .. "b")())
    addlocaltable_start(2, loadstring("return data" .. (v + 1) .. "b_type")())

    addlocaltable(1, { "武器突破素材" })
    addlocaltable(2, 1)

    --table.insert(loadstring("return data"..(v+1).."b")(),{"武器突破素材"})
    --table.insert(loadstring("return data"..(v+1).."b_type")(),1)
    local ntab = weapontab[i]

    for i2 = 1, #ntab do
        --print(dump(ntab))
        local sttext = ntab[i2][1];

        local stsrc1 = "res/daily/" .. ntab[i2][2] .. "_3.png"

        local stsrc2 = "res/daily/" .. ntab[i2][2] .. "_2.png"

        local stsrc3 = "res/daily/" .. ntab[i2][2] .. "_1.png"

        addlocaltable(1, { sttext, stsrc1, stsrc2, stsrc3 })
        addlocaltable(2, 2)

        --table.insert(loadstring("return data"..(v+1).."b")(),{sttext,stsrc1,stsrc2,stsrc3})
        --table.insert(loadstring("return data"..(v+1).."b_type")(),2)

        local tab = all_weapon[ntab[i2][1]]
        --遍历tab数据
        for k, v1 in ipairs(tab) do
            if tointeger(v1[4]) == 5 then
                pcolor = "background5"
            elseif tointeger(v1[4]) == 4 then
                pcolor = "background4"
            elseif tointeger(v1[4]) == 3 then
                pcolor = "background3"
            elseif tointeger(v1[4]) == 2 then
                pcolor = "background2"
            else
                pcolor = "background1"
            end
            local pname = v1[1];
            local weapon_type = v1[3]
            if weapon_type == "sword" then
                weapon_type = "Sword"
            elseif weapon_type == "sword2" then
                weapon_type = "Claymore"
            elseif weapon_type == "bow" then
                weapon_type = "Bow"
            elseif weapon_type == "stick" then
                weapon_type = "Pole"
            elseif weapon_type == "book" then
                weapon_type = "Catalyst"
            end
            local weapon_code = v1[5] or v1[2]
            local ping = imgUrl2 .. weapon_type .. "_" .. weapon_code .. ".png"
            --[[if v1[5]=="webp" then
        ping=imgUrl2..v1[2].."_tn.webp"
      end]]
            --print(ping)

            addlocaltable(1, { ping, pname, pcolor })
            addlocaltable(2, 3)
            --table.insert(loadstring("return data"..(v+1).."b")(),{ping,pname,pcolor})
            --table.insert(loadstring("return data"..(v+1).."b_type")(),3)
        end

    end

    addlocaltable_end(1, loadstring("return data" .. (v + 1) .. "b")())
    addlocaltable_end(2, loadstring("return data" .. (v + 1) .. "b_type")())

    --local clock=os.clock()
    --print(clock-lastclock)

    loadstring("return adapter" .. (v + 1))().notifyDataSetChanged()
    loadstring("return adapter" .. (v + 1) .. "b")().notifyDataSetChanged()

    --print(os.clock()-clock)
end

jc.setOnPageChangeListener(PageView.OnPageChangeListener {
    onPageScrolled = function(a, b, c)
        local w = activity.getWidth() / 4
        local wd = c / 4
        page_scroll.setX(wd + w * a)
    end,
    onPageSelected = function(v)
        page_num = v + 1
        local x = primaryc
        local c = stextc
        local c1 = c
        local c2 = c
        local c3 = c
        local c7 = c
        if v == 0 then
            c1 = x
            if not dm then
                addtalent("Mon", 0)
                dm = true
            end
        end
        if v == 1 then
            c2 = x
            if not dt then
                addtalent("Tue", 1)
                dt = true
            end
        end
        if v == 2 then
            c3 = x
            if not dw then
                addtalent("Wed", 2)
                dw = true
            end
        end
        if v == 3 then
            c7 = x
            if not dsu then
                addtalent("Sun", 6)
                dsu = true
            end
        end
        jc1.getChildAt(0).setTextColor(转0x(c1))
        jc2.getChildAt(0).setTextColor(转0x(c2))
        jc3.getChildAt(0).setTextColor(转0x(c3))
        jc7.getChildAt(0).setTextColor(转0x(c7))
    end
})

--PopupWindow
Popup_layout = {
    LinearLayout;
    {
        CardView;
        CardElevation = "6dp";
        CardBackgroundColor = ctbackc;
        Radius = "8dp";
        layout_width = "-1";
        layout_height = "-2";
        layout_margin = "8dp";
        {
            GridView;
            layout_height = "-1";
            layout_width = "-1";
            NumColumns = 1;
            id = "Popup_list";
        };
    };
};

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

popadp.add { popadp_text = "致谢", }

Popup_list.setOnItemClickListener(AdapterView.OnItemClickListener {
    onItemClick = function(parent, v, pos, id)
        pop.dismiss()
        local s = v.Tag.popadp_text.Text
        if s == "致谢" then
            单按钮对话框("致谢", [[非常感谢以下小伙伴们对本功能作出的贡献：
摇光 QQ 2817884383 cpdd
Venti QQ 3152626835
与猫 1.09809051429E19开根
Up，别歪就行 圣遗物也别歪
非洲细作
烛影&君龙 UID 133858229
小信 cpdd请找QQ 3047894807
铁蛋是楠宝 QQ 1668820560
兔狲
奥特曼在此灭了你 QQ 482671684]], "关闭", function() 关闭对话框() end)
        end

    end
})

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

    setWidth(page_scroll, activity.getWidth() / 4)
    setWidth(page_scroll1, activity.getWidth() / 2)
    setWidth(page_scroll2, activity.getWidth() / 2)
    setWidth(page_scroll3, activity.getWidth() / 2)
    setWidth(page_scroll7, activity.getWidth() / 2)
    page_scroll.setX((page_num - 1) * (activity.getWidth() / 4))
    page_scroll1.setX((page1_num - 1) * (activity.getWidth() / 2))
    page_scroll2.setX((page2_num - 1) * (activity.getWidth() / 2))
    page_scroll3.setX((page3_num - 1) * (activity.getWidth() / 2))
    page_scroll7.setX((page4_num - 1) * (activity.getWidth() / 2))

    local giwidth = tointeger(activity.width / dp2px(120))

    gvmanager1 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter1.getItemViewType(position) == 1
                    or adapter1.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter1.getItemViewType(i) == 1
                    or adapter1.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager1b = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter1b.getItemViewType(position) == 1
                    or adapter1b.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter1b.getItemViewType(i) == 1
                    or adapter1b.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager2 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter2.getItemViewType(position) == 1
                    or adapter2.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter2.getItemViewType(i) == 1
                    or adapter2.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager2b = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter2b.getItemViewType(position) == 1
                    or adapter2b.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter2b.getItemViewType(i) == 1
                    or adapter2b.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager3 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter3.getItemViewType(position) == 1
                    or adapter3.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter3.getItemViewType(i) == 1
                    or adapter3.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager3b = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter3b.getItemViewType(position) == 1
                    or adapter3b.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter3b.getItemViewType(i) == 1
                    or adapter3b.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager7 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter7.getItemViewType(position) == 1
                    or adapter7.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter7.getItemViewType(i) == 1
                    or adapter7.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    gvmanager7b = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adapter7b.getItemViewType(position) == 1
                    or adapter7b.getItemViewType(position) == 2 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adapter7b.getItemViewType(i) == 1
                    or adapter7b.getItemViewType(i) == 2 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    page1.setLayoutManager(gvmanager1)
    page2.setLayoutManager(gvmanager2)
    page3.setLayoutManager(gvmanager3)
    page7.setLayoutManager(gvmanager7)

    page1b.setLayoutManager(gvmanager1b)
    page2b.setLayoutManager(gvmanager2b)
    page3b.setLayoutManager(gvmanager3b)
    page7b.setLayoutManager(gvmanager7b)

    if activity.Height * 0.9 < activity.Width then
        --横屏
        setHeight(mActionBar, dp2px(48))
        setHeight(dym1, dp2px(40))
        setHeight(dym2, dp2px(40))
        setHeight(dym3, dp2px(40))
        setHeight(dym4, dp2px(40))
        setHeight(dym8, dp2px(40))
    else
        setHeight(mActionBar, dp2px(56))
        setHeight(dym1, dp2px(48))
        setHeight(dym2, dp2px(48))
        setHeight(dym3, dp2px(48))
        setHeight(dym4, dp2px(48))
        setHeight(dym8, dp2px(48))
    end
end

function onConfigurationChanged(newConfig)
    分屏()
end

分屏()
