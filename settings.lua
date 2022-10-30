require "import"
require "permission"
import "mods.muk"

activity.Title="软件设置"

function onCreate()
  layout={
    LinearLayout,
    layout_width="fill",
    orientation="vertical",
    background=backgroundc;
    {
      LinearLayout,
      layout_width="fill",
      layout_height="56dp",
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
          onClick=function()退出()end;
        };
      };
      {
        LinearLayout,
        layout_width="-1",
        layout_height="-1",
        gravity="center|left";
        orientation="vertical";
        paddingLeft="16dp";
        layout_weight="1",
        {
          TextView;
          text="软件设置";
          textColor=primaryc;
          Typeface=AppFont.特粗;
          textSize="20sp";
        };
      };
    };

    {
      ListView,
      id="listView",
      DividerHeight=0;
      layout_width="fill",
      layout_height="fill",
    }
  }

  setting={
    {--标题
      LinearLayout;
      Focusable=true;
      layout_width="fill";
      layout_height="wrap";
      {
        TextView;
        id="title";
        textSize="14sp";
        textColor=primaryc;
        Typeface=AppFont.特粗;
        layout_marginTop="16dp";
        layout_marginLeft="16dp";
        layout_marginBottom="4dp";
      };
    };

    {--设置项(标题,简介)
      LinearLayout;
      layout_width="fill";
      layout_height="-2";
      orientation="vertical";
      gravity="center|left";
      paddingTop="12dp",
      paddingBottom="12dp",
      {
        TextView;
        id="subtitle";
        textSize="16sp";
        textColor=textc;
        Typeface=AppFont.特粗;
        layout_marginLeft="16dp";
      };
      {
        TextView;
        id="message";
        layout_marginLeft="16dp";
        layout_marginRight="16dp";
        textSize="14sp";
        textColor=stextc;
      };
    };

    {--设置项(标题)
      LinearLayout;
      layout_width="fill";
      layout_height="-2";
      paddingTop="12dp",
      paddingBottom="12dp",
      gravity="center|left";
      {
        TextView;
        id="subtitle";
        textSize="16sp";
        layout_marginLeft="16dp";
        Typeface=AppFont.特粗;
        textColor=textc;
      };
    };

    {--设置项(标题,简介,开关)
      LinearLayout;
      gravity="center|left";
      layout_width="fill";
      layout_height="-2";
      paddingTop="12dp",
      paddingBottom="12dp",
      {
        LinearLayout;
        orientation="vertical";
        layout_height="-2";
        gravity="center|left";
        layout_weight="1";
        {
          TextView;
          layout_marginLeft="16dp";
          layout_marginRight="8dp";
          textSize="16sp";
          id="subtitle";
          textColor=textc;
          Typeface=AppFont.特粗;
        };
        {
          TextView;
          id="message";
          layout_marginLeft="16dp";
          layout_marginRight="8dp";
          textColor=stextc;
          textSize="14sp";
        };
      };
      {
        Switch;
        clickable=false;
        Focusable=false;
        layout_marginRight="16dp";
        id="status";
        thumbColor=primaryc;
        trackColor=primaryc;
      };
    };


    {--设置项(标题,开关)
      LinearLayout;
      layout_height="-2";
      paddingTop="12dp",
      paddingBottom="12dp",
      gravity="center|left";
      layout_width="fill";
      {
        TextView;
        id="subtitle";
        textSize="16sp";
        gravity="center_vertical";
        layout_weight="1";
        layout_height="fill";
        layout_marginLeft="16dp";
        layout_marginRight="8dp";
        Typeface=AppFont.特粗;
        textColor=textc;
      };
      {
        Switch;
        id="status";
        Focusable=false;
        clickable=false;
        layout_marginRight="16dp";
        thumbColor=primaryc;
        trackColor=primaryc;
      };
    };

    {--空16dp
      LinearLayout;
      layout_height="-2";
      layout_width="fill";
      {
        TextView;
        layout_height="16dp";
        layout_width="fill";
        onClick=function()end,
      };
    };

  };

  activity.setContentView(loadlayout(layout))

  波纹({back},"圆主题")

  图标注释(back,"返回")

  跟随系统夜间模式=mukactivity.getData("Setting_Auto_Night_Mode")
  夜间模式=mukactivity.getData("Setting_Night_Mode")
  自动检测更新=mukactivity.getData("Setting_Auto_Update")
  开发者模式=mukactivity.getData("Setting_Developer_Mode")
  诗词对话框动画=mukactivity.getData("Home_Poetry_Dialog_Animation")
  内置浏览器上传文件类型改为全部=mukactivity.getData("Web_Upload_All_Types_File")
  主页显示天气=mukactivity.getData("Home_Weather")
  垫高导航栏=mukactivity.getData("Navigation_Bar_Height")
  实时便笺通知栏常驻=mukactivity.getData("Note_Notification")
  实时便笺通知不可清除=mukactivity.getData("Note_Notification_Ongoing")
  自动签到=mukactivity.getData("Note_Auto_Sign")
  进入软件时自动签到=mukactivity.getData("Note_Auto_Sign2")
  更深的夜间模式背景=mukactivity.getData("Setting_Deeper_Night_Mode")
  实时便笺通知信息简化=mukactivity.getData("Note_Notification_Simple")

  data={}
  adp=LuaMultiAdapter(activity,data,setting)
  --[[adp.add{__type=4,subtitle="自动检测更新",message="软件启动时自动检测新版本",status={
      Checked=Boolean.valueOf(自动检测更新);
    }}]]

  adp.add{__type=1,title="功能"}
  adp.add{__type=4,subtitle="实时便笺通知栏常驻",message="开启此项即开启 实时便笺 功能的通知栏常驻，同时也会开启树脂提醒功能。",status={Checked=Boolean.valueOf(实时便笺通知栏常驻)}}
  adp.add{__type=4,subtitle="实时便笺通知信息简化",message="如果觉得实时便笺通知信息过于繁杂的话或许可以简化一下。",status={Checked=Boolean.valueOf(实时便笺通知信息简化)}}
  adp.add{__type=4,subtitle="进入软件时自动签到",message="“实时便笺通知栏常驻”启用时该项才会生效。进入软件时自动签到。",status={Checked=Boolean.valueOf(进入软件时自动签到)}}
  adp.add{__type=4,subtitle="自动签到",message="“实时便笺通知栏常驻”启用时该项才会生效。自动签到时间：8:00~22:00，每到整点自动签到。",status={Checked=Boolean.valueOf(自动签到)}}
  adp.add{__type=2,subtitle="实时便笺刷新时间",message="每隔多少分钟刷新一次实时便笺"}
  adp.add{__type=2,subtitle="关闭对该应用的电池优化",message="“实时便笺”及“自动签到”需要应用在后台运行，点击进入电池优化界面，选择无限制，并且在多任务界面锁定本软件。"}
  adp.add{__type=2,subtitle="悬浮浏览器主页",message="设置悬浮浏览器的默认加载页面"}
  adp.add{__type=1,title="界面"}
  adp.add{__type=4,subtitle="跟随系统夜间模式",message="若开启此项不跟随系统夜间模式，则您的系统不支持原生夜间模式API",status={Checked=Boolean.valueOf(跟随系统夜间模式)}}
  adp.add{__type=4,subtitle="夜间模式",message="“跟随系统夜间模式”启用时该项不生效",status={Checked=Boolean.valueOf(夜间模式) }}
  adp.add{__type=4,subtitle="更深的夜间模式背景",message="为夜间模式更换更深的背景色",status={Checked=Boolean.valueOf(更深的夜间模式背景) }}
  adp.add{__type=2,subtitle="主题",message="夜间模式开启时主题不生效"}
  adp.add{__type=4,subtitle="主页垫高导航栏",message="部分系统开启全面屏手势之后仍然会给软件提供导航栏高度，主页就会出现导航栏位置空一片的情况，关闭此项以解决该问题",status={Checked=Boolean.valueOf(垫高导航栏) }}
  adp.add{__type=2,subtitle="校准屏幕大小",message="如果你的悬浮浏览器等功能的尺寸不正常，请退出小窗等状态、正常打开该页面并将屏幕竖置，点击此项来校准屏幕大小"}
  adp.add{__type=2,subtitle="重置引导界面",message="将会在下一次启动软件时重新显示引导界面"}
  adp.add{__type=1,title="本地化"}
  adp.add{__type=2,subtitle="语言/語言/Language(暂未开放)",message="简体中文/繁體中文/English"}
  --adp.add{__type=1,title="实验性（以下项目若不清楚是什么就不要更改）"}
  --adp.add{__type=4,subtitle="实时便笺通知不可清除",message="开启此项之后，通知栏的实时便笺通知将不可被清除",status={Checked=Boolean.valueOf(实时便笺通知不可清除)}}

  --adp.add{__type=1,title="主页"}
  --adp.add{__type=2,subtitle="主页显示项目",message="设置主页项目是否显示及显示顺序"}
  --adp.add{__type=4,subtitle="主页显示天气",message="若此项开启则在主页收藏上方显示天气信息",status={Checked=Boolean.valueOf(主页显示天气)}}
  --adp.add{__type=4,subtitle="诗词对话框动画",message="若诗词对话框的动画掉帧，关闭此项以显示简化动画",status={Checked=Boolean.valueOf(诗词对话框动画)}}
  --adp.add{__type=1,title="内置浏览器"}
  --adp.add{__type=4,subtitle="上传文件类型改为全部",message="若上传文件时文件显示但无法选择文件，开启此项以选择全部类型文件",status={Checked=Boolean.valueOf(内置浏览器上传文件类型改为全部)}}
  adp.add{__type=1,title="开发者模式"}
  adp.add{__type=4,subtitle="开启开发者模式",message="便于调试代码（可能会拖慢性能）",status={Checked=Boolean.valueOf(开发者模式) }}
  --adp.add{__type=5,subtitle="页面加载时间显示",status={Checked=Boolean.valueOf(页面加载时间显示)}}
  --adp.add{__type=1,title="未开放功能"}
  --adp.add{__type=5,subtitle="自动备份开关",status={Checked=自动备份}}
  --adp.add{__type=2,subtitle="备份时间",message="设置多长时间执行一次自动备份"}
  --adp.add{__type=4,subtitle="退出时自动备份",message="",status={Checked=退出备份}}
  --adp.add{__type=2,subtitle="语言/Language",message="设置软件语言"}
  adp.add{__type=6,}
  listView.setAdapter(adp)

  --列表点击事件
  listView.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(id,v,zero,one)
      if v.Tag.subtitle.Text=="实时便笺刷新时间" then
        dann={
          LinearLayout;
          layout_width="-1";
          layout_height="-1";
          {
            LinearLayout;
            orientation="vertical";
            layout_width="-1";
            layout_height="-2";
            {
              TextView;
              layout_width="-1";
              layout_height="-2";
              textSize="20sp";
              layout_marginTop="24dp";
              layout_marginLeft="24dp";
              layout_marginRight="24dp";
              Text="实时便笺刷新时间";
              Typeface=AppFont.特粗;
              textColor=primaryc;
            };
            {
              MEditText
              {
                textSize="14sp",
                textColor=textc;
                HintTextColor=stextc;
                hint="输入时间（分钟，不建议超过8分钟）";
                layout_width="-1";
                layout_height="-2";
                text=tostring(mukactivity.getData("Note_Time"));
                id="ntime_edit",
                inputType="number",
              };
              layout_marginTop="8dp";
              layout_margin="24dp";
              layout_marginBottom="8dp";
            };
            {
              LinearLayout;
              orientation="horizontal";
              layout_width="-1";
              layout_height="-2";
              gravity="right|center";
              {
                CardView;
                layout_width="-2";
                layout_height="-2";
                radius="2dp";
                background="#00000000";
                layout_marginTop="8dp";
                layout_marginLeft="8dp";
                layout_marginBottom="24dp";
                Elevation="0";
                onClick=function()
                  关闭对话框()
                end;
                {
                  TextView;
                  layout_width="-1";
                  layout_height="-2";
                  textSize="16sp";
                  Typeface=AppFont.特粗;
                  paddingRight="16dp";
                  paddingLeft="16dp";
                  paddingTop="8dp";
                  paddingBottom="8dp";
                  Text="取消";
                  textColor=stextc;
                  BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                };
              };
              {
                CardView;
                layout_width="-2";
                layout_height="-2";
                radius="4dp";
                background=primaryc;
                layout_marginTop="8dp";
                layout_marginLeft="8dp";
                layout_marginRight="24dp";
                layout_marginBottom="24dp";
                Elevation="1dp";
                onClick=function()
                  if tostring(ntime_edit.Text)==nil then
                    提示("时间不能为空")
                    return true
                  end

                  mukactivity.setData("Note_Time",tointeger(ntime_edit.Text))
                  v.Tag.message.Text="当前 "..tostring(mukactivity.getData("Note_Time")).."分钟"
                  提示("设置成功，返回主页生效")
                  更改设置=true

                  关闭对话框()
                end;
                {
                  TextView;
                  layout_width="-1";
                  layout_height="-2";
                  textSize="16sp";
                  paddingRight="16dp";
                  paddingLeft="16dp";
                  Typeface=AppFont.特粗;
                  paddingTop="8dp";
                  paddingBottom="8dp";
                  Text="确定";
                  textColor=backgroundc;
                  BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                };
              };
            };
          };
        };

        dl=BottomDialog(activity)
        dl.setView(loadlayout(dann))
        dl.setGravity(Gravity.BOTTOM)
        dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
        dl.setMinHeight(0)
        dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
        --设置圆角
        dl.setRadius(dp2px(16),转0x(backgroundc))

        an=dl.show()
        dl.setCanceledOnTouchOutside(true);

        return true
      end
      if v.Tag.subtitle.Text=="重置引导界面" then
        提示("已重置")
        mukactivity.setData("guide_done",nil)
        return true
      end
      if v.Tag.subtitle.Text=="主题" then
        activity.newActivity("theme")
        return true
      end
      if v.Tag.subtitle.Text=="悬浮浏览器主页" then
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
              Text = "悬浮浏览器主页",
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
                  Text = "取消",
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

        suidadp.add {
          tladp_text = "米游社大地图",
          tladp_activity = {
            BackgroundDrawable = 波纹2("方自适应"),
            onClick = function(v)
              mukactivity.setData("Setting_FloatWeb_Home","mihoyo")
              提示("设置成功")
              关闭对话框(ansuid)
            end,
          }
        }
        suidadp.add {
          tladp_text = "光环全资源互动地图",
          tladp_activity = {
            BackgroundDrawable = 波纹2("方自适应"),
            onClick = function(v)
              mukactivity.setData("Setting_FloatWeb_Home","gh")
              提示("设置成功")
              关闭对话框(ansuid)
            end,
          }
        }
        suidadp.add {
          tladp_text = "自定义链接",
          tladp_activity = {
            BackgroundDrawable = 波纹2("方自适应"),
            onClick = function(v)
              关闭对话框(ansuid)

              dann={
                LinearLayout;
                layout_width="-1";
                layout_height="-1";
                {
                  LinearLayout;
                  orientation="vertical";
                  layout_width="-1";
                  layout_height="-2";
                  {
                    TextView;
                    layout_width="-1";
                    layout_height="-2";
                    textSize="20sp";
                    layout_marginTop="24dp";
                    layout_marginLeft="24dp";
                    layout_marginRight="24dp";
                    Text="自定义链接";
                    Typeface=AppFont.特粗;
                    textColor=primaryc;
                  };
                  {
                    MEditText
                    {
                      textSize="14sp",
                      textColor=textc;
                      HintTextColor=stextc;
                      hint="输入链接（包含http(s)://）";
                      layout_width="-1";
                      layout_height="-2";
                      text=tostring(mukactivity.getData("Setting_FloatWeb_Home"));
                      id="ntime_edit",
                      inputType="textUri",
                    };
                    layout_marginTop="8dp";
                    layout_margin="24dp";
                    layout_marginBottom="8dp";
                  };
                  {
                    LinearLayout;
                    orientation="horizontal";
                    layout_width="-1";
                    layout_height="-2";
                    gravity="right|center";
                    {
                      CardView;
                      layout_width="-2";
                      layout_height="-2";
                      radius="2dp";
                      background="#00000000";
                      layout_marginTop="8dp";
                      layout_marginLeft="8dp";
                      layout_marginBottom="24dp";
                      Elevation="0";
                      onClick=function()
                        关闭对话框()
                      end;
                      {
                        TextView;
                        layout_width="-1";
                        layout_height="-2";
                        textSize="16sp";
                        Typeface=AppFont.特粗;
                        paddingRight="16dp";
                        paddingLeft="16dp";
                        paddingTop="8dp";
                        paddingBottom="8dp";
                        Text="取消";
                        textColor=stextc;
                        BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                      };
                    };
                    {
                      CardView;
                      layout_width="-2";
                      layout_height="-2";
                      radius="4dp";
                      background=primaryc;
                      layout_marginTop="8dp";
                      layout_marginLeft="8dp";
                      layout_marginRight="24dp";
                      layout_marginBottom="24dp";
                      Elevation="1dp";
                      onClick=function()
                        if tostring(ntime_edit.Text)==nil then
                          提示("链接不能为空")
                          return true
                        end

                        mukactivity.setData("Setting_FloatWeb_Home",(ntime_edit.Text))
                        提示("设置成功")

                        关闭对话框()
                      end;
                      {
                        TextView;
                        layout_width="-1";
                        layout_height="-2";
                        textSize="16sp";
                        paddingRight="16dp";
                        paddingLeft="16dp";
                        Typeface=AppFont.特粗;
                        paddingTop="8dp";
                        paddingBottom="8dp";
                        Text="确定";
                        textColor=backgroundc;
                        BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                      };
                    };
                  };
                };
              };

              dl=BottomDialog(activity)
              dl.setView(loadlayout(dann))
              dl.setGravity(Gravity.BOTTOM)
              dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
              dl.setMinHeight(0)
              dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
              --设置圆角
              dl.setRadius(dp2px(16),转0x(backgroundc))

              an=dl.show()
              dl.setCanceledOnTouchOutside(true);
            end,
          }
        }

        suidgv.setAdapter(suidadp)
        return true
      end
      if v.Tag.subtitle.Text=="关闭对该应用的电池优化" then
        local powerManager=activity.getSystemService(Context.POWER_SERVICE)
        if powerManager.isIgnoringBatteryOptimizations(activity.getPackageName())==true then
          提示("电池优化已关闭")
         else
          local intentBattery = Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
          intentBattery.setData(Uri.parse("package:" .. activity.getPackageName()))
          activity.startActivity(intentBattery);
          提示("请选择 “无限制”")
        end
        return true
      end
      if v.Tag.subtitle.Text=="主页显示项目" then
        activity.newActivity("homeitem")
        return true
      end
      if v.Tag.subtitle.Text=="校准屏幕大小" then
        local outSize = Point()
        activity.getWindowManager().getDefaultDisplay().getRealSize(outSize)
        local dscreenX = outSize.x
        local dscreenY = outSize.y

        mukactivity.setData("dscreenX",dscreenX)
        mukactivity.setData("dscreenY",dscreenY)
        提示("已校准，屏幕大小: "..dscreenX.."x"..dscreenY)
        return true
      end
      if v.Tag.subtitle.Text=="语言/語言/Language" then

        local bwz
        if 全局主题值~="Night" then
          bwz=0x3f000000
         else
          bwz=0x3fffffff
        end

        local dann={
          LinearLayout;
          layout_width="-1";
          layout_height="-1";
          {
            LinearLayout;
            orientation="vertical";
            layout_width="-1";
            layout_height="-2";
            id="ztbj";
            {
              TextView;
              layout_width="-1";
              layout_height="-2";
              textSize="20sp";
              layout_marginTop="24dp";
              layout_marginLeft="24dp";
              layout_marginRight="24dp";
              Text="语言";
              Typeface=AppFont.特粗;
              textColor=primaryc;
            };
            {
              GridView;
              layout_width="-1";
              layout_height="-1";
              layout_weight="1",
              id="gv",
              paddingTop="8dp",
              paddingBottom="8dp",
            },
            {
              LinearLayout;
              orientation="horizontal";
              layout_width="-1";
              layout_height="-2";
              gravity="right|center";
              {
                CardView;
                layout_width="-2";
                layout_height="-2";
                radius="2dp";
                background="#00000000";
                layout_marginTop="8dp";
                layout_marginLeft="8dp";
                layout_marginRight="24dp";
                layout_marginBottom="24dp";
                Elevation="0";
                onClick=function()
                  关闭对话框()
                end;
                {
                  TextView;
                  layout_width="-1";
                  layout_height="-2";
                  textSize="16sp";
                  Typeface=AppFont.特粗;
                  paddingRight="16dp";
                  paddingLeft="16dp";
                  paddingTop="8dp";
                  paddingBottom="8dp";
                  Text="取消";
                  textColor=stextc;
                  BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
                };
              };
            },
          };
        };

        dl=BottomDialog(activity)
        dl.setView(loadlayout(dann))
        dl.setGravity(Gravity.BOTTOM)
        dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
        dl.setMinHeight(0)
        dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
        --设置圆角
        dl.setRadius(dp2px(16),转0x(backgroundc))
        dl.setCancelable(true)
        dl.setCanceledOnTouchOutside(true);
        an=dl.show()

        local tool_list_item2={
          LinearLayout;
          layout_width="-1";
          layout_height="48dp";
          onClick=function()end;
          {
            RelativeLayout;
            layout_width="-1";
            layout_height="-1";
            {
              TextView;
              id="tladp_text";
              textColor=textc;
              textSize="14sp";
              gravity="center|left";
              Typeface=AppFont.标准;
              layout_width="-1";
              layout_height="-1";
              paddingLeft="24dp",
            };
            {
              TextView;
              id="tladp_activity";
              layout_width="-1";
              layout_height="-1";
              onClick=function(v)
                --print(v.Text)
                mukactivity.setData("Language",v.Text)
                提示("返回主页生效")
                更改设置=true
                关闭对话框()
              end;
              textColor="#00000000";
            };
          };
        };

        local tladp2
        tladp2=LuaAdapter(activity,tool_list_item2)

        gv.setAdapter(tladp2)

        local lan={
          {"简体中文","Simplified_Chinese"},
          {"繁體中文","traditional_Chinese"},
          {"English","English"}
        }

        for i,v in ipairs(lan) do
          tladp2.add{
            tladp_text=v[1],
            tladp_activity={
              text=v[2],
              BackgroundDrawable=波纹2("方黑"),
            },
          }
        end

        return true
      end
      if v.Tag.status ~= nil then
        更改设置=true
        if v.Tag.status.Checked then
          data[one].status["Checked"]=false
         else
          data[one].status["Checked"]=true
        end
        if v.Tag.subtitle.Text=="夜间模式" then
          夜间模式=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="跟随系统夜间模式" then
          跟随系统夜间模式=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="自动检测更新" then
          自动检测更新=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="开启开发者模式" then
          开发者模式=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="诗词对话框动画" then
          诗词对话框动画=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="上传文件类型改为全部" then
          内置浏览器上传文件类型改为全部=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="主页显示天气" then
          主页显示天气=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="主页垫高导航栏" then
          垫高导航栏=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="实时便笺通知栏常驻" then
          实时便笺通知栏常驻=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="实时便笺通知不可清除" then
          实时便笺通知不可清除=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="实时便笺通知信息简化" then
          实时便笺通知信息简化=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="自动签到" then
          自动签到=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="进入软件时自动签到" then
          进入软件时自动签到=data[one].status["Checked"]
        end
        if v.Tag.subtitle.Text=="更深的夜间模式背景" then
          更深的夜间模式背景=data[one].status["Checked"]
        end
      end
      adp.notifyDataSetChanged()
    end
  })

  分屏()
