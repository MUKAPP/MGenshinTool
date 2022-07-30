require "import"
import "android.widget.*"
import "android.view.*"
import "mods.muk"
loadstring([[mailn=import "mail"]])()

import "java.net.URLEncoder"

content=...

activity.Title="用户反馈"

layout={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
  Gravity="center|top",
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
        id="fh";
        onClick=function()关闭页面()end;
      };
    };
    {
      TextView;
      text=activity.Title;
      textColor=primaryc;
      textSize="20sp";
      id="_title";
      SingleLine=true;
      layout_width="-1",
      gravity="center|left";
      paddingLeft="16dp";
      layout_weight="1",
      Typeface=AppFont.特粗;
    };--[[
    {
      ImageView;
      layout_width="32dp";
      layout_height="32dp";
      layout_marginRight="12dp";
      padding="4dp";
      ColorFilter=primaryc;
      src=图标("more_vert");
      id="_more";
      onClick=function()
        --pop.showAsDropDown(_more_lay,dp2px(-8-192),dp2px(8))
        pop.showAsDropDown(_more_lay)
      end;
    };]]
    {
      TextView;
      id="_more_lay";
      layout_width="0",
      layout_height="0",
      layout_gravity="top";
    };
  };

  {
    ScrollView,
    layout_width="-1",
    layout_height="-1",
    {
      LinearLayout,
      orientation="vertical",
      layout_width="-1",
      layout_height="-1",
      {
        MEditText
        {
          textSize="14sp",
          id="edit",
          hint="反馈内容";
          textColor=textc;
          HintTextColor=stextc;
          --SingleLine=true;
          layout_width="-1";
          layout_height="-2";
          text=content;
        };
        layout_margin="16dp";
        layout_marginBottom="0";
      };
      {
        MEditText
        {
          textSize="14sp",
          id="edit2",
          hint="您的联系方式";
          textColor=textc;
          HintTextColor=stextc;
          SingleLine=true;
          layout_width="-1";
          layout_height="-2";
          --inputType="number";
        };
        layout_margin="16dp";
        layout_marginBottom="8dp";
      };

      {
        LinearLayout,
        orientation="vertical",
        layout_width="-1",
        layout_height="-2",
        Gravity="center",
        {
          CardView,
          layout_width="56dp",
          layout_height="56dp",
          radius="28dp",
          background=primaryc;
          elevation="0";
          layout_margin="8dp",
          translationZ="2dp";
          id="xf1";
          {
            ImageView,
            src=图标("send"),
            layout_width="56dp",
            layout_height="56dp",
            padding="16dp",
            id="TranslationClick",
            ColorFilter=backgroundc;
          },
          {
            ProgressBar,
            layout_width="56dp",
            layout_height="56dp",
            padding="14dp",
            id="progress",
            style="?android:attr/progressBarStyleLarge";
            onClick=function()end;
            background=primaryc;
          },
        },
      },
    }
  }
}

activity.setContentView(loadlayout(layout))

波纹({fh,_more},"圆主题")
波纹({TranslationClick},"方黑")

progress.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(转0x(backgroundc),PorterDuff.Mode.SRC_ATOP))
控件隐藏(progress)

TranslationClick.onClick=function()
  if edit.Text=="" or edit.Text==nil or #edit.Text==0 then
    提示("请填写完整")
    return true
  end
  if edit2.Text=="" or edit2.Text==nil or #edit2.Text==0 then
    提示("请填写完整")
    return true
  end
  title="用户反馈 应急食品 "..应用版本名
  texta=mailn.用户反馈
  local content=tostring(edit.Text):gsub("%%","%%%%")
  texta=texta:gsub("CONTENT!",content)
  texta=texta:gsub("QQ!",tostring(edit2.Text))
  texta=texta:gsub("INFO!","应急食品 "..应用版本名)
  texta=texta:gsub("\n",[[</span><br><span>]])
  who="mukmiuikong@foxmail.com"
  tokenn="Mliushui2004."
  token=MD5(title..texta..who..tokenn)

  data={["title"]=URLEncoder.encode(title),
    ["text"]=URLEncoder.encode(texta),
    ["who"]=URLEncoder.encode(who),
    ["token"]=token,
  }

  控件可见(progress)
  ViewAnimator.animate({progress})
  .alpha({0, 1})
  .duration(256)
  .onStop({
    onStop=function()
    end
  })
  .start()

  url="https://api.mukapp.top/mail/index.php"
  Http.post(url,data,function(code,content)
    if code==200 then
      if content:find("OK") then
        提示("发送成功，感谢您的支持~")
       else
        提示("发送失败:"..content:gsub("\n$",""))
      end
     else
      提示("请求数据失败，错误代码:"..code)
    end
    ViewAnimator.animate({progress})
    .alpha({1, 0})
    .duration(256)
    .onStop({
      onStop=function()
        控件隐藏(progress)
      end
    })
    .start()
  end)

end

TranslationClick.setOnTouchListener({
  onTouch=function(v,n)
    if tostring(n):find("ACTION_DOWN") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(4)})
      _animatorZ.setDuration(128)--设置动画时间
      _animatorZ.setInterpolator(DecelerateInterpolator())--设置动画插入器，减速
      _animatorZ.start()
     elseif tostring(n):find("ACTION_UP") then
      local _animatorZ = ObjectAnimator.ofFloat(xf1, "translationZ", {xf1.translationZ, dp2px(2)})
      _animatorZ.setDuration(128)--设置动画时间
      _animatorZ.setInterpolator(AccelerateInterpolator())--设置动画插入器，减速
      _animatorZ.start()
    end
end})
