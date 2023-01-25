require "import"
import "mods.muk"
import "mods.hutaoapi"

import "androidx.core.widget.NestedScrollView"

import "androidx.recyclerview.widget.StaggeredGridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

import "com.michael.*"

import "com.bumptech.glide.request.RequestOptions"

import "androidx.core.widget.AutoSizeableTextView"
import "androidx.core.widget.TextViewCompat"
import "androidx.appcompat.widget.AppCompatTextView"

activity.Title = "深渊数据库"

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
                src = 图标("save"),
                id = "_save"
            },
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
                        Text = "使用率";
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
                        Text = "上场率";
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
                        Text = "持有率";
                        Typeface = AppFont.粗体;
                        textSize = "14sp";
                        textColor = stextc;
                    };
                };
            };
            {
                LinearLayout;
                layout_height = "8dp";
                layout_width = activity.getWidth() / 3;
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
                    NestedScrollView;
                    layout_width = "-1";
                    layout_height = "-1";
                    fillViewport = "true",
                    {
                        CardView,
                        CardElevation = "0dp",
                        CardBackgroundColor = backgroundc,
                        Radius = "16dp",
                        layout_width = "-1",
                        layout_height = "-1",
                        id = "page1_w",
                        {
                            RecyclerView,
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            id = "page1",
                            paddingLeft = "8dp",
                            paddingRight = "8dp",
                            NestedScrollingEnabled = false,
                            focusableInTouchMode = false,
                        },
                    },
                },
                {
                    NestedScrollView;
                    layout_width = "-1";
                    layout_height = "-1";
                    fillViewport = "true",
                    {
                        CardView,
                        CardElevation = "0dp",
                        CardBackgroundColor = backgroundc,
                        Radius = "16dp",
                        layout_width = "-1",
                        layout_height = "-1",
                        id = "page2_w",
                        {
                            RecyclerView,
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            id = "page2",
                            paddingLeft = "8dp",
                            paddingRight = "8dp",
                            NestedScrollingEnabled = false,
                            focusableInTouchMode = false,
                        },
                    },
                },
                {
                    NestedScrollView;
                    layout_width = "-1";
                    layout_height = "-1";
                    fillViewport = "true",
                    {
                        CardView,
                        CardElevation = "0dp",
                        CardBackgroundColor = backgroundc,
                        Radius = "16dp",
                        layout_width = "-1",
                        layout_height = "-1",
                        id = "page3_w",
                        {
                            RecyclerView,
                            --layout_marginTop="20dp",
                            layout_width = "-1",
                            layout_height = "-1",
                            id = "page3",
                            paddingLeft = "8dp",
                            paddingRight = "8dp",
                            NestedScrollingEnabled = false,
                            focusableInTouchMode = false,
                        },
                    },
                },

            },
        };
    };

}

function onCreate()
    activity.setContentView(loadlayout(layout))

    波纹({ fh, jc1, jc2, jc3, _save, _more }, "圆主题")

    page_num = 1

    function jcpage(z) --主页
        jc.showPage(z)
    end

    setItemWidth()
    item = {
        RelativeLayout,
        layout_width = "-1",
        layout_height = "-2",
        {
            CardView;
            CardElevation = "0dp";
            CardBackgroundColor = cardbackc;
            Radius = "8dp";
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
                orientation = "vertical",
                gravity = "center",
                {
                    RelativeLayout,
                    layout_width = "-2";
                    layout_height = "-2";
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
                    AppCompatTextView;
                    id = "name",
                    textColor = textc;
                    textSize = "12sp";
                    gravity = "center";
                    Typeface = AppFont.标准;
                    layout_width = "-1",
                    layout_height = "-1",
                    padding = "4dp",
                    paddingBottom = 0,
                    maxLines = 1,
                };
                {
                    AppCompatTextView;
                    id = "rate",
                    textColor = textc;
                    textSize = "12sp";
                    gravity = "center";
                    Typeface = AppFont.粗体;
                    layout_width = "-1",
                    layout_height = "-1",
                    padding = "4dp",
                    paddingTop = 0,
                    maxLines = 1,
                };
            },
        },
    }
    item2 = {
        RelativeLayout,
        layout_width = "-1",
        layout_height = "-2",
        {
            CardView;
            CardElevation = "0dp";
            CardBackgroundColor = cardbackc;
            Radius = "8dp";
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
                orientation = "vertical",
                {
                    LinearLayout,
                    layout_width = "-1",
                    layout_height = "-2",
                    gravity = "left|center",
                    {
                        RelativeLayout,
                        layout_width = "-2";
                        layout_height = "-2";
                        paddingTop = "8dp",
                        paddingLeft = "8dp",
                        {
                            ImageView;
                            scaleType = "fitCenter";
                            layout_width = "56dp";
                            layout_height = "56dp";
                            colorFilter = viewshaderc;
                            id = "imgb",
                        };
                        {
                            ImageView;
                            --src=imgUrl..v..".png";
                            scaleType = "fitCenter";
                            layout_width = "56dp";
                            layout_height = "56dp";
                            colorFilter = viewshaderc;
                            id = "img",
                        },
                    },
                    {
                        LinearLayout,
                        layout_width = "-1",
                        layout_height = "-1",
                        orientation = "vertical",
                        paddingLeft = "8dp",
                        paddingRight = "8dp",
                        paddingTop = "8dp",
                        gravity = "left|center",
                        {
                            AppCompatTextView;
                            id = "name",
                            textColor = textc;
                            textSize = "16sp";
                            Typeface = AppFont.标准;
                            layout_width = "-1",
                            layout_height = "-2",
                            maxLines = 1,
                        };
                        {
                            AppCompatTextView;
                            id = "rate",
                            textColor = textc;
                            textSize = "12sp";
                            Typeface = AppFont.粗体;
                            layout_width = "-1",
                            layout_height = "-2",
                            layout_marginTop = "4dp",
                            maxLines = 1,
                        };
                    };
                },
                {
                    LinearLayout,
                    layout_width = "-1",
                    layout_height = "-2",
                    padding = "8dp",
                    {
                        AppCompatTextView;
                        id = "constellations1",
                        textColor = textc;
                        textSize = "12sp";
                        Typeface = AppFont.标准;
                        layout_width = "-1",
                        layout_height = "-2",
                        layout_weight = "1",
                        gravity = "center",
                        maxLines = 4,
                    },
                    {
                        AppCompatTextView;
                        id = "constellations2",
                        textColor = textc;
                        textSize = "12sp";
                        Typeface = AppFont.标准;
                        layout_width = "-1",
                        layout_height = "-2",
                        layout_weight = "1",
                        gravity = "center",
                        maxLines = 3,
                    },
                };
            },
        },
    }
    info = {
        RelativeLayout,
        layout_width = "-1",
        layout_height = "-2",
        {
            CardView,
            CardElevation = "0dp",
            background = primaryc,
            Radius = "8dp",
            layout_width = "-1",
            layout_height = "-1",
            layout_margin = "8dp",
            layout_marginTop = "16dp",
            id = "iTitle",
            {
                LinearLayout,
                layout_height = "-2",
                layout_width = "-1",
                orientation = "vertical",
                gravity = "left|center",
                paddingLeft = "16dp",
                paddingTop = "12dp",
                paddingBottom = "12dp",
                paddingRight = "16dp",
                {
                    TextView,
                    text = "深渊数据库 XX率",
                    textColor = backgroundc,
                    textSize = "18sp",
                    Typeface = AppFont.特粗,
                    layout_height = "-2",
                    layout_width = "-1",
                    paddingTop = "4dp",
                    id = "title",
                },
                {
                    TextView,
                    text = "XX率指XXXXXXXXX。\n当期提交深渊数据用户数量：0000。",
                    textColor = backgroundc,
                    textSize = "14sp",
                    Typeface = AppFont.标准,
                    layout_height = "-2",
                    layout_width = "-1",
                    paddingTop = "4dp",
                    id = "info",
                },
                {
                    TextView,
                    text = "应急食品 & 胡桃API",
                    textColor = backgroundc,
                    textSize = "12sp",
                    Typeface = AppFont.标准,
                    layout_height = "-2",
                    layout_width = "-1",
                    paddingTop = "4dp",
                },
            }
        }
    }
    empty = {
        RelativeLayout,
        layout_width = "-1",
        layout_height = "-2",
        {
            TextView,
            id = "empty",
            layout_height = "8dp",
            layout_width = "-1",
        },
    }

    adp1 = LuaRecyclerViewAdapter(LuaAdapterCreator({
        getItemCount = function()
            return #utilizationRate + 2
        end,
        getItemViewType = function(position)
            if position == 0 then
                return 1
            elseif position == #utilizationRate + 1 then
                return 3
            else
                return 2
            end
        end,
        onCreateViewHolder = function(parent, viewType)
            local viewType = tointeger(viewType)
            if viewType == 1 then
                local views = {}
                holder1 = LuaRecyclerHolder(loadlayout(info, views))
                holder1.view.setTag(views)
                return holder1
            elseif viewType == 2 then
                local views = {}
                holder2 = LuaRecyclerHolder(loadlayout(item, views))
                holder2.view.setTag(views)
                return holder2
            elseif viewType == 3 then
                local views = {}
                holder3 = LuaRecyclerHolder(loadlayout(empty, views))
                holder3.view.setTag(views)
                return holder3
            end
        end,
        onBindViewHolder = function(holder, position)
            local viewType = adp1.getItemViewType(position)
            view = holder.view.getTag()
            if viewType == 1 then
                view.title.Text = "深渊数据库 - 使用率"
                view.info.Text = "使用率指持有该角色的玩家的使用频率。\n当期有效深渊数据用户数量："
                    .. spiralAbyssFullStar .. "。\n欢迎上传您的深渊记录来与我们共建深渊数据库(暂未开放)。"
            elseif viewType == 3 then
            elseif viewType == 2 then
                setWidth(view.img, itemw)
                setWidth(view.imgb, itemw)
                setHeight(view.img, itemw)
                setHeight(view.imgb, itemw)
                Glide.with(this)
                    .load(imgUrl .. utilizationRate[position].icon .. ".png")
                    .transform({ CenterCrop(), RoundedCorners(dp2px(8)) })
                    .override(itemw, itemw)
                    .into(view.img)
                Glide.with(this)
                    .load(File(activity.getLuaDir("res/background" .. utilizationRate[position].quality .. ".png")))
                    .transform({ CenterCrop(), RoundedCorners(dp2px(8)) })
                    .override(itemw, itemw)
                    .into(view.imgb)
                view.name.Text = utilizationRate[position].name
                view.rate.Text = utilizationRate[position].rate .. "%"
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.name, 4, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.rate, 4, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                if utilizationRate[position].rate >= 80 then
                    view.rate.textColor = 0xff00BFA5
                elseif utilizationRate[position].rate >= 40 then
                    view.rate.textColor = 0xff2979FF
                elseif utilizationRate[position].rate >= 20 then
                    view.rate.textColor = 0xffFFAB00
                else
                    view.rate.textColor = 0xffFF1744
                end

            end
        end,
    }))

    page1.setAdapter(adp1)

    adp2 = LuaRecyclerViewAdapter(LuaAdapterCreator({
        getItemCount = function()
            return #attendanceRate + 2
        end,
        getItemViewType = function(position)
            if position == 0 then
                return 1
            elseif position == #attendanceRate + 1 then
                return 3
            else
                return 2
            end
        end,
        onCreateViewHolder = function(parent, viewType)
            local viewType = tointeger(viewType)
            if viewType == 1 then
                local views = {}
                holder1 = LuaRecyclerHolder(loadlayout(info, views))
                holder1.view.setTag(views)
                return holder1
            elseif viewType == 2 then
                local views = {}
                holder2 = LuaRecyclerHolder(loadlayout(item, views))
                holder2.view.setTag(views)
                return holder2
            elseif viewType == 3 then
                local views = {}
                holder3 = LuaRecyclerHolder(loadlayout(empty, views))
                holder3.view.setTag(views)
                return holder3
            end
        end,
        onBindViewHolder = function(holder, position)
            local viewType = adp2.getItemViewType(position)
            view = holder.view.getTag()
            if viewType == 1 then
                view.title.Text = "深渊数据库 - 上场率"
                view.info.Text = "上场率指全部玩家内使用角色的频率。\n当期有效深渊数据用户数量："
                    .. spiralAbyssFullStar .. "。\n欢迎上传您的深渊记录来与我们共建深渊数据库(暂未开放)。"
            elseif viewType == 3 then
            elseif viewType == 2 then
                setWidth(view.img, itemw)
                setWidth(view.imgb, itemw)
                setHeight(view.img, itemw)
                setHeight(view.imgb, itemw)
                Glide.with(this)
                    .load(imgUrl .. attendanceRate[position].icon .. ".png")
                    .transform({ CenterCrop(), RoundedCorners(dp2px(8)) })
                    .override(itemw, itemw)
                    .into(view.img)
                Glide.with(this)
                    .load(File(activity.getLuaDir("res/background" .. attendanceRate[position].quality .. ".png")))
                    .transform({ CenterCrop(), RoundedCorners(dp2px(8)) })
                    .override(itemw, itemw)
                    .into(view.imgb)
                view.name.Text = attendanceRate[position].name
                view.rate.Text = attendanceRate[position].rate .. "%"
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.name, 4, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.rate, 4, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                if attendanceRate[position].rate >= 80 then
                    view.rate.textColor = 0xff00BFA5
                elseif attendanceRate[position].rate >= 40 then
                    view.rate.textColor = 0xff2979FF
                elseif attendanceRate[position].rate >= 20 then
                    view.rate.textColor = 0xffFFAB00
                else
                    view.rate.textColor = 0xffFF1744
                end

            end
        end,
    }))

    page2.setAdapter(adp2)

    adp3 = LuaRecyclerViewAdapter(LuaAdapterCreator({
        getItemCount = function()
            return #holdingRate + 2
        end,
        getItemViewType = function(position)
            if position == 0 then
                return 1
            elseif position == #holdingRate + 1 then
                return 3
            else
                return 2
            end
        end,
        onCreateViewHolder = function(parent, viewType)
            local viewType = tointeger(viewType)
            if viewType == 1 then
                local views = {}
                holder1 = LuaRecyclerHolder(loadlayout(info, views))
                holder1.view.setTag(views)
                return holder1
            elseif viewType == 2 then
                local views = {}
                holder2 = LuaRecyclerHolder(loadlayout(item2, views))
                holder2.view.setTag(views)
                return holder2
            elseif viewType == 3 then
                local views = {}
                holder3 = LuaRecyclerHolder(loadlayout(empty, views))
                holder3.view.setTag(views)
                return holder3
            end
        end,
        onBindViewHolder = function(holder, position)
            local viewType = adp3.getItemViewType(position)
            view = holder.view.getTag()
            if viewType == 1 then
                view.title.Text = "深渊数据库 - 持有率"
                view.info.Text = "持有率指持有该角色的玩家的频率。\n当期提交数据用户总量：" ..
                    recordTotal .. "。\n欢迎上传您的深渊记录来与我们共建深渊数据库(暂未开放)。"
            elseif viewType == 3 then
            elseif viewType == 2 then
                Glide.with(this)
                    .load(imgUrl .. holdingRate[position].icon .. ".png")
                    .transform({ CenterCrop(), RoundedCorners(dp2px(6)) })
                    .into(view.img)
                Glide.with(this)
                    .load(File(activity.getLuaDir("res/background" .. holdingRate[position].quality .. ".png")))
                    .transform({ CenterCrop(), RoundedCorners(dp2px(6)) })
                    .into(view.imgb)
                view.name.Text = holdingRate[position].name
                view.rate.Text = holdingRate[position].rate .. "%"
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.name, 4, 14, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.rate, 4, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                if holdingRate[position].rate >= 80 then
                    view.rate.textColor = 0xff00BFA5
                elseif holdingRate[position].rate >= 40 then
                    view.rate.textColor = 0xff2979FF
                elseif holdingRate[position].rate >= 20 then
                    view.rate.textColor = 0xffFFAB00
                else
                    view.rate.textColor = 0xffFF1744
                end
                view.constellations1.Text = holdingRate[position].constellations1
                view.constellations2.Text = holdingRate[position].constellations2
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.constellations1, 8, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
                TextViewCompat.setAutoSizeTextTypeUniformWithConfiguration(view.constellations2, 8, 12, 2,
                    TypedValue.COMPLEX_UNIT_SP);
            end
        end,
    }))

    page3.setAdapter(adp3)

    jc.setOnPageChangeListener(PageView.OnPageChangeListener {
        onPageScrolled = function(a, b, c)
            local w = activity.getWidth() / 3
            local wd = c / 3
            page_scroll.setX(wd + w * a)
        end,
        onPageSelected = function(v)
            page_num = v + 1
            local x = primaryc
            local c = stextc
            local c1 = c
            local c2 = c
            local c3 = c
            if v == 0 then
                c1 = x
            end
            if v == 1 then
                c2 = x
            end
            if v == 2 then
                c3 = x
            end
            pageNow = v + 1
            if pageNow == 2 and a2t == nil then
                attendanceRate = attendanceRate_p
                adp2.notifyDataSetChanged()
                a2t = true
            end
            if pageNow == 3 and a3t == nil then
                holdingRate = holdingRate_p
                adp3.notifyDataSetChanged()
                a3t = true
            end
            jc1.getChildAt(0).setTextColor(转0x(c1))
            jc2.getChildAt(0).setTextColor(转0x(c2))
            jc3.getChildAt(0).setTextColor(转0x(c3))
        end
    })

    avatarData = JSON.decode(读取文件(activity.getLuaDir("res/metadata/Output/Avatar.json")))

    imgUrl = "https://upload-bbs.mihoyo.com/game_record/genshin/character_icon/"

    --hutaoapi.login(function()
    --end)

    attendanceRate = {}
    utilizationRate = {}
    holdingRate = {}
    attendanceRate_p = {}
    utilizationRate_p = {}
    holdingRate_p = {}
    recordTotal = 0
    spiralAbyssTotal = 0
    spiralAbyssFullStar = 0

    local ok = 0
    function closeDialog()
        加载对话框内容("已完成：" .. ok .. "/3")
        if ok == 3 then
            关闭对话框()
        end
    end

    加载对话框("正在获取…", "已完成：" .. ok .. "/3")

    hutaoapi.statistics.overview(function(data)
        spiralAbyssTotal = data.data.spiralAbyssTotal
        recordTotal = data.data.recordTotal
        spiralAbyssFullStar = data.data.spiralAbyssFullStar
        if recordTotal < 1000 then
            recordTotal = recordTotal .. "（当前数据过少可能会导致结果不准确）"
        end
        if spiralAbyssFullStar < 1000 then
            spiralAbyssFullStar = spiralAbyssFullStar .. "（当前数据过少可能会导致结果不准确）"
        end

        hutaoapi.statistics.avatar_utilizationRate(function(data)
            --使用率
            for i, v in ipairs(data.data) do
                if v.floor == 12 then
                    for i2, v2 in ipairs(v.ranks) do
                        for i3, v3 in ipairs(avatarData) do
                            if v2.item == v3.Id then
                                utilizationRate_p[#utilizationRate_p + 1] =
                                {
                                    ["name"] = v3.Name,
                                    ["rate"] = tointeger(v2.rate * 10000) / 100,
                                    ["icon"] = v3.Icon,
                                    ["quality"] = v3.Quality,
                                }
                            end
                        end
                    end

                end
            end
            table.sort(utilizationRate_p, function(a, b)
                return a.rate > b.rate
            end)
            --adp1.notifyDataSetChanged()
            utilizationRate = utilizationRate_p
            adp1.notifyDataSetChanged()
            ok = ok + 1
            closeDialog()
        end, function()
            ok = ok + 1
            closeDialog()
        end)
        hutaoapi.statistics.avatar_attendanceRate(function(data)
            --上场率
            for i, v in ipairs(data.data) do
                if v.floor == 12 then
                    for i2, v2 in ipairs(v.ranks) do
                        for i3, v3 in ipairs(avatarData) do
                            if v2.item == v3.Id then
                                attendanceRate_p[#attendanceRate_p + 1] =
                                {
                                    ["name"] = v3.Name,
                                    ["rate"] = tointeger(v2.rate * 10000) / 100,
                                    ["icon"] = v3.Icon,
                                    ["quality"] = v3.Quality,
                                }
                            end
                        end
                    end

                end
            end
            table.sort(attendanceRate_p, function(a, b)
                return a.rate > b.rate
            end)
            --adp2.notifyDataSetChanged()
            ok = ok + 1
            closeDialog()
        end, function()
            ok = ok + 1
            closeDialog()
        end)
        hutaoapi.statistics.avatar_holdingRate(function(data)
            --持有率
            for i, v in ipairs(data.data) do
                for i3, v3 in ipairs(avatarData) do
                    if v.avatarId == v3.Id then
                        local constellations1 = ""
                        local constellations2 = ""
                        for i = 1, #v.constellations do
                            if tointeger(i / 2) ~= i / 2 then
                                if constellations1 == "" then
                                    constellations1 = v.constellations[i].item ..
                                        "命 " .. (tointeger(v.constellations[i].rate * 10000) / 100) .. "%"
                                else
                                    constellations1 = constellations1 ..
                                        "\n" ..
                                        v.constellations[i].item ..
                                        "命 " .. (tointeger(v.constellations[i].rate * 10000) / 100) .. "%"
                                end
                            else
                                if constellations2 == "" then
                                    constellations2 = v.constellations[i].item ..
                                        "命 " .. (tointeger(v.constellations[i].rate * 10000) / 100) .. "%"
                                else
                                    constellations2 = constellations2 ..
                                        "\n" ..
                                        v.constellations[i].item ..
                                        "命 " .. (tointeger(v.constellations[i].rate * 10000) / 100) .. "%"
                                end
                            end
                        end
                        holdingRate_p[#holdingRate_p + 1] =
                        {
                            ["name"] = v3.Name,
                            ["rate"] = tointeger(v.holdingRate * 10000) / 100,
                            ["icon"] = v3.Icon,
                            ["quality"] = v3.Quality,
                            ["constellations1"] = constellations1,
                            ["constellations2"] = constellations2,
                        }
                    end

                end
            end
            table.sort(holdingRate_p, function(a, b)
                return a.rate < b.rate
            end)
            --adp3.notifyDataSetChanged()
            ok = ok + 1
            closeDialog()
        end, function()
            ok = ok + 1
            closeDialog()
        end)

    end, function()
        关闭对话框()
    end)

    function 获取控件图片(view)
        bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888)
        canvas = Canvas(bitmap)
        view.measure(
            View.MeasureSpec.makeMeasureSpec(view.getWidth(), View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(view.getHeight(), View.MeasureSpec.EXACTLY)
        )
        view.draw(canvas)
        return bitmap
    end

    _save.onClick = function()
        ti = Ticker()
        ti.Period = 100
        ti.onTick = function()
            ti.stop()
            local filename = "深渊数据库_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".png"
            if pageNow == 1 then
                保存图片(内置存储("Pictures/MUKGenshinTool/" .. filename), 获取控件图片(page1_w))
            elseif pageNow == 2 then
                保存图片(内置存储("Pictures/MUKGenshinTool/" .. filename), 获取控件图片(page2_w))
            elseif pageNow == 3 then
                保存图片(内置存储("Pictures/MUKGenshinTool/" .. filename), 获取控件图片(page3_w))
            end
            提示("已保存到：" .. 内置存储("Pictures/MUKGenshinTool/" .. filename))
        end
        ti.start()
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

    popadp.add { popadp_text = "特别感谢" }

    Popup_list.setOnItemClickListener(
        AdapterView.OnItemClickListener {
            onItemClick = function(parent, v, pos, id)
                pop.dismiss()
                local s = v.Tag.popadp_text.Text
                if s == "特别感谢" then
                    单按钮对话框("特别感谢",
                        "特别感谢 DGP-Studio 的 Snap.Metadata(Snap 元数据仓库) 与 Snap.Hutao.Server(胡桃API v2)"
                        ,
                        "确定",
                        function()
                            关闭对话框()
                        end)
                end
            end
        })

    分屏()
end

function setWidth(v, n)
    linearParams = v.getLayoutParams()
    linearParams.width = n
    v.setLayoutParams(linearParams)
end

function setHeight(v, n)
    linearParams = v.getLayoutParams()
    linearParams.height = n
    v.setLayoutParams(linearParams)
end

function setItemWidth()
    itemw = ((activity.width - dp2px(16)) / tointeger(activity.width / dp2px(56 + 16))) - dp2px(16)
end

function 分屏()
    setItemWidth()

    setWidth(page_scroll, activity.getWidth() / 3)
    page_scroll.setX((page_num - 1) * (activity.getWidth() / 3))

    local giwidth = tointeger(activity.width / dp2px(56 + 16))
    local giwidth2 = tointeger(activity.width / dp2px(16 + 48 + 16 + 88))

    gvmanager1 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adp1.getItemViewType(position) == 1
                    or adp1.getItemViewType(position) == 3 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adp1.getItemViewType(i) == 1
                    or adp1.getItemViewType(i) == 3 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    page1.setLayoutManager(gvmanager1)

    gvmanager2 = GridLayoutManager(activity, giwidth)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adp2.getItemViewType(position) == 1
                    or adp2.getItemViewType(position) == 3 then
                    return int(giwidth)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adp2.getItemViewType(i) == 1
                    or adp2.getItemViewType(i) == 3 then
                    return int(0)
                else
                    return int(giwidth - 1)
                end
            end,
        }))

    page2.setLayoutManager(gvmanager2)

    gvmanager3 = GridLayoutManager(activity, giwidth2)
        .setSpanSizeLookup(LuaSpanSizeLookup(luaSpanSizeLookup {
            getSpanSize = function(position)
                if adp3.getItemViewType(position) == 1
                    or adp3.getItemViewType(position) == 3 then
                    return int(giwidth2)
                else
                    return int(1)
                end
            end,
            getSpanIndex = function(i, i2)
                if adp3.getItemViewType(i) == 1
                    or adp3.getItemViewType(i) == 3 then
                    return int(0)
                else
                    return int(giwidth2 - 1)
                end
            end,
        }))

    page3.setLayoutManager(gvmanager3)

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