end

function 退出()
  if 更改设置 then
    mukactivity.setData("Setting_Night_Mode",tostring(夜间模式))
    mukactivity.setData("Setting_Auto_Update",tostring(自动检测更新))
    mukactivity.setData("Setting_Auto_Night_Mode",tostring(跟随系统夜间模式))
    mukactivity.setData("Setting_Developer_Mode",tostring(开发者模式))
    mukactivity.setData("Home_Poetry_Dialog_Animation",tostring(诗词对话框动画))
    mukactivity.setData("Web_Upload_All_Types_File",tostring(内置浏览器上传文件类型改为全部))
    mukactivity.setData("Home_Weather",tostring(主页显示天气))
    mukactivity.setData("Navigation_Bar_Height",tostring(垫高导航栏))
    mukactivity.setData("Note_Notification",tostring(实时便笺通知栏常驻))
    mukactivity.setData("Note_Notification_Ongoing",tostring(实时便笺通知不可清除))
    mukactivity.setData("Note_Auto_Sign",tostring(自动签到))
    mukactivity.setData("Note_Auto_Sign2",tostring(进入软件时自动签到))
    mukactivity.setData("Setting_Deeper_Night_Mode",tostring(更深的夜间模式背景))
    mukactivity.setData("Note_Notification_Simple",tostring(实时便笺通知信息简化))
    activity.result({})
   else
    关闭页面()
  end
end

function onKeyDown(e)
  if e == 4 then
    退出()
    return true
  end
end

function onResult(name,...)
  if name=="theme" then
    更改设置=true
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
