require "import"
import "mods.muk"

activity.Title="关于"

function onCreate()
  local layout={
    RelativeLayout;
    layout_height="-1";
    layout_width="-1";
    background=backgroundc;
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      orientation="vertical";
      {
        LinearLayout;--标题栏
        orientation="horizontal";
        layout_height="56dp";
        id="mActionBar";
        layout_width="-1";
        background=barbackgroundc;
        gravity="center|left";
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
            onClick=function()activity.finishAfterTransition()end;
          };
        };
        {
          TextView;--标题
          Typeface=AppFont.特粗;
          textSize="20sp";
          Text="关于";
          textColor=primaryc;
          paddingLeft="16dp";
          id="title_a";
        };
        --[[{
          TextView;--标题
          Typeface=AppFont.特粗;
          textSize="20sp";
          Text="Gudove";
          textColor=primaryc;
          id="title_b";
          transitionName="title",
          layout_weight="1";
        };]]
      };
      {
        ScrollView;
        layout_height="-1";
        layout_width="-1";
        {
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=转0x(primaryc)-0xde000000;
            Radius="8dp";
            layout_width="-1";
            layout_margin="16dp";
            layout_marginTop="16dp";
            layout_marginBottom="8dp";
            layout_height="160dp";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              gravity="center";
              {
                ImageView;
                ColorFilter=viewshaderc;
                id="icon";
                layout_height="64dp";
                layout_width="64dp";
              };
              {
                TextView;
                textColor=textc;
                text="应急食品";
                textSize="18sp";
                layout_marginTop="8dp";
                id="title_b";
                transitionName="title",
                Typeface=AppFont.特粗;
              };
              {
                TextView;
                layout_height="-2";
                textSize="12sp";
                layout_width="-2";
                textColor=stextc;
                text="版本号：1.0.0";
                layout_marginTop="2dp";
                id="bbh";
                Typeface=AppFont.标准;
              };
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              id="item1";
            };
          };

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              {
                TextView;
                text="关于我";
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                padding="16dp";
                paddingBottom="8dp";
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                paddingTop="8dp",
                paddingBottom="8dp",
                {
                  CardView;
                  CardElevation="0dp";
                  CardBackgroundColor=cardbackc;
                  Radius="32dp";
                  layout_width="48dp";
                  layout_height="48dp";
                  layout_marginLeft="16dp";
                  {
                    ImageView;
                    src="res/muk.jpg";
                    layout_height="-1";
                    layout_width="-1";
                  };
                },
                {
                  LinearLayout;
                  orientation="vertical";
                  layout_height="-1";
                  layout_width="-1";
                  gravity="left|center",
                  paddingLeft="16dp";
                  {
                    TextView;
                    text="MUK";
                    textSize="16sp";
                    textColor=textc;
                    Typeface=AppFont.特粗;
                    paddingBottom="4dp";
                  };
                  {
                    TextView;
                    text="开发&设计";
                    textSize="14sp";
                    textColor=textc;
                    Typeface=AppFont.标准;
                  };
                },
              },
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item2";
                onClick=function()QQ("1773798610")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("perm_identity");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="QQ：MUK";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item14";
                onClick=function()浏览器打开("https://b23.tv/Ekeaaz")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("ondemand_video");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="哔哩哔哩：非酋MUK";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item15";
                onClick=function()浏览器打开("https://m.bbs.mihoyo.com/ys?channel=/#/accountCenter/0?id=183512966")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("comment");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="米游社：喵嗷呜汪qwq";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item17";
                onClick=function()复制文本("MUK#6023")提示("已复制 MUK#6023")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("comment");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="Discord：MUK#6023";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item18";
                onClick=function()浏览器打开("mailto:mukmiuikong2004@gmail.com")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("email");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="邮箱：mukmiuikong2004@gmail.com";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            },
          };

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              {
                TextView;
                text="开发相关";
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                padding="16dp";
                paddingBottom="8dp";
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item3";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_list_bulleted");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="捐赠名单";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item5";
                onClick=function()Snakebar("感谢大家对该软件的支持~")end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("group");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="其他小伙伴们";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item6";
                --[[onClick=function()
                  activity.newActivity("feedback")
                end;]]
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("chat_bubble");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="意见反馈";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item9";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_align_left");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="更新日志";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            };
          };
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              {
                TextView;
                text="支持我";
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                padding="16dp";
                paddingBottom="8dp";
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item4_1";
                onClick=function()
                  双按钮对话框("加群须知","应急食品所有群内均不接受晒卡晒圣遗物等行为，若无法接受请勿加群",
                  "行行行不晒","不能晒👴不加了",function()
                    QQ群("660566701")
                    关闭对话框()
                    end,function()
                    关闭对话框()
                  end)
                end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("group_add");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="加群一起玩（3群）";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item4";
                onClick=function()
                  activity.newActivity("group")
                end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("group_add");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="更多群聊";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item4_2";
                onClick=function()
                  浏览器打开("https://qun.qq.com/qqweb/qunpro/share?_wv=3&_wwv=128&inviteCode=X9EV6&from=246610&biz=ka")
                end;
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("group_add");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="加入QQ频道：应急食品官方频道";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              --[[{
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item12";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("star_half");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="给软件评分";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };]]
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item8";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("publish");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="检查更新";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item7";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("card_giftcard");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="捐赠给作者";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item13";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("share");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="分享本软件";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            };
          };
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="8dp";
            --layout_marginBottom="8dp";
            id="other",
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              {
                TextView;
                text="其他";
                textColor=primaryc;
                textSize="16sp";
                gravity="center|left";
                Typeface=AppFont.特粗;
                padding="16dp";
                paddingBottom="8dp";
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item10";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_list_bulleted");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="服务条款";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item11";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_list_bulleted");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="隐私政策";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item16";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_list_bulleted");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="权限说明";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item19";
                {
                  ImageView;
                  ColorFilter=textc;
                  src=图标("format_list_bulleted");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="开源许可";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            };
          };
          {
            TextView;
            text="Copyright © 2021 MUK. All rights reserved.";
            textColor=textc;
            textSize="10sp";
            id="_copyright";
            gravity="center";
            layout_width="-1";
            layout_height="32dp";
            Typeface=AppFont.标准;
            --alpha=0.4;
            paddingBottom="16dp";
          };

        };
      };
    };
  };

  activity.setContentView(loadlayout(layout))

  波纹({back},"圆主题")
  波纹({item1},"方主题")
  波纹({item2,item3,item4,item4_1,item4_2,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18,item19},"方自适应")

  --控件隐藏(item7)
  --控件隐藏(item8)
  --控件隐藏(item3)
  --控件隐藏(item6)
  --控件隐藏(item7)
  --控件隐藏(item9)
  --控件隐藏(other)
  --控件隐藏(item12)
  --控件隐藏(item13)


  Glide.with(activity)
  .load(activity.getLuaDir("icon.png"))
  --.skipMemoryCache(true)
  --.asBitmap()
  .into(icon)

  egg_time=0

  bbh.setText("版本号："..应用版本名)
  item1.onClick=function()
    if egg_time<1 then
      Snakebar("美好的事情 即将发生~")
    end
    egg_time=egg_time+1
  end

  item1.onLongClick=function()
    if egg_time>=5 then
      --activity.newActivity("egg")
      --[[local mediaPlayer = MediaPlayer()
      mediaPlayer.reset()
      mediaPlayer.setDataSource(activity.getLuaDir("res/dove1.mp3"))
      activity.setVolumeControlStream(AudioManager.STREAM_MUSIC)
      mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC)
      mediaPlayer.prepareAsync()
      mediaPlayer.setOnPreparedListener(MediaPlayer.OnPreparedListener{
        onPrepared=function(mediaPlayer)
          mediaPlayer.start()
      end})]]
      egg_time=0
    end
    return true
  end

  item3.onClick=function()
    activity.newActivity("web",{"https://note.mukapp.top/post/gtool_donate"})
  end

  item6.onClick=function()
    activity.newActivity("web",{"https://git.mukapp.top/mukmiuikong/MGenshinTool_Public"})
  end

  item7.onClick=function()
    activity.newActivity("web",{"https://pay.mukapp.top/"})
  end

  item8.onClick=function()
    Snakebar("正在检查更新…")
    检查更新(true)
  end

  item9.onClick=function()
    activity.newActivity("web",{"https://note.mukapp.top/post/gtool",
      [[
      title.setText("更新日志")
      控件隐藏(https)]],[[
      title.setText("更新日志")
      控件隐藏(https)]],[[
      title.setText("更新日志")
      控件隐藏(https)]]})
  end

  item10.onClick=function()
    activity.newActivity("web",{"https://note.mukapp.top/post/gtool_userspe"})
  end

  item11.onClick=function()
    activity.newActivity("web",{"https://note.mukapp.top/post/gtool_privacy"})
  end

  --[[item12.onClick=function()
    local viewIntent = Intent("android.intent.action.VIEW",Uri.parse("https://www.coolapk.com/apk/com.mukapp.genshintool"))
    activity.startActivity(viewIntent)
    提示("可以在酷安上给我评分敖~谢谢ʕ•̀ω•́ʔ✧")
  end]]

  item13.onClick=function()
    local intent=Intent(Intent.ACTION_SEND);
    intent.setType("text/plain");
    intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
    intent.putExtra(Intent.EXTRA_TEXT, "分享给你一个原神工具箱：\nhttps://gtool.mukapp.top/");
    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    activity.startActivity(Intent.createChooser(intent,"分享到:"));
  end

  item16.onClick=function()
    单按钮对话框("权限声明",[[应急食品的正常使用需要使用以下权限，我们承诺不会滥用任何权限。

 - 软件需要
   读取您共享存储空间中的内容：访问文件
   修改或删除您共享存储空间中的内容：保存文件
   查看网络连接：获取网络状态
   拥有完全的网络访问权限：访问网络
   直接下载文件而不显示通知：下载软件更新等
   请求安装文件包：安装软件更新
   安装快捷方式：动态添加及删除Shortcut
   显示在其他应用上方：悬浮浏览器
   计算应用存储空间
   运行前台服务：实时便笺及自动签到

 - 百度统计SDK需要：用来统计用户喜好（例如最常使用哪些本软件的功能）、用户数及获取软件崩溃日志等，以下权限均可禁止（主要是这些权限不加到清单的话百度就不给统计数据）
   在后台使用位置信息
   只有在前台运行时才能获取大致位置信息
   修改系统设置

以上是应急食品申请的全部权限。如果您对该说明有异议，请联系开发者。如果您不同意该权限声明，应急食品可能无法为您提供正常服务。]],"确定",function()关闭对话框()end)
  end

  item19.onClick=function()
    activity.newActivity("web",{"https://note.mukapp.top/post/gtool_license"})
  end

  分屏()
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
