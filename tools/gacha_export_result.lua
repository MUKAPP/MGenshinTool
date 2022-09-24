require "import"
import "mods.muk"
import "com.lwb.piechart.*"

import "android.icu.text.SimpleDateFormat"

activity.Title = "抽卡记录分析"

local json = 读取文件(内置存储文件("gacha_export.tmp"))

if 全局主题值 == "Night" or 全局主题值 == "Star" then
  color_five_star = "#F57C00"
  color_five_star_people = "#F57C00"
  color_five_star_arm = "#FFAB40"

  color_four_star = "#B388FF"
  color_four_star_people = "#B388FF"
  color_four_star_arm = "#D1C4E9"
 else
  color_five_star = "#F57C00"
  color_five_star_people = "#F57C00"
  color_five_star_arm = "#FFAB40"

  color_four_star = "#512DA8"
  color_four_star_people = "#512DA8"
  color_four_star_arm = "#7C4DFF"
end

layout = {
  LinearLayout,
  orientation = "vertical",
  layout_width = "fill",
  layout_height = "fill",
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
        src = 图标("content_copy"),
        id = "_copy"
      }
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
        src = 图标("save"),
        id = "_save"
      }
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
      CardView,
      CardElevation = "0dp",
      CardBackgroundColor = backgroundc,
      Radius = "16dp",
      layout_width = "-1",
      layout_height = "-1",
      id = "main_w",
      {
        LinearLayout,
        layout_height = "-1",
        layout_width = "-1",
        orientation = "vertical",
        paddingBottom = "8dp",
        id = "main",
        {
          CardView,
          CardElevation = "0dp",
          background = primaryc,
          Radius = "8dp",
          layout_width = "-1",
          layout_height = "-1",
          layout_margin = "16dp",
          layout_marginBottom = "8dp",
          id = "iTitle",
          {
            LinearLayout,
            layout_height = "56dp",
            layout_width = "-1",
            orientation = "vertical",
            gravity = "left|center",
            paddingLeft = "16dp",
            {
              TextView,
              text = "原神抽卡记录分析",
              textColor = backgroundc,
              textSize = "18sp",
              Typeface = AppFont.特粗,
              layout_height = "-2",
              layout_width = "-2"
            },
            {
              TextView,
              text = "by 应急食品",
              textColor = backgroundc,
              textSize = "12sp",
              Typeface = AppFont.标准,
              layout_height = "-2",
              layout_width = "-2"
            }
          }
        }
      }
    }
  }
}

activity.setContentView(loadlayout(layout))

波纹({fh, _save, _more, _copy}, "圆主题")

控件隐藏(iTitle)

--print(dump(tab))

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
  控件可见(iTitle)
  ti = Ticker()
  ti.Period = 200
  ti.onTick = function()
    ti.stop()
    local filename = os.date("%m-%d_%H-%M-%S") .. ".png"
    保存图片(内置存储("Pictures/MUKGenshinTool/" .. filename), 获取控件图片(main_w))
    提示("已保存到：" .. 内置存储("Pictures/MUKGenshinTool/" .. filename))
    控件隐藏(iTitle)
  end
  ti.start()
end

