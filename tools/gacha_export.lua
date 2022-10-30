require "import"

import "mods.muk"

import "com.blankj.utilcode.util.ShellUtils"
import "org.jsoup.*"
import "com.blankj.utilcode.util.Utils$Consumer"

uigf_version="v2.2"

activity.Title = "抽卡记录分析"
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
          --gravity="center";
          id = "web_w",
          --[[{
            LuaWebView, --主体
            layout_height = activity.Width / 1240 * 633,
            layout_width = "-1",
            background = backgroundc,
            id = "web"
          },]]
          {
            LinearLayout,
            layout_width = "-1",
            layout_height = "-1",
            orientation = "vertical",
            id = "after",
            {
              CardView,
              CardElevation = "0dp",
              CardBackgroundColor = 转0x(primaryc) - 0xde000000,
              Radius = "8dp",
              layout_width = "-1",
              layout_height = "-2",
              layout_marginLeft = "16dp",
              layout_marginRight = "16dp",
              layout_marginTop = "16dp",
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
                Text = "获取抽卡记录链接",
                onClick = function()
                  activity.newActivity("tools/gecha_export_getlink")
                end,
                textColor = primaryc,
                id = "btn7"
              }
            },

            {
              MEditText {
                textSize = "14sp",
                id = "edit",
                hint = "输入抽卡记录链接",
                textColor = textc,
                HintTextColor = stextc,
                --SingleLine=true;
                --text="";
                layout_width = "-1",
                layout_height = "-2",
                --inputType="text";
                MaxLines = 6
              },
              layout_margin = "16dp",
              layout_marginTop = "16dp",
              layout_marginBottom = "8dp"
            },
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
              layout_gravity = "center",
              {
                ImageView,
                src = 图标("check"),
                layout_width = "56dp",
                layout_height = "56dp",
                padding = "16dp",
                id = "TranslationClick",
                ColorFilter = backgroundc
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
              onClick=function()
                activity.newActivity("tools/gacha_logs_local")
              end,
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
                Text = "本地记录",
                textColor = textc,
                id = "btn8",
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
                Text = "链接历史记录",
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
                Text = "Root获取抽卡记录链接",
                textColor = textc,
                id = "btn4"
              }
            },
            {
              CardView;
              CardElevation="0dp";
              CardBackgroundColor=cardbackc;
              Radius="8dp";
              layout_width="-1";
              layout_height="-2";
              layout_margin="8dp";
              layout_marginLeft="16dp";
              layout_marginRight="16dp";
              layout_marginTop="8dp";
              layout_marginBottom="8dp";
              {
                TextView;
                layout_width="-1";
                layout_height="-1";
                textSize="14sp";
                paddingRight="16dp";
                paddingLeft="16dp";
                Typeface=AppFont.标准;
                paddingTop="12dp";
                paddingBottom="12dp";
                gravity="center";
                Text="导入JSON分析";
                textColor=textc;
                id="btn5";
              };
            };
            {
              CardView,
              CardElevation = "0dp",
              CardBackgroundColor = "#21FF9800",
              Radius = "8dp",
              layout_width = "-1",
              layout_height = "-2",
              layout_margin = "16dp",
              layout_marginTop = "8dp",
              layout_marginBottom = "8dp",
              {
                LinearLayout,
                orientation = "vertical",
                layout_height = "-1",
                layout_width = "-1",
                paddingBottom = "8dp",
                paddingTop = "8dp",
                {
                  LinearLayout,
                  layout_height = "-2",
                  layout_width = "-1",
                  gravity = "left|center",
                  {
                    ImageView,
                    ColorFilter = "#FF9100",
                    src = 图标("warning"),
                    layout_height = "48dp",
                    layout_width = "48dp",
                    layout_marginLeft = "8dp",
                    padding = "12dp"
                  },
                  {
                    TextView,
                    text = "由于原神系统限制，软件只能获取到六个月内的抽卡记录",
                    textSize = "14sp",
                    textColor = "#FF9100",
                    paddingLeft = "8dp",
                    paddingRight = "8dp",
                    Typeface = AppFont.标准
                  }
                }
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
              layout_marginBottom = "112dp",
              {
                LinearLayout,
                orientation = "vertical",
                --layout_marginTop="20dp",
                layout_width = "-1",
                layout_height = "-1",
                paddingBottom = "16dp",
                {
                  TextView,
                  text = "Q&A",
                  textColor = primaryc,
                  textSize = "16sp",
                  gravity = "center|left",
                  Typeface = AppFont.特粗,
                  padding = "16dp",
                  paddingBottom = "0",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  text = "一、如何获取抽卡记录链接？",
                  textColor = primaryc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.特粗,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "8dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  text = "1. 登录米游社账号获取",
                  textColor = textc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.粗体,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "4dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "点击“获取抽卡记录链接”按钮，登录米游社账号，即可获取到抽卡记录链接，点击“✓”按钮即可分析。",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "2dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                },
                {
                  TextView,
                  text = "2. Root方式",
                  textColor = textc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.粗体,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "4dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "首先打开该页面，然后打开原神/云原神的 抽卡历史记录，再返回到该页面，点击 “Root获取抽卡记录链接”按钮 即可获取到链接。\n注意：Root权限为设备最高管理权限，请确认“应急食品”是否是从官网/酷安/官方群内下载！手机无Root并且对安卓系统不了解的人也不要轻易尝试获取Root权限！",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "2dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                },
                {
                  TextView,
                  text = "3. 断网复制",
                  textColor = textc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.粗体,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "4dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "断网复制的方式现已过时，请使用其他方法。",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "2dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                },
                {
                  TextView,
                  text = "二、关于应急食品支持的JSON导入&导出格式",
                  textColor = primaryc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.特粗,
                  padding = "16dp",
                  paddingBottom = "0",
                  paddingTop = "8dp",
                  layout_width = "-1",
                  layout_height = "-2"
                },
                {
                  TextView,
                  textSize = "14sp",
                  textColor = textc,
                  text = "应急食品导出的JSON文件遵循 UIGF v2.2(统一可交换祈愿记录标准)，同时也支持导入所有支持导出 UIGF v2.0~2.2 的抽卡分析软件导出的JSON",
                  Typeface = AppFont.标准,
                  layout_width = "-1",
                  layout_height = "-2",
                  gravity = "left",
                  paddingTop = "2dp",
                  paddingLeft = "16dp",
                  paddingRight = "16dp"
                },
              }
            }
          },
          {
            TextView,
            textSize = "16sp",
            textColor = textc,
            text = "正在加载…",
            Typeface = AppFont.标准,
            paddingTop = "112dp",
            layout_width = "-1",
            layout_height = "-2",
            gravity = "center",
            id = "info"
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
            layout_marginTop = "112dp",
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
              Text = "分析结果",
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
              Text = "导出Excel",
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
              Text = "导出JSON（UIGF标准）",
              textColor = textc,
              id = "btn6"
            }
          }
        }
      },
    }
  }
}


