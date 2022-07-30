require "import"
import "mods.muk"

activity.Title="签到结果"

layout={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
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
    };

  };

  {
    ScrollView;
    layout_width="-1";
    layout_height="-1";
    {
      CardView;
      CardElevation="0dp";
      CardBackgroundColor=backgroundc;
      Radius=parentcardr;
      layout_width="-1";
      layout_height="-1";
      id="main_w",
      {
        LinearLayout;
        layout_height="-1";
        layout_width="-1";
        orientation="vertical";
        paddingBottom="16dp",
        id="main",
        {
          TextView,
          layout_width="-2",
          layout_height="-2",
          Text=mukactivity.getData("signresult"),
          TextColor=textc,
          padding="16dp",
          Typeface=AppFont.标准;
          textSize="14sp";
        },
      };
    },
  };
}

activity.setContentView(loadlayout(layout))

波纹({fh,_save,_more,_copy},"圆主题")

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

分屏()