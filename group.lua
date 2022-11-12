require "import"
import "mods.muk"

activity.Title="更多群聊"

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
          Text="更多群聊";
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
            CardBackgroundColor="#21FF9800";
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="16dp";
            layout_marginBottom="0";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              paddingTop="8dp",
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                {
                  ImageView;
                  ColorFilter="#FF9100";
                  src=图标("warning");
                  layout_height="48dp";
                  layout_width="48dp";
                  layout_marginLeft="16dp";
                  padding="12dp";
                };
                {
                  TextView;
                  text="每位旅行者尽量加入一个群就可以了哦~\n每个都加一遍的话就真的塞不下了啊awa";
                  textSize="14sp";
                  textColor="#FF9100";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            },
          },
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor=cardbackc;
            Radius="8dp";
            layout_width="-1";
            layout_height="-2";
            layout_margin="16dp";
            layout_marginTop="16dp";
            layout_marginBottom="64dp";
            {
              LinearLayout;
              orientation="vertical";
              layout_height="-1";
              layout_width="-1";
              paddingBottom="8dp";
              paddingTop="8dp",
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-1";
                gravity="left|center";
                id="item7";
                onClick=function()
                  QQ群("273506148")
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
                  text="应急食品食用群6群";
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
                id="item6";
                onClick=function()
                  双按钮对话框("加群须知","应急食品所有群内均不接受晒卡晒圣遗物等行为，若无法接受请勿加群",
                  "行行行不晒","不能晒👴不加了",function()
                    QQ群("703434001")
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
                  text="应急食品食用群6群";
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
                id="item5";
                onClick=function()
                  QQ群("1011357138")
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
                  text="应急食品食用群5群";
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
                  QQ群("779355287")
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
                  text="应急食品食用群4群";
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
                id="item3";
                onClick=function()
                  QQ群("660566701")
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
                  text="应急食品食用群3群";
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
                id="item2";
                onClick=function()
                  QQ群("930823147")
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
                  text="应急食品食用群2群";
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
                id="item1";
                onClick=function()
                  QQ群("695705323")
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
                  text="应急食品食用群";
                  textSize="14sp";
                  textColor=textc;
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                };
              };
            };
          };

        };
      };
    };
  };

  activity.setContentView(loadlayout(layout))

  波纹({back},"圆主题")
  波纹({item1,item2,item3,item4,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13},"方自适应")

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