设置视图(layout)

波纹({back, _more}, "圆主题")
波纹({xz, btn1 ,course,btn7}, "方主题")
波纹({btn2, btn3, btn4, btn5, btn6, btn8}, "方自适应")

--web.removeView(web.getChildAt(0))

transitioner = LayoutTransition()
--web.setLayoutTransition(transitioner)
web_w.setLayoutTransition(transitioner)
web_w.getParent().setLayoutTransition(transitioner)

控件隐藏(info)

function querySplit(query)
  local queryTable={}
  local queryTableBefore=mukutils.split(query,"&")
  for i,v in ipairs(queryTableBefore)
    queryTable[v:match("(.+)%=")]=v:match("%=(.+)")
  end
  return queryTable
end

function mergeSplit(queryTable)
  local query=""
  for i,v in pairs(queryTable)
    if query~=""
      query=query.."&"..i.."="..v
     else
      query=i.."="..v
    end
  end
  return query
end

function transUrl(url)
  if url:find("getGachaLog")
    printLog("Check URL","new")
    getGachaLogs(url)
   else
    printLog("Check URL","old")
    local apiDomain = 'https://hk4e-api.mihoyo.com'
    if url:find('webstatic%-sea') or url:find('hk4e-api-os')
      apiDomain = 'https://hk4e-api-os.hoyoverse.com'
    end
    if url:find("#%/log") then
      url=apiDomain.."/event/gacha_info/api/getGachaLog?"
      ..url:match("%?(.-)#")
      .."&timestamp="..os.time().."&gacha_type=301&page=1&size=20&end_id=0"
      printLog("Check URL","Convert URL -> "..url)
      getGachaLogs(url)
     else
      提示("您输入的链接可能不完整")
    end
  end
end

function getGachaLogs(url)
  info.Text="正在获取 角色活动祈愿 第1页"
  local url_root=url:match("(.+)%?")
  local url_query=url:match("%?(.+)")
  local query_table=querySplit(url_query)

  printLog("Handle URL",url_root,query_table)

  query_table["size"]="20"
  query_table["gacha_type"]="301"
  query_table["page"]="1"
  query_table["lang"]="zh-cn"
  query_table["end_id"]="0"

  url_query=mergeSplit(query_table)
  url=url_root.."?"..url_query
  printLog("Merge URL",url)

  gacha_table={
    "list" = {},
    "info" = {
      ["uid"] = "",
      ["lang"] = "zh-cn",
      ["export_app"] = "MUKGenshinTool",
      ["export_app_version"] = tostring(应用版本),
      ["uigf_version"] = uigf_version
    }
  }

  gacha_table_old={
    "100"={
      "name"="新手祈愿",
    },
    "200"={
      "name"="常驻祈愿",
    },
    "301"={
      "name"="角色活动祈愿",
    },
    "302"={
      "name"="武器活动祈愿",
    },
  }

  function nextType(type)
    if type=="301"
      return "302"
    end
    if type=="302"
      return "200"
    end
    if type=="200"
      return "100"
    end
    if type=="100"
      return false
    end
  end

  function nextURL(url)
    if taberror==true
      return true
    end
    printLog("nextURL",last_type,lastpage,lastend_id,nt)
    local url_root=url:match("(.+)%?")
    local url_query=url:match("%?(.+)")
    local query_table=querySplit(url_query)

    --printLog("Handle URL",url_root,query_table)

    query_table["size"]="20"
    if nt~=true
      query_table["gacha_type"]=last_type
      query_table["page"]=tostring(tointeger(lastpage)+1)
      query_table["lang"]="zh-cn"
      query_table["end_id"]=lastend_id
      printLog("infoDebug",last_type,lastpage)
      printLog("infoDebug",gacha_table_old[last_type],lastpage)
      printLog("infoDebug",gacha_table_old[last_type].name,lastpage)
      info.Text="正在获取 "..gacha_table_old[last_type].name.." 第"..tostring(tointeger(lastpage+1)).."页"
     else
      query_table["gacha_type"]=nextType(last_type)
      query_table["page"]="1"
      query_table["lang"]="zh-cn"
      query_table["end_id"]="0"
      nt=false
      if nextType(last_type)==false
        printLog("nextURL","完成")
        info.Text="获取完成"
        --printLog("OK",gacha_table_old,gacha_table)

        btn6.onClick = function()
          local fileName = "抽卡记录导出_" .. os.date("%Y-%m-%d_%H-%M-%S") .. "_UIGF.json"
          创建文件(新内置存储文件(fileName))
          写入文件(新内置存储文件(fileName), JSON.encode(gacha_table))
          提示("保存成功：" .. 新内置存储文件(fileName))
        end

        控件隐藏(info)
        控件可见(btn1.getParent())
        --控件可见(btn2.getParent())
        控件可见(btn6.getParent())
        return true
       else
        info.Text="正在获取 "..gacha_table_old[nextType(last_type)].name.." 第1页"
      end
    end

    url_query=mergeSplit(query_table)
    url=url_root.."?"..url_query
    --printLog("Merge URL",url)
    call(gt,"getGachaLog",url)
  end

  last_type="0"
  lastpage=0
  lastend_id="0"
  nt=false

  function addLogs(tab,url)
    tab=JSON.decode(tab)
    if tab.retcode~=0
      if tab.message=="authkey timeout"
        info.Text="出错："..tab.message.." (链接已过期)"
       else
        info.Text="出错："..tab.message
      end
      printLog("addLogs","error",tab.message)
      taberror=true
      return true
    end
    if #tab.data.list>0
      for i,v in ipairs(tab.data.list)
        if v.gacha_type~=last_type
          last_type=v.gacha_type
          if v.gacha_type=="400"
            last_type="301"
          end
        end

        if v.gacha_type=="400"
          v.uigf_gacha_type="301"
          gacha_table.list[#gacha_table.list+1]=v
         else
          v.uigf_gacha_type=v.gacha_type
          gacha_table.list[#gacha_table.list+1]=v
        end

        gacha_table.info.uid=v.uid

      end
      if #tab.data.list==20
        lastpage=tab.data.page
        lastend_id=tab.data.list[20].id
        nt=false
       else
        --下一个
        nt=true
      end
     else
      --下一个
      nt=true
      local url_rootn=url:match("(.+)%?")
      local url_queryn=url:match("%?(.+)")
      local query_tablen=querySplit(url_queryn)

      last_type=query_tablen["gacha_type"]
    end
  end

  gt=thread(function(url)
    require "import"
    import "http"
    import "mods.json"

    function getGachaLog(url)
      Http.get(url,function(code,content)
        if stopthread
          return true
        end
        call("addLogs",content,url)
        Thread.sleep(300)

        call("nextURL",url)
      end)
    end

    getGachaLog(url)
  end,url)

end

控件隐藏(btn1.getParent())
控件隐藏(btn2.getParent())
控件隐藏(btn6.getParent())

波纹({TranslationClick}, "方黑")

mukactivity.setDataR("gacha_history", JSON.encode({}))
history = JSON.decode(mukactivity.getData("gacha_history"))

TranslationClick.onClick = function()
  if edit.Text:find(" ") then
    edit.Text = edit.Text:gsub(" ", "")
  end
  if edit.Text:find(" ") then
    edit.Text = edit.Text:gsub(" ", "")
  end
  if edit.Text=="" then
    提示("请填写抽卡记录链接")
    return true
  end
  transUrl(edit.Text)
  控件可见(info)
  控件隐藏(after)
  table.insert(history, 1, {os.date("%m月%d日 %H时%M分%S秒"), edit.Text})
  if history[11] then
    history[11] = nil
  end
  mukactivity.setData("gacha_history", JSON.encode(history))
end

TranslationClick.setOnTouchListener(
{
  onTouch = function(v, n)
    if tostring(n):find("ACTION_DOWN") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(4)})
      _animatorZ.setDuration(128)
      --设置动画时间
      _animatorZ.setInterpolator(DecelerateInterpolator())
      --设置动画插入器，减速
      _animatorZ.start()
     elseif tostring(n):find("ACTION_UP") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(2)})
      _animatorZ.setDuration(128)
      --设置动画时间
      _animatorZ.setInterpolator(AccelerateInterpolator())
      --设置动画插入器，减速
      _animatorZ.start()
    end
  end
}
)