function addCard(
  name,
  time_start,
  time_end,
  total_text,
  info_text,
  five_star,
  rank5,
  rank5_people,
  rank5_people_v,
  rank5_arm_v,
  rank4,
  rank4_people,
  rank4_people_v,
  rank4_arm_v,
  rank4_alltext)
  xpcall(
  function()
    main.addView(
    loadlayout(
    {
      LinearLayout,
      layout_height = "-2",
      layout_width = "-1",
      orientation = "vertical",
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
        layout_marginBottom = "8dp",
        {
          LinearLayout,
          orientation = "vertical",
          --layout_marginTop="20dp",
          layout_width = "-1",
          layout_height = "-1",
          paddingBottom = "8dp",
          {
            TextView,
            text = name,
            textColor = primaryc,
            textSize = "16sp",
            gravity = "center|left",
            Typeface = AppFont.特粗,
            padding = "16dp",
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
              layout_height = "-1",
              padding = "16dp",
              paddingTop = "8dp",
              orientation = "vertical",
              {
                PieChartView,
                layout_width = "-1",
                layout_height = "160dp",
                id = "pie",
                layout_weight = "1"
              },
              {
                LinearLayout,
                layout_width = "-1",
                layout_height = "-2",
                paddingTop = "8dp",
                {
                  TextView,
                  text = time_start,
                  textColor = stextc,
                  textSize = "12sp",
                  gravity = "center|left",
                  Typeface = AppFont.标准,
                  layout_width = "-2",
                  layout_weight = "1"
                },
                {
                  TextView,
                  text = "至",
                  textColor = stextc,
                  textSize = "12sp",
                  gravity = "center",
                  Typeface = AppFont.标准,
                  layout_width = "-2"
                },
                {
                  TextView,
                  text = time_end,
                  textColor = stextc,
                  textSize = "12sp",
                  gravity = "center|right",
                  Typeface = AppFont.标准,
                  layout_width = "-2",
                  layout_weight = "1"
                }
              }
            }
          },
          {
            TextView,
            text = Html.fromHtml(total_text),
            textColor = textc,
            textSize = "14sp",
            gravity = "center|left",
            Typeface = AppFont.标准,
            paddingLeft = "16dp",
            paddingRight = "16dp",
            paddingBottom = "0dp",
            paddingTop = "8dp",
            layout_width = "-1",
            layout_weight = "1"
          },
          {
            TextView,
            text = Html.fromHtml(info_text),
            textColor = textc,
            textSize = "14sp",
            gravity = "center|left",
            Typeface = AppFont.标准,
            paddingLeft = "16dp",
            paddingRight = "16dp",
            paddingBottom = "0dp",
            paddingTop = "8dp",
            layout_width = "-1",
            layout_weight = "1"
          },
          {
            TextView,
            text = Html.fromHtml("五星历史记录：" .. five_star),
            textColor = textc,
            textSize = "14sp",
            gravity = "center|left",
            Typeface = AppFont.标准,
            paddingLeft = "16dp",
            paddingRight = "16dp",
            paddingBottom = "0dp",
            paddingTop = "8dp",
            layout_width = "-1",
            layout_weight = "1"
          },
          {
            TextView,
            text = "四星历史记录(点击查看)",
            textColor = textc,
            textSize = "14sp",
            gravity = "center|left",
            Typeface = AppFont.标准,
            paddingLeft = "16dp",
            paddingRight = "16dp",
            paddingBottom = "8dp",
            paddingTop = "8dp",
            layout_width = "-1",
            layout_weight = "1",
            background = 波纹2("方自适应"),
            onClick = function()
              单按钮对话框(
              name .. " 四星记录",
              rank4_alltext,
              "关闭",
              function()
                关闭对话框()
              end
              )
            end
          }
        }
      }
    }
    )
    )

    local pieChartView = pie
    if rank5_people_v then
      pieChartView.addItemType(
      PieChartView.ItemType("五星人物：" .. rank5_people, rank5_people, 转0x(color_five_star_people))
      )
    end
    if rank5_arm_v then
      pieChartView.addItemType(
      PieChartView.ItemType("五星武器：" .. (rank5 - rank5_people), rank5 - rank5_people, 转0x(color_five_star_arm))
      )
    end
    if rank4_people_v then
      pieChartView.addItemType(
      PieChartView.ItemType("四星人物：" .. rank4_people, rank4_people, 转0x(color_four_star_people))
      )
    end
    if rank4_arm_v then
      pieChartView.addItemType(
      PieChartView.ItemType("四星武器：" .. rank4 - rank4_people, rank4 - rank4_people, 转0x(color_four_star_arm))
      )
    end
    if not rank5_people_v and not rank5_arm_v and not rank4_people_v and not rank4_arm_v then
      控件隐藏(pieChartView)
    end

    pieChartView.setBackGroundColor(0x00000000) --设置背景颜色
    pieChartView.setItemTextSize(sp2px(12)) --设置字体大小
    pieChartView.setTextPadding(dp2px(6)) --设置字体与横线距离
  end,
  function(e)
    print(e)
  end
  )
end

function updateInfo(n)
  提示(n)
end

all_text = ""

function setCopy(n)
  all_text = n
end

_copy.onClick = function()
  --print(all_text)
  复制文本(all_text)
  提示("已复制文本")
end

function print_t(tab)
  print(dump(luajava.astable(tab, true)))
end

if 全局主题值 == "Night" or 全局主题值 == "Star" then
  gray = "#9E9E9E"
 else
  gray = "#9E9E9E"
end

