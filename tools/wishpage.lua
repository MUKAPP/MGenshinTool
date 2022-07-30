require "import"
import "mods.muk"


local window = activity.getWindow();
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|
View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|
View.SYSTEM_UI_FLAG_HIDE_NAVIGATION|
View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)

xpcall(function()
  local lp = window.getAttributes();
  lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
  window.setAttributes(lp);
  lp=nil
end,
function(e)
end)
window=nil

activity.setRequestedOrientation(0)

wishtype=...

activity.Title="抽卡模拟器"

if (screenY/screenX)>(1920/1080) then
  screenp=状态栏高度
 else
  screenp=0
end

function onCreate()
  local layout={
    RelativeLayout;
    layout_height="-1";
    layout_width="-1";
    background=backgroundc;
    {
      ImageView;
      layout_height="-1";
      layout_width="-1",
      --paddingTop=-dp2px(56),
      --paddingBottom=-dp2px(56),
      id="backgroundimg",
    };

    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      orientation="vertical";
      paddingLeft=screenp,
      paddingRight=screenp,
      {
        LinearLayout;--标题栏
        orientation="horizontal";
        layout_height="32dp";
        id="mActionBar";
        layout_width="-1";
        --background=barbackgroundc;
        gravity="center|left";
        layout_marginTop="8dp",
        paddingLeft="16dp",
        paddingRight="16dp",
        {
          LinearLayout;
          orientation="horizontal";
          layout_height="32dp";
          layout_width="32dp";
          gravity="center";
          {
            ImageView;
            --ColorFilter=primaryc;
            layout_height="32dp";
            layout_width="32dp";
            padding="2dp";
            id="back";
            onClick=function()activity.finishAfterTransition()end;
          };
        };
      };
      {
        LinearLayout;
        layout_height="-1";
        layout_width="-1";
        orientation="vertical";
        layout_weight="1",
        {
          RelativeLayout,
          layout_width="-1";
          layout_height="-1";
          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor="#eff8f4f3";
            Radius="8dp";
            layout_width="-1";
            layout_height="-1";
            layout_margin="10%h";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            id="charactercard",
            {
              TextView;
              textSize="20sp";
              textColor=stextc;
              Typeface=AppFont.标准;
              id="characterimgerr",
              layout_height="-1";
              layout_width="-1";
              gravity="right|center",
              layout_marginRight="48dp",
            },
            {
              ImageView;
              layout_height="-1";
              layout_width="-1",
              --paddingTop=-dp2px(56),
              --paddingBottom=-dp2px(56),
              id="character5simg",
              paddingTop="-16dp",
              paddingBottom="-16dp",
              layout_marginLeft="32dp",
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              --gravity="left|center";
              id="characterlay";
              onClick=function()
              end;
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-2";
                gravity="left|center";
                orientation="vertical";
                {
                  TextView;
                  text="角色UP池";
                  textSize="34sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="charactertext",
                  paddingTop="28dp",
                  paddingLeft="24dp",
                };
                {
                  TextView;
                  text="获取概率提升！";
                  textSize="18sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="characterinfo",
                  paddingTop="8dp",
                  paddingLeft="24dp",
                },
                {
                  TextView;
                  text=" ★ 每十次祈愿必出四星及以上物品 ";
                  textSize="12sp";
                  textColor="#ffffff";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="characterinfo2",
                  paddingTop="2dp",
                  paddingBottom="2dp",
                  paddingLeft="4dp",
                  paddingRight="4dp",
                  layout_marginTop="2dp",
                  layout_marginLeft="24dp",
                  background="#575757",
                },
                {
                  TextView;
                  text="活动限定五星角色仅在UP期间，通过对应\n祈愿获得。具体内容查看【详情】";
                  textSize="12sp";
                  textColor="#575757";
                  Typeface=AppFont.标准;
                  id="characterinfo3",
                  paddingTop="0dp",
                  paddingLeft="24dp",
                },
              };
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              gravity="center|bottom";
              paddingLeft="32dp",
              {
                RelativeLayout;
                layout_height="-2";
                layout_width="-2";
                {
                  RelativeLayout;
                  layout_height="-2";
                  layout_width="-2";
                  id="characternamep_p",
                  {
                    LinearLayout;
                    layout_height="-2";
                    layout_width="-2";
                    gravity="center";
                    orientation="vertical";
                    id="characternamep",
                    background="#7f000000",
                    {
                      TextView;
                      text="名称";
                      textSize="26sp";
                      textColor="#ffffff";
                      Typeface=AppFont.标准;
                      id="charactername",
                      paddingLeft="8dp",
                      paddingRight="8dp",
                      layout_height="-2";
                      layout_width="-2";
                    },
                    {
                      ImageView;
                      layout_height="-2";
                      layout_width="56dp",
                      id="character5star",
                      layout_marginBottom="4dp",
                      layout_marginLeft="6dp",
                      layout_marginRight="6dp",
                    },
                  },
                  {
                    TextView;
                    textSize="12sp";
                    Typeface=AppFont.标准;
                    id="charactertext2",
                    layout_height="-2";
                    layout_width="-2";
                    layout_below="characternamep",
                    layout_centerHrizontal="true",
                    layout_centerInParent="true",
                    layout_marginBottom="24dp",
                    background="#38425D",
                    textColor="#D3BC8E",
                    paddingLeft="8dp",
                    paddingRight="8dp",
                  },
                },
                {
                  TextView;
                  text="UP!";
                  textSize="12sp";
                  textColor="#FFF45B";
                  Typeface=AppFont.标准;
                  id="uptext",
                  layout_height="-2";
                  layout_width="-2";
                  layout_toRightOf="characternamep_p",
                  paddingLeft="4dp",
                },
              },
            },
          };

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor="#fff8f4f3";
            Radius="8dp";
            layout_width="-1";
            layout_height="-1";
            layout_margin="16dp";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            id="weaponcard",
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              gravity="right";
              paddingRight="20dp",
              PivotX=(activity.Width-dp2px(16*2));
              PivotY=(activity.Width-dp2px(16*2))/16*9/2;
              scaleX=1.6,
              scaleY=1.6,
              {
                RelativeLayout;
                layout_height="-1";
                layout_width="-2";
                {
                  ImageView;
                  layout_height="-1";
                  layout_width="-2",
                  --paddingTop=-dp2px(56),
                  --paddingBottom=-dp2px(56),
                  id="indefinite5simg",
                  src="res/wish/item/FiveBackground.png",
                },
                {
                  ImageView;
                  layout_height="-1";
                  layout_width="-2",
                  --paddingTop=-dp2px(56),
                  --paddingBottom=-dp2px(56),
                  id="weapon5simg1",
                  src="res/wish/item/FiveBackground.png",
                  padding=-2,
                  layout_centerInParent="true",
                },
              },
              {
                RelativeLayout;
                layout_height="-1";
                layout_width="-2";
                {
                  ImageView;
                  layout_height="-1";
                  layout_width="-2",
                  --paddingTop=-dp2px(56),
                  --paddingBottom=-dp2px(56),
                  id="weapon5sbg2",
                  src="res/wish/item/FiveBackground.png",
                };
                {
                  ImageView;
                  layout_height="-1";
                  layout_width="-2",
                  --paddingTop=-dp2px(56),
                  --paddingBottom=-dp2px(56),
                  id="weapon5simg2",
                  src="res/wish/item/FiveBackground.png",
                  padding=-2,
                  layout_centerInParent="true",
                };
              },
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              --gravity="left|center";
              id="weaponlay";
              onClick=function()
              end;
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-2";
                gravity="left|center";
                orientation="vertical";
                {
                  TextView;
                  text="武器UP池";
                  textSize="28sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="weapontext",
                  paddingTop="28dp",
                  paddingLeft="20dp",
                };
                {
                  TextView;
                  text="祈愿开启";
                  textSize="14sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="weaponinfo",
                  paddingTop="0dp",
                  paddingLeft="20dp",
                },
              };
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              gravity="left|bottom";
              paddingLeft="20dp",
              {
                RelativeLayout;
                layout_height="-2";
                layout_width="-2";
                {
                  LinearLayout;
                  layout_height="-2";
                  layout_width="-2";
                  gravity="left|center";
                  orientation="vertical";
                  id="weaponnamep",
                  background="#7f000000",
                  layout_marginBottom="24dp",
                  {
                    TextView;
                    text="名称";
                    textSize="24sp";
                    textColor="#ffffff";
                    Typeface=AppFont.标准;
                    id="weaponname",
                    paddingLeft="8dp",
                    paddingRight="8dp",
                    layout_height="-2";
                    layout_width="-2";
                  },
                  {
                    ImageView;
                    layout_height="-2";
                    layout_width="56dp",
                    id="weapon5star",
                    layout_marginBottom="4dp",
                    layout_marginLeft="6dp",
                    layout_marginRight="4dp",
                  },
                },
                {
                  TextView;
                  text="UP!";
                  textSize="12sp";
                  textColor="#FFF45B";
                  Typeface=AppFont.标准;
                  id="uptext2",
                  layout_height="-2";
                  layout_width="-2";
                  layout_toRightOf="weaponnamep",
                  paddingLeft="4dp",
                },
              },
            },
          };

          {
            CardView;
            CardElevation="0dp";
            CardBackgroundColor="#fff8f4f3";
            Radius="8dp";
            layout_width="-1";
            layout_height="-1";
            layout_margin="16dp";
            layout_marginTop="8dp";
            layout_marginBottom="8dp";
            id="indefinitecard",
            {
              ImageView;
              layout_height="-1";
              layout_width="-1",
              --paddingTop=-dp2px(56),
              --paddingBottom=-dp2px(56),
              id="indefinite5simg",
              layout_marginLeft="56dp",
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              --gravity="left|center";
              id="indefinitelay";
              onClick=function()
              end;
              {
                LinearLayout;
                layout_height="-2";
                layout_width="-2";
                gravity="left|center";
                orientation="vertical";
                {
                  TextView;
                  text="常驻池";
                  textSize="28sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="indefinitetext",
                  paddingTop="28dp",
                  paddingLeft="20dp",
                };
                {
                  TextView;
                  text="祈愿开启";
                  textSize="14sp";
                  textColor="#575757";
                  paddingLeft="8dp";
                  Typeface=AppFont.标准;
                  id="indefiniteinfo",
                  paddingTop="0dp",
                  paddingLeft="20dp",
                },
              };
            };
            {
              LinearLayout;
              layout_height="-1";
              layout_width="-1";
              gravity="left|bottom";
              paddingLeft="20dp",
              {
                RelativeLayout;
                layout_height="-2";
                layout_width="-2";
                {
                  LinearLayout;
                  layout_height="-2";
                  layout_width="-2";
                  gravity="left|center";
                  orientation="vertical";
                  id="indefinitenamep",
                  background="#7f000000",
                  layout_marginBottom="24dp",
                  {
                    TextView;
                    text="名称";
                    textSize="24sp";
                    textColor="#ffffff";
                    Typeface=AppFont.标准;
                    id="indefinitename",
                    paddingLeft="8dp",
                    paddingRight="8dp",
                    layout_height="-2";
                    layout_width="-2";
                  },
                  {
                    ImageView;
                    layout_height="-2";
                    layout_width="56dp",
                    id="indefinite5star",
                    layout_marginBottom="4dp",
                    layout_marginLeft="6dp",
                    layout_marginRight="4dp",
                  },
                },
              },
            },
          };

        },

      };
      {
        LinearLayout;--标题栏
        orientation="horizontal";
        layout_height="-2";
        layout_width="-1";
        --background=barbackgroundc;
        gravity="top|left";
        {
          CardView;
          layout_width="98dp";
          layout_height="24dp";
          radius="12dp";
          background="#ffe3e1d5";
          Elevation="2dp";
          onClick=function(v)
          end,
          layout_marginLeft="16dp",
          layout_marginBottom="8dp",
          {
            TextView;
            layout_width="-1";
            layout_height="-1";
            textSize="12sp";
            Typeface=AppFont.粗体;
            paddingRight="0";
            paddingLeft="0";
            paddingTop="0";
            paddingBottom="0";
            Text="详情";
            textColor="#575757";
            gravity="center",
            BackgroundDrawable=波纹2("方自适应"),
            id="info",
          };
        },
        {
          CardView;
          layout_width="98dp";
          layout_height="24dp";
          radius="12dp";
          background="#ffe3e1d5";
          Elevation="2dp";
          onClick=function(v)
          end,
          layout_marginLeft="8dp",
          layout_marginBottom="8dp",
          {
            TextView;
            layout_width="-1";
            layout_height="-1";
            textSize="12sp";
            Typeface=AppFont.粗体;
            paddingRight="0";
            paddingLeft="0";
            paddingTop="0";
            paddingBottom="0";
            Text="历史记录";
            textColor="#575757";
            gravity="center",
            BackgroundDrawable=波纹2("方自适应"),
            id="history",
          };
        },
      };
    };
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      orientation="vertical";
      paddingLeft=screenp,
      paddingRight=screenp,
      gravity="bottom|right",
      {
        RelativeLayout;
        layout_height=dp2px(48);
        layout_width=dp2px(48/88*355);
        layout_marginRight="16dp",
        layout_marginBottom="8dp",
        {
          ImageView;
          layout_height="-1";
          layout_width="-1",
          --paddingTop=-dp2px(56),
          --paddingBottom=-dp2px(56),
          id="towishimg",
        };
        {
          TextView;
          layout_width="-1";
          layout_height="-1";
          textSize="12sp";
          Typeface=AppFont.粗体;
          paddingRight="0";
          paddingLeft="0";
          paddingTop="0";
          paddingBottom="0";
          Text="祈愿十次";
          textColor="#575757";
          gravity="center",
          BackgroundDrawable=波纹2("方自适应"),
          id="towish",
        };
      },
    },
  };

  activity.setContentView(loadlayout(layout))

  波纹({back},"圆主题")
  波纹({weaponlay,characterlay,indefinitelay},"方自适应")

  Mihoyo_API = {
    FETCH_ROLE_ID = "https://api-takumi.mihoyo.com/game_record/card/wapi/getGameRecordCard",
    FETCH_ROLE_INDEX = "https://api-takumi.mihoyo.com/game_record/genshin/api/index",
    FETCH_ROLE_CHARACTERS = "https://api-takumi.mihoyo.com/game_record/genshin/api/character",
    FETCH_GACHA_LIST = "https://webstatic.mihoyo.com/hk4e/gacha_info/cn_gf01/gacha/list.json",
    FETCH_GACHA_DETAIL = "https://webstatic.mihoyo.com/hk4e/gacha_info/cn_gf01/$/zh-cn.json",
    FETCH_ARTIFACT = "http://adachi-bot.oss-cn-beijing.aliyuncs.com/Version2/artifact/artifact.yml",
    FETCH_SLIP = "https://adachi-bot.oss-cn-beijing.aliyuncs.com/Version2/slip/index.yml",
    FETCH_WISH_CONFIG = "https://adachi-bot.oss-cn-beijing.aliyuncs.com/Version2/wish/config/$.json",
    FETCH_INFO = "http://adachi-bot.oss-cn-beijing.aliyuncs.com/Version2/info/docs/$.json",
  }

  function getWishDetail(wishID,ret)
    local wishLinkWithID=Mihoyo_API.FETCH_GACHA_DETAIL:gsub("%$",wishID)
    Http.get(wishLinkWithID,
    function(code,content)
      if code==200 then
        local content=json.decode(content)
        ret(code,content)
       else
        ret(code,content)
      end
    end)
  end

  function updateWish(ret)
    local wishData
    local indefinite
    local character
    local weapon
    Http.get(Mihoyo_API.FETCH_GACHA_LIST,
    function(code,content)
      if code==200 then
        local content=json.decode(content)
        wishData=content.data.list
        for i,v in ipairs(wishData) do
          if v.gacha_name=="常驻" then
            indefinite=v.gacha_id
          end
          if v.gacha_name=="角色" then
            character=v.gacha_id
          end
          if v.gacha_name=="武器" then
            weapon=v.gacha_id
          end
        end
        ret(code,indefinite,character,weapon)
       else
        ret(code,indefinite,character,weapon)
      end
    end)
  end

  function WishURL(n)
    if n then
      return "https://pan.mukapp.top/wish/"..n
     else
      return "https://pan.mukapp.top/wish/"
    end
  end

  function WishDir(n)
    if n then
      return tostring(activity.getExternalFilesDir("Wish")).."/"..n
     else
      return tostring(activity.getExternalFilesDir("Wish"))
    end
  end

  function getMainImage(type,name)
    local type=type
    if type=="武器" then
      type="weapon"
     else
      type="character"
    end
    return "https://adachi-bot.oss-cn-beijing.aliyuncs.com/Version2/wish/"..type.."/"..name..".png"
  end

  function setData()
    updateWish(function(code,indefinite,character,weapon)
      if code~=200 then
        提示("获取数据失败：2")
        activity.finish()
        return true
      end

      getWishDetail(character,function(code,content)
        if code~=200 then
          提示("获取数据失败：3")
          activity.finish()
          return true
        end
        --print(dump(content))
        local text=content.title:gsub("#"..content.title:match("#(.-)>"),"\"#"..content.title:match("#(.-)>"):sub(1,6).."\"")
        local text=text:gsub("</color>","</font>")
        local text=text:gsub("color","font color")

        local text=text:match("「(.-)」")
        charactertext.text=Html.fromHtml(text)
        charactertext.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        characterinfo.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        characterinfo2.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        characterinfo3.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        charactertext.setShadowLayer(4, 0, 0, 0xfff7f6f4)
        characterinfo.setShadowLayer(4, 0, 0, 0xfff7f6f4)
        characterinfo3.setShadowLayer(4, 0, 0, 0xfff7f6f4)
        characterinfo2.setBackgroundDrawable(ColorDrawable(转0x(text:match("\"(.-)\""))-0x20000000))

        charactername.text=content.r5_prob_list[1].item_name
        charactername.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        uptext.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        uptext.setShadowLayer(4, 0, 0, 0xffCD8634)

        Glide.with(activity)
        .load(WishDir("splash/"..content.r5_prob_list[1].item_name..".png"))
        .skipMemoryCache(true)
        --.centerCrop()
        .into(character5simg)

        if not 文件是否存在(WishDir("splash/"..content.r5_prob_list[1].item_name..".png")) then
          characterimgerr.Text="立绘加载失败"
          characterimgerr.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        end

        Glide.with(activity)
        .load(activity.getLuaDir("res/wish/item/FiveStar.png"))
        .skipMemoryCache(true)
        .into(character5star)


        local infotext,element=(content.content:match("限定</color>5星角色<color=.->「(.-)·.-%((.-)%)」</color>"))

        charactertext2.text=infotext
        charactertext2.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))

      end)

      getWishDetail(weapon,function(code,content)
        if code~=200 then
          提示("获取数据失败：3")
          activity.finish()
          return true
        end
        --print(dump(content))
        local text=content.title:gsub("#"..content.title:match("#(.-)>"),"\"#"..content.title:match("#(.-)>"):sub(1,6).."\"")
        local text=text:gsub("</color>","</font>")
        local text=text:gsub("color","font color")

        local text=text:match("「(.-)」")
        weapontext.text=Html.fromHtml(text)
        weapontext.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        weaponinfo.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        weapontext.setShadowLayer(4, 0, 0, 0xfff7f6f4)
        weaponname.text=content.r5_prob_list[1].item_name.."\n"..content.r5_prob_list[2].item_name
        weaponname.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        uptext2.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        uptext2.setShadowLayer(4, 0, 0, 0xffCD8634)

        Glide.with(activity)
        .load(getMainImage("武器",content.r5_prob_list[1].item_name))
        .skipMemoryCache(true)
        .into(weapon5simg1)

        Glide.with(activity)
        .load(getMainImage("武器",content.r5_prob_list[2].item_name))
        .skipMemoryCache(true)
        .fitCenter()
        .into(weapon5simg2)

        Glide.with(activity)
        .load(activity.getLuaDir("res/wish/item/FiveStar.png"))
        .skipMemoryCache(true)
        .fitCenter()
        .into(weapon5star)

        Glide.with(activity)
        .load(activity.getLuaDir("res/wish/item/FiveBackground.png"))
        .skipMemoryCache(true)
        .fitCenter()
        --.into(weapon5sbg1)

        Glide.with(activity)
        .load(activity.getLuaDir("res/wish/item/FiveBackground.png"))
        .skipMemoryCache(true)
        .fitCenter()
        --.into(weapon5sbg2)

      end)

      getWishDetail(indefinite,function(code,content)
        if code~=200 then
          提示("获取数据失败：3")
          activity.finish()
          return true
        end
        --print(dump(content))
        local text=content.title:gsub("#"..content.title:match("#(.-)>"),"\"#"..content.title:match("#(.-)>"):sub(1,6).."\"")
        local text=text:gsub("</color>","</font>")
        local text=text:gsub("color","font color")

        local text=text:match("「(.-)」")
        indefinitetext.text=Html.fromHtml(text)
        indefinitetext.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        indefiniteinfo.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        indefinitetext.setShadowLayer(4, 0, 0, 0xfff7f6f4)
        indefinitename.text=content.r5_prob_list[1].item_name.." "..content.r5_prob_list[2].item_name.." "..content.r5_prob_list[3].item_name.." 等非限定角色及武器"
        indefinitename.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))

        Glide.with(activity)
        .load(WishDir("splash/"..content.r5_prob_list[1].item_name..".png"))
        .skipMemoryCache(true)
        .centerCrop()
        .into(indefinite5simg)

        Glide.with(activity)
        .load(activity.getLuaDir("res/wish/item/FiveStar.png"))
        .skipMemoryCache(true)
        .fitCenter()
        .into(indefinite5star)

      end)
    end)
  end

  setData()

  if wishtype=="character" then
    控件可见(charactercard)
    控件隐藏(weaponcard)
    控件隐藏(indefinitecard)
   elseif wishtype=="weapon" then
    控件隐藏(charactercard)
    控件可见(weaponcard)
    控件隐藏(indefinitecard)
   elseif wishtype=="indefinite" then
    控件隐藏(charactercard)
    控件隐藏(weaponcard)
    控件可见(indefinitecard)
  end

  Glide.with(activity)
  .load(WishDir("img/closing-button.png"))
  .skipMemoryCache(true)
  .centerCrop()
  .into(back)

  Glide.with(activity)
  .load(WishDir("img/background.png"))
  .skipMemoryCache(true)
  .centerCrop()
  .into(backgroundimg)

  Glide.with(activity)
  .load(WishDir("img/wish-button.png"))
  .skipMemoryCache(true)
  .centerCrop()
  .into(towishimg)

        info.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
        history.Typeface=Typeface.createFromFile(File(WishDir("font/HYWenHei-85W.ttf")))
end