--Glide.with(activity).load(activity.getLuaDir("res/exam/gacha1.jpg")).skipMemoryCache(true).into(img1)
--Glide.with(activity).load(activity.getLuaDir("res/exam/gacha2.jpg")).skipMemoryCache(true).into(img2)

function addUIDLogs(data)
  local filePath=新内置存储文件("GachaLogs/"..data.info.uid..".json")
  if not 文件是否存在(filePath) then
    创建文件(filePath)
    data.info={
      ["uid"] = data.info.uid,
      ["lang"] = "zh-cn",
      ["export_app"] = "MUKGenshinTool",
      ["export_app_version"] = tostring(应用版本),
      ["uigf_version"] = uigf_version
    }
    写入文件(filePath,JSON.encode(data))
   else
    local alldata=json.decode(读取文件(filePath))
    alldata.info={
      ["uid"] = data.info.uid,
      ["lang"] = "zh-cn",
      ["export_app"] = "MUKGenshinTool",
      ["export_app_version"] = tostring(应用版本),
      ["uigf_version"] = uigf_version
    }
    local alldatatext=json.encode(alldata.list)
    for i,v in ipairs(data.list)
      if alldatatext:find(v.id)
       else
        alldata.list[#alldata.list+1]=v
      end
    end
    写入文件(filePath,JSON.encode(alldata))
  end
end

btn1.onClick = function()
  if gacha_table.info.uid==nil
    or gacha_table.info.uid==""
    提示("获取UID失败，该账号可能无6个月内的抽卡记录")
    return true
  end
  if 文件是否存在(内置存储文件("gacha_export.tmp")) then
    删除文件(内置存储文件("gacha_export.tmp"))
  end
  创建文件(内置存储文件("gacha_export.tmp"))
  写入文件(内置存储文件("gacha_export.tmp"),JSON.encode(gacha_table))
  activity.newActivity("tools/gacha_export_result")
  addUIDLogs(gacha_table)
end
btn2.onClick = function()
  web.loadUrl(getBase64StringFromBlobUrl(returnUrl))
end

btn3.onClick = function()
  local bwz
  if 全局主题值 ~= "Night" then
    bwz = 0x3f000000
   else
    bwz = 0x3fffffff
  end

  local dann = {
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
        Text = "历史记录",
        Typeface = AppFont.特粗,
        textColor = primaryc
      },
      {
        GridView,
        layout_width = "-1",
        layout_height = "-1",
        layout_weight = "1",
        id = "gv",
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
          radius = "2dp",
          background = "#00000000",
          layout_marginTop = "8dp",
          layout_marginLeft = "8dp",
          layout_marginRight = "24dp",
          layout_marginBottom = "24dp",
          Elevation = "0",
          onClick = function()
            关闭对话框()
          end,
          {
            TextView,
            layout_width = "-1",
            layout_height = "-2",
            textSize = "16sp",
            Typeface = AppFont.特粗,
            paddingRight = "16dp",
            paddingLeft = "16dp",
            paddingTop = "8dp",
            paddingBottom = "8dp",
            Text = "关闭",
            textColor = stextc,
            BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
            ColorStateList(int[0].class {int {}}, int {bwz})
            )
          }
        }
      }
    }
  }

  dl = BottomDialog(activity)
  dl.setView(loadlayout(dann))
  dl.setGravity(Gravity.BOTTOM)
  dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
  dl.setMinHeight(0)
  dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
  --设置圆角
  dl.setRadius(dp2px(16), 转0x(backgroundc))
  dl.setCancelable(true)
  dl.setCanceledOnTouchOutside(true)
  an = dl.show()

  local tool_list_item2 = {
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
        Typeface = AppFont.标准,
        layout_width = "-1",
        layout_height = "-1",
        paddingLeft = "24dp"
      },
      {
        TextView,
        id = "tladp_activity",
        layout_width = "-1",
        layout_height = "-1",
        onClick = function(v)
          edit.requestFocus()
          edit.Text = v.Text
          关闭对话框()
        end,
        OnLongClickListener = function(vn)
          for i, v in ipairs(history) do
            if v[2] == vn.Text then
              table.remove(history, i)
              提示("已删除 " .. v[1])
              关闭对话框()
            end
          end
          mukactivity.setData("gacha_history", JSON.encode(history))
          return true
        end,
        textColor = "#00000000"
      }
    }
  }

  local tladp2
  tladp2 = LuaAdapter(activity, tool_list_item2)

  gv.setAdapter(tladp2)

  for i, v in ipairs(history) do
    tladp2.add {
      tladp_text = v[1],
      tladp_activity = {
        text = v[2],
        BackgroundDrawable = 波纹2("方自适应")
      }
    }
  end