ti = Ticker()
ti.Period = 400
ti.onTick = function()
  ti.stop()
  thread(
  function(
    json,
    JSON,
    keepDecimal,
    primaryc,
    color_five_star,
    color_five_star_people,
    color_five_star_arm,
    color_four_star,
    color_four_star_people,
    color_four_star_arm,
    gray)
    require "import"
    import "android.icu.text.SimpleDateFormat"

    xpcall(
    function()
      local function customSort(t)
        local temp = {}
        table.foreach(
        t,
        function(k, v)
          table.insert(temp, {k, v})
        end
        )
        table.clear(t)
        table.foreach(
        temp,
        function(k, v)
          table.insert(t, v)
        end
        )
        table.clear(temp)
        table.sort(
        t,
        function(a, b)
          return a[2] > b[2]
        end
        )
        return t
      end

      all_five_star_person = {
        {
          ["typ"] = "岩",
          ["con"] = {"钟离", "阿贝多", "荒泷一斗"},
          ["col"] = "#FFA000"
        },
        {
          ["typ"] = "风",
          ["con"] = {"魈", "温迪", "琴", "枫原万叶", "万叶"},
          ["col"] = "#009688"
        },
        {
          ["typ"] = "冰",
          ["con"] = {"七七", "甘雨", "优菈", "神里绫华", "申鹤"},
          ["col"] = "#2196F3"
        },
        {
          ["typ"] = "水",
          ["con"] = {"莫娜", "达达利亚", "珊瑚宫心海", "神里绫人","夜兰",},
          ["col"] = "#3F51B5"
        },
        {
          ["typ"] = "雷",
          ["con"] = {"刻晴", "雷电将军", "八重神子"},
          ["col"] = "#673AB7"
        },
        {
          ["typ"] = "火",
          ["con"] = {"可莉", "迪卢克", "胡桃", "宵宫"},
          ["col"] = "#F44336"
        },
        {
          ["typ"] = "草",
          ["con"] = {"提纳里"},
          ["col"] = "#4CAF50"
        }
      }

      all_five_star_arm_color = {
        {
          ["con"] = {"斫峰之刃", "无工之剑", "贯虹之槊", "尘世之锁", "赤角石溃杵"},
          ["col"] = "#FFA000"
        },
        {
          ["con"] = {"磐岩结绿", "和璞鸢"},
          ["col"] = "#009688"
        },
        {
          ["con"] = {
            "天空之刃",
            "风鹰剑",
            "天空之傲",
            "天空之脊",
            "四风原典",
            "天空之翼",
            "天空之卷",
            "冬极白星",
            "波乱月白经津",
            "若水"
          },
          ["col"] = "#2196F3"
        },
        {
          ["con"] = {"终末嗟叹之诗", "松籁响起之时", "苍古自由之誓", "息灾"},
          ["col"] = "#3F51B5"
        },
        {
          ["con"] = {"阿莫斯之弓", "雾切之回光", "飞雷之弦振", "薙草之稻光", "不灭月华", "神乐之真意"},
          ["col"] = "#673AB7"
        },
        {
          ["con"] = {"狼的末路", "护摩之杖"},
          ["col"] = "#F44336"
        },
        {
          ["con"] = {"猎人之径"},
          ["col"] = "#4CAF50"
        },
      }

      local cardTab = {}

      all_text = "抽卡记录分析\n——————"
      function addText(n)
        all_text = all_text .. "\n" .. n
      end

      local tab = JSON.decode(json)

      local mode = 0

      --[[if tab.typeMap
        --tab=tab.result
        mode=1
      end]]
      typ = {301, 302, 200, 100}
      for i = 1, #typ do
        local name = ""
        local content = ""
        --if mode==0
        name = tab[tostring(typ[i])].name
        content = tab[tostring(typ[i])].content
        --[[else
          for i2=1,#tab.typeMap
            if tab.typeMap[i2][1]==tab.result[i][1]
              name=tab.typeMap[i2][2]
            end
          end
          content=tab.result[i][2]
        end]]
        local five_star = ""
        local rank5 = 0
        local rank4 = 0
        local rank3 = 0
        local rank5_people = 0
        local rank4_people = 0
        local total_c = #content
        local no_rank5 = 0
        local rank4_all = {
          people = {},
          weapon = {}
        }

        local last_iscz = false

        print("正在统计 " .. name)

        if total_c ~= 0 then
          local time_start = content[1][1]
          local time_end = content[#content][1]

          for i = 1, #content do
            local time = content[i][1]
            local nname = content[i][2]
            local ntype = content[i][3]
            --人物/武器
            local rank = content[i][4]
            --星级
            local total = content[i][5]
            --总次数
            local total_ = content[i][6]
            --保底内

            if rank == 5 then
              no_rank5 = 0
             else
              no_rank5 = total_
            end

            if rank == 5 then
              rank5 = rank5 + 1
              local rank5_color = ""
              for i, v in ipairs(all_five_star_person) do
                for i2, v2 in ipairs(v.con) do
                  if v2 == nname then
                    rank5_color = v.col
                  end
                end
              end
              for i, v in ipairs(all_five_star_arm_color) do
                for i2, v2 in ipairs(v.con) do
                  if v2 == nname then
                    rank5_color = v.col
                  end
                end
              end
              if name ~= "角色活动祈愿" then
                five_star =
                five_star .. '<font color="' .. rank5_color .. '">' .. nname .. "[" .. total_ .. "]</font> "
               else
                local iscz_zt
                if last_iscz == true then
                  iscz_zt = '<font color="' .. rank5_color .. '">[大'
                 else
                  iscz_zt = '<font color="' .. rank5_color .. '">[小'
                end
                if name:find("角色") then
                  local ntmy,
                  ntmm,
                  ntmd = time:match("(.-)%-(.-)%-(.-) ")

                  if nname == "迪卢克" or nname == "刻晴" or nname == "莫娜" or nname == "七七" or nname == "琴" then
                    last_iscz = true
                    iscz_zt = '<font color="' .. gray .. '">[歪'
                   elseif nname=="提纳里" then
                    local sdf = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                    if tointeger(sdf.parse(time).getTime() / 1000)
                      <=tointeger(sdf.parse("2022-09-09 17:59:59").getTime() / 1000)
                      and tointeger(sdf.parse(time).getTime() / 1000)
                      >=tointeger(sdf.parse("2022-08-24 11:00:00").getTime() / 1000)
                      last_iscz = false
                     else
                      last_iscz = true
                    end
                   else
                    last_iscz = false
                  end
                end
                five_star =
                five_star ..
                '<font color="' .. rank5_color .. '">' .. nname .. "</font>" .. iscz_zt .. total_ .. "]</font> "
              end

              if ntype == "武器" then
               else
                rank5_people = rank5_people + 1
              end
            end

            if rank == 4 then
              rank4 = rank4 + 1
              if ntype == "武器" then
                local yw = false
                if rank4_all.weapon[nname] then
                  yw = true
                end
                if yw then
                  --print(nname,rank4_all.weapon[nname]+1)
                  rank4_all.weapon[nname] = rank4_all.weapon[nname] + 1
                 else
                  --print(nname,1)
                  rank4_all.weapon[nname] = 1
                end
               else
                rank4_people = rank4_people + 1
                local yw = false
                if rank4_all.people[nname] then
                  yw = true
                end
                if yw then
                  --print(nname,rank4_all.people[nname]+1)
                  rank4_all.people[nname] = rank4_all.people[nname] + 1
                 else
                  --print(nname,1)
                  rank4_all.people[nname] = 1
                end
              end
            end
            if rank == 3 then
              rank3 = rank3 + 1
            end
          end

          --call("dump",rank4_all)

          local rank5b = keepDecimal(rank5 / total_c * 100) .. "%"
          local rank4b = keepDecimal(rank4 / total_c * 100) .. "%"
          local rank3b = keepDecimal(rank3 / total_c * 100) .. "%"

          if rank5_people == 0 then
            rank5_people_v = false
           else
            rank5_people_v = true
          end

          if rank5 - rank5_people == 0 then
            rank5_arm_v = false
           else
            rank5_arm_v = true
          end

          if rank4_people == 0 then
            rank4_people_v = false
           else
            rank4_people_v = true
          end

          if rank4 - rank4_people == 0 then
            rank4_arm_v = false
           else
            rank4_arm_v = true
          end

          local average = keepDecimal((total_c - no_rank5) / rank5)
          if rank5 == 0 then
            average = "无"
          end

          local total_c_no3 = total_c - rank3

          local ran5_prob = 233

          if name ~= "武器活动祈愿" then
            if no_rank5 + 1 < 73 then
              rank5_prob = 0.6
             else
              rank5_prob = 0.6 + (no_rank5 + 1 - 73) * 6
            end
           else
            if no_rank5 + 1 < 62 then
              rank5_prob = 0.7
             elseif no_rank5 + 1 >= 62 and no_rank5 + 1 < 73 then
              rank5_prob = 0.7 + (no_rank5 + 1 - 62) * 7
             else
              rank5_prob = 77.7 + (no_rank5 + 1 - 73) * 3.5
            end
          end
          if rank5_prob > 100 then
            rank5_prob = 100
          end
          rank5_prob = tostring(rank5_prob) .. "%"

          --print(ntype,ran5_prob)

          local total_text = ""
          total_text = total_text .. '总计 <font color="' .. primaryc .. '">' .. total_c .. "</font> 抽"
          if average == "无" then
            total_text = total_text .. "<br>未抽出过五星"
           else
            total_text = total_text .. '<br>平均 <font color="' .. primaryc .. '">' .. average .. "</font> 抽一个五星"
          end
          total_text = total_text .. '<br>已累积 <font color="' .. primaryc .. '">' .. no_rank5 .. "</font> 抽未出五星"
          total_text = total_text .. '<br>下一抽出五星概率 <font color="' .. primaryc .. '">' .. rank5_prob .. "</font>"

          local info_text = ""
          if rank5 ~= 0 then
            info_text =
            info_text .. '<font color="' .. color_five_star .. '">五星：' .. rank5 .. " 占 " .. rank5b .. "</font>"
          end
          if rank4 ~= 0 then
            if info_text ~= "" then
              info_text = info_text .. "<br>"
            end
            info_text =
            info_text .. '<font color="' .. color_four_star .. '">四星：' .. rank4 .. " 占 " .. rank4b .. "</font>"
          end
          if rank3 ~= 0 then
            if info_text ~= "" then
              info_text = info_text .. "<br>"
            end
            info_text = info_text .. '<font color="#3196f3">三星：' .. rank3 .. " 占 " .. rank3b .. "</font>"
          end

          if five_star == "" then
            five_star = "无"
          end

          local tbl_ret = {
            people = {},
            weapon = {}
          }

          tbl_ret.people = customSort(rank4_all.people)
          tbl_ret.weapon = customSort(rank4_all.weapon)
          rank4_alltext = "人物：\n"
          local rats = false
          for i, v in pairs(tbl_ret.people) do
            if rats == true then
              rank4_alltext = rank4_alltext .. "  " .. v[1] .. "x" .. v[2]
             else
              rats = true
              rank4_alltext = rank4_alltext .. v[1] .. "x" .. v[2]
            end
          end
          rank4_alltext = rank4_alltext .. "\n武器：\n"
          local rats = false
          for i, v in pairs(tbl_ret.weapon) do
            if rats == true then
              rank4_alltext = rank4_alltext .. "  " .. v[1] .. "x" .. v[2]
             else
              rats = true
              rank4_alltext = rank4_alltext .. v[1] .. "x" .. v[2]
            end
          end

          cardTab[#cardTab + 1] = {
            name,
            time_start,
            time_end,
            total_text,
            info_text,
            five_star,
            rank5,
            rank5_people,
            rank5_people_v,
            rank5_arm_v,
            rank4,
            rank4_people,
            rank4_people_v,
            rank4_arm_v,
            rank4_alltext
          }

          addText(name)
          --[[if rank5_people_v
            addText("五星人物："..rank5_people)
          end
          if rank5_arm_v
            addText("五星武器："..rank5-rank5_people)
          end
          if rank4_people_v
            addText("四星人物："..rank4_people)
          end
          if rank4_arm_v
            addText("四星武器："..rank4-rank4_people)
          end]]
          --addText("——")
          addText(total_text:gsub("<br>", "\n"):gsub("<(.-)>", ""))
          addText(info_text:gsub("<br>", "\n"):gsub("<(.-)>", ""))
          addText("五星历史记录：" .. five_star:gsub("<br>", "\n"):gsub("<(.-)>", ""))
          --addText("五星人物："..five_star:gsub("<br>","\n"):gsub("<(.-)>",""))
          addText("————")
         else
          print(name .. " 无数据")
        end
        --print(rank5,rank5_people)
        --print(name,"总计:",total_c,"五星:",rank5,"四星:",rank4,"三星:",rank3,"五星记录:",five_star,"已多少抽未出五星:",no_rank5)
      end

      print("统计完成")
      addText("by 应急食品")
      all_text = (all_text:gsub("————\nby", "——————\nby"))
      call("setCopy", all_text)

      for i = 1, #cardTab do
        ncard = cardTab[i]
        call(
        "addCard",
        ncard[1],
        ncard[2],
        ncard[3],
        ncard[4],
        ncard[5],
        ncard[6],
        ncard[7],
        ncard[8],
        ncard[9],
        ncard[10],
        ncard[11],
        ncard[12],
        ncard[13],
        ncard[14],
        ncard[15]
        )
      end
    end,
    function(e)
      print(e)
    end
    )
  end,
  json,
  JSON,
  keepDecimal,
  primaryc,
  color_five_star,
  color_five_star_people,
  color_five_star_arm,
  color_four_star,
  color_four_star_people,
  color_four_star_arm,
  gray
  )
end
ti.start()

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

popadp.add {popadp_text = "致谢"}

Popup_list.setOnItemClickListener(
AdapterView.OnItemClickListener {
  onItemClick = function(parent, v, pos, id)
    pop.dismiss()
    local s = v.Tag.popadp_text.Text
    if s == "致谢" then
      提示("特别感谢 @sunfkny 开源的 原神抽卡记录导出JS版")
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