end

function exec2(n, fun)
  ShellUtils.execCmdAsync(
  n,
  true,
  Consumer {
    accept = function(n)
      if fun then
        local result = n.result
        local successMsg = n.successMsg
        local errorMsg = n.errorMsg
        fun(result, successMsg, errorMsg)
      end
    end
  }
  )
end

exec2(
"",
function(r, s, e)
  if r == 0 then
    --提示("软件已经获取到Root")
    exec("logcat -c")
   else
    --提示("软件未获取到Root")
  end
end
)

btn4.onClick = function()
  exec2(
  "",
  function(r, s, e)
    if r == 0 then
      local log = exec("logcat -d -v long")
      log = log:gsub("%-+ beginning of[^\n]*\n", "")
      local has = false
      for v in log:gmatch("%](.-)%[") do
        if v:find("mihoyo") and v:find("log") and v:find("gacha") then
          edit.requestFocus()
          edit.Text = v:match("(https%://.-/log)")
          has = true
        end
        if v:find("hoyoverse") and v:find("log") and v:find("gacha") then
          edit.requestFocus()
          edit.Text = v:match("(https%://.-/log)")
          has = true
        end
      end
      if has == false then
        提示("未在日志中找到链接，请尝试反复进入抽卡历史记录界面后再试")
      end
     else
      提示("软件未获取到Root权限，无法使用该功能\n" .. e)
    end
  end
  )
end

import "files"

local fs=files.open(新内置存储文件(),'f')
:title('选择文件')
:filter('js','json','csv')
:on(function(file)
  xpcall(function()
    local content=读取文件(file)
    local content2=JSON.decode(content)
    if content2.info.uigf_version
      if not 文件是否存在(内置存储文件("gacha_export.tmp")) then
        创建文件(内置存储文件("gacha_export.tmp"))
      end
      写入文件(内置存储文件("gacha_export.tmp"),content)
      activity.newActivity("tools/gacha_export_result")
      addUIDLogs(content2)
     else
      提示("读取失败，文件内容可能有误（Android/data内的文件可能无法读取）")
    end
    end,function(e)
    提示("读取失败，文件内容可能有误（Android/data内的文件可能无法读取）\n"..e)
  end)
end)

btn5.onClick=function()
  fs:show()
end

if not 文件是否存在(新内置存储文件("GachaLogs"))
  创建文件夹(新内置存储文件("GachaLogs"))
end

function onDestroy()
  fs:close()
  if gt
    set(gt,"stopthread",true)
  end
end

function onKeyDown(code, event)
  if string.find(tostring(event), "KEYCODE_BACK") ~= nil then
    activity.finish()
  end
end

function onResult(act, file)
  if act == "tools/gecha_export_getlink" then
    edit.requestFocus()
    edit.text=file
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
