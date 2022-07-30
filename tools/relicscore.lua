require "import"
import "mods.muk"

activity.Title="圣遗物评分"

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
    };
  };

  {
    RelativeLayout,
    layout_width="-1",
    layout_height="-1",

    {
      ScrollView,
      layout_width="-1",
      layout_height="-1",
      id="sv",
      {
        LinearLayout,
        orientation="vertical",
        layout_width="-1",
        layout_height="-1",
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
          layout_marginBottom="8dp";
          {
            LinearLayout,
            orientation="vertical",
            --layout_marginTop="20dp",
            layout_width="-1",
            layout_height="-1",
            {
              TextView;
              text="请严格按照下图裁剪图片之后上传（只保留图中内容）";
              textColor=primaryc;
              textSize="16sp";
              gravity="center|left";
              Typeface=AppFont.特粗;
              padding="16dp";
              paddingBottom="0dp";
            };
            {
              CardView;
              CardElevation="0dp";
              CardBackgroundColor=cardbackc;
              Radius="4dp";
              layout_width="-1";
              layout_height="48%w";
              layout_margin="16dp";
              layout_marginTop="8dp";
              id="imgw";
              {
                ImageView;
                id="img";
                scaleType="fitCenter";
                layout_width="-1";
                layout_height="-1";
                colorFilter=viewshaderc;
              };
              {
                LinearLayout,
                layout_width="-1";
                layout_height="-1";
                id="img_t",
                onClick=function()start()end,
              },
            };
          },
        },

        {
          ProgressBar,
          layout_width="64dp",
          layout_height="64dp",
          padding="8dp",
          id="progress",
          style="?android:attr/progressBarStyleLarge";
          onClick=function()end;
          layout_gravity="center",
        },


        {
          RelativeLayout,
          layout_width="-1",
          layout_height="-2",
          id="sok",
          {
            LinearLayout,
            layout_width="-1",
            layout_height=activity.Height-dp2px(56),
          },
          {
            LinearLayout,
            orientation="vertical",
            layout_width="-1",
            layout_height="-2",
            --[[{
          MEditText
          {
            textSize="14sp",
            id="edit",
            hint="请仔细检查圣遗物属性，不正确的请修改！";
            textColor=textc;
            HintTextColor=stextc;
            --SingleLine=true;
            text="圣遗物属性";
            layout_width="-1";
            layout_height="-2";
            --inputType="text";
          };
          layout_margin="16dp";
          layout_marginTop="8dp";
          layout_marginBottom="8dp";
        };]]

            {
              CardView;
              CardElevation="0dp";
              CardBackgroundColor="#21FF9800";
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
                    layout_marginLeft="8dp";
                    padding="12dp";
                  };
                  {
                    TextView;
                    text="由于软件用了百度通用文字识别来识别圣遗物，结果可能不准确，请自行修改错误内容";
                    textSize="14sp";
                    textColor="#FF9100";
                    paddingLeft="8dp";
                    paddingRight="8dp",
                    Typeface=AppFont.标准;
                  };
                };
              },
            },

            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="8dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nname";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="圣遗物名称",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="npos";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="圣遗物位置",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="2",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="ngrade";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="等级",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

            {
              CardView;
              CardElevation="0dp";
              CardBackgroundColor=cardbackc;
              Radius="8dp";
              layout_width="-1";
              layout_height="-2";
              layout_marginLeft="16dp",
              layout_marginRight="16dp",
              layout_marginTop="16dp",
              {
                TextView;
                textColor=stextc;
                textSize="14sp";
                gravity="center|left";
                SingleLine=true;
                layout_width="-1";
                layout_height="-2";
                id="nmethod";
                background="#00212121";
                padding="16dp";
                Text="普通C",
                --hintTextColor=stextc;
                Typeface=AppFont.标准;
              };
            };
            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  TextView;
                  textColor=stextc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nmain";
                  background="#00212121";
                  padding="16dp";
                  Text="主词条",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nmainVal";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="主词条值",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  TextView;
                  textColor=stextc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside1";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  Text="副词条1",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside1Val";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="副词条值",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  TextView;
                  textColor=stextc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside2";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  Text="副词条2",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside2Val";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="副词条值",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  TextView;
                  textColor=stextc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside3";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  Text="副词条3",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside3Val";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="副词条值",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

            {
              LinearLayout,
              layout_width="-1",
              layout_height="-2",
              Gravity="center",
              paddingLeft="16dp",
              paddingRight="16dp",
              paddingTop="16dp",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  TextView;
                  textColor=stextc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside4";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  Text="副词条4",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
              {
                TextView;
                layout_width="8dp";
                layout_height="-2";
              },
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="8dp";
                layout_width="-1";
                layout_height="-2";
                layout_weight="1",
                {
                  EditText;
                  textColor=textc;
                  textSize="14sp";
                  gravity="center|left";
                  SingleLine=true;
                  layout_width="-1";
                  layout_height="-2";
                  id="nside4Val";
                  background="#00212121";
                  padding="16dp";
                  --paddingTop="32dp";
                  hint="副词条值",
                  --hintTextColor=stextc;
                  Typeface=AppFont.标准;
                };
              };
            },

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
                layout_marginTop="16dp",
                layout_marginBottom="64dp",
                translationZ="2dp";
                id="xf1";
                {
                  ImageView,
                  src=图标("check"),
                  layout_width="56dp",
                  layout_height="56dp",
                  padding="16dp",
                  id="TranslationClick",
                  ColorFilter=backgroundc;
                },
              },
            },
          },
        },

      },
    },

  },

}

activity.setContentView(loadlayout(layout))

import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
progress.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(转0x(primaryc),PorterDuff.Mode.SRC_ATOP))
控件隐藏(progress)
--控件隐藏(sok)

transitioner = LayoutTransition()
sok.getParent().setLayoutTransition(transitioner)

function start()
  ChooseFile("image/*",function(path)

    bm=loadbitmap(path);
    pcall(function()
      import "android.media.ExifInterface"
      import "android.graphics.BitmapFactory"
      exif = ExifInterface(path)
      local orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, 1);
      matrix = Matrix();
      if (orientation == 6) then
        matrix.postRotate(90);
       elseif (orientation == 3) then
        matrix.postRotate(180);
       elseif (orientation == 8) then
        matrix.postRotate(270)
      end
      bm= Bitmap.createBitmap(bm, 0, 0, bm.getWidth(), bm.getHeight(), matrix, true);
      return bm;
    end)

    --bm=loadbitmap(path)
    img.setImageBitmap(bm)


    控件可见(progress)
    控件隐藏(sok)

    local bitmapBytes=ImageUtils.bitmap2Bytes(bm)
    local txt=EncodeUtils.base64Encode2String(bitmapBytes)

    local us_id="Xx0e4K9Lq2osOmsgdTUmXqXO" --你的id
    local key="MCF3sfhYw8cfGkDOpYMEw0yKA0dFUqV8" --key
    local url="https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id="..us_id.."&client_secret="..key
    Http.get(url,function(c,d)
      if c==200 then
        d=JSON.decode(d)
        if d.error_description then
          提示("识别失败-1："..d.error_description)
          edit.Text=""
          控件隐藏(progress)
          控件隐藏(sok)
         else

          local url="https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic?access_token="..d["access_token"]
          local data={image=txt}
          local header={["content-type"]="application/x-www-form-urlencoded"}
          Http.post(url, data,header, function(c,d)
            if c==200 then
              d=JSON.decode(d)
              if d.error_msg then
                提示("识别失败-3："..d.error_msg)
                edit.Text=""
                控件隐藏(progress)
                控件隐藏(sok)
               else
                提示("识别成功")
                local d=d["words_result"]
                local text=""
                for i,v in ipairs(d) do
                  if text=="" then
                    text=v.words
                   else
                    text=text.."\n"..v.words
                  end
                end
                --print(text)
                text=text:gsub("\n+$",""):gsub("食+","")
                text=text:gsub("★",""):gsub("☆",""):gsub("●",""):gsub("%(",""):gsub("%)","")
                :gsub("•",""):gsub("·",""):gsub("°","%%")
                :gsub("：",""):gsub("%:",""):gsub("±","+")
                :gsub("l","1")
                --edit.setText(text)

                go(text)
                控件隐藏(progress)
                控件可见(sok)
                ti=Ticker()
                ti.Period=328
                ti.onTick=function()
                  pcall(function()
                    ti.stop()
                  end)
                  ti=nil
                  sv.post( Runnable {
                    run=function()
                      sv.fullScroll(View.FOCUS_DOWN);
                    end
                  });
                end
                ti.start()


              end
             else
              提示("识别失败-2："..d)
              edit.Text=""
              控件隐藏(progress)
              控件隐藏(sok)
            end

          end)
        end
       else
        提示("识别失败-4："..d)
        edit.Text=""
        控件隐藏(progress)
        控件隐藏(sok)
      end
      --print(dump(d))
      --primary()
      --error_description

    end)


  end)
end

波纹({fh,copy,trans,activitycopy},"圆主题")
波纹({img_t,nmain,nside1,nside2,nside3,nside4,nmethod},"方自适应")
波纹({TranslationClick},"方黑")

TranslationClick.onClick=function()
  local ntab={
    ["name"]=nname.Text,
    ["main"]={nmain.Text,nmainVal.Text},
    ["grade"]=ngrade.Text,
    ["mainPos"]=npos.Text,
    table={},
    ["method"]=nmethod.Text,
  }

  if nside1.Text~=""
    and nside1Val.Text~="" then
    ntab.table[#ntab.table+1]={nside1.Text,nside1Val.Text}
  end
  if nside2.Text~=""
    and nside2Val.Text~="" then
    ntab.table[#ntab.table+1]={nside2.Text,nside2Val.Text}
  end
  if nside3.Text~=""
    and nside3Val.Text~="" then
    ntab.table[#ntab.table+1]={nside3.Text,nside3Val.Text}
  end
  if nside4.Text~=""
    and nside4Val.Text~="" then
    ntab.table[#ntab.table+1]={nside4.Text,nside4Val.Text}
  end

  activity.newActivity("tools/relicscore_result",{ntab})
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

Glide.with(activity)
.load(activity.getLuaDir("res/exam/myGod.jpg"))
.skipMemoryCache(true)
.into(img)

entry_main={
  "防御力",
  "生命值",
  "攻击力",
  "元素充能效率",
  "元素精通",
  "暴击率",
  "暴击伤害",
  "治疗加成",
  "火元素伤害加成",
  "水元素伤害加成",
  "风元素伤害加成",
  "雷元素伤害加成",
  "岩元素伤害加成",
  "冰元素伤害加成",
  "物理伤害加成",
  "草元素伤害加成",
}

entry_side={
  "防御力",
  "生命值",
  "攻击力",
  "元素充能效率",
  "元素精通",
  "暴击率",
  "暴击伤害",
}

methods={
  "普通C",
  "胡桃",
  "防御C",
  "雷电将军",
}

function go(entry)

  mainPos=""
  if entry:find("生之花") then
    mainPos="生之花"
   elseif entry:find("死之羽") then
    mainPos="死之羽"
   elseif entry:find("时之沙") then
    mainPos="时之沙"
   elseif entry:find("空之杯") then
    mainPos="空之杯"
   elseif entry:find("理之冠") then
    mainPos="理之冠"
  end

  name=""
  main=""
  mainVal=""

  entry=entry:gsub(" ","")
  entry=entry:gsub("\n","\n")
  entry=entry:gsub("\n","\n\n"):gsub(",",""):gsub("，","")
  entry="\n"..entry.."\n"
  --[[entry=entry:gsub("生之花",""):gsub("死之羽","")
:gsub("时之沙",""):gsub("空之杯",""):gsub("理之冠","")]]

  tab={}

  relic_all={
    {
      ["chs"]="角斗士的终幕礼",
      ["eng"]="gladiatorFinale",
      {"角斗士的酣醉","cup"},
      {"角斗士的归宿","feather"},
      {"角斗士的留恋","flower"},
      {"角斗士的凯旋","head"},
      {"角斗士的希冀","sand"},
    },
    {
      ["chs"]="千岩牢固",
      ["eng"]="tenacityOfTheMillelith",
      {"盟誓金爵","cup"},
      {"昭武翎羽","feather"},
      {"勋绩之花","flower"},
      {"将帅兜鍪","head"},
      {"金铜时晷","sand"},
    },
    {
      ["chs"]="祭雷之人",
      ["eng"]="prayersForWisdom",
      {"","cup"},
      {"","feather"},
      {"","flower"},
      {"祭雷礼冠","head"},
      {"","sand"},
    },
    {
      ["chs"]="流浪大地的乐团",
      ["eng"]="wandererTroupe",
      {"吟游者之壶","cup"},
      {"琴师的箭羽","feather"},
      {"乐团的晨光","flower"},
      {"指挥的礼帽","head"},
      {"终幕的时计","sand"},
    },
    {
      ["chs"]="武人",
      ["eng"]="martialArtist",
      {"武人的酒杯","cup"},
      {"武人的羽饰","feather"},
      {"武人的红花","flower"},
      {"武人的头巾","head"},
      {"武人的水漏","sand"},
    },
    {
      ["chs"]="赌徒",
      ["eng"]="gambler",
      {"赌徒的骰蛊","cup"},
      {"赌徒的羽饰","feather"},
      {"赌徒的胸花","flower"},
      {"赌徒的耳环","head"},
      {"赌徒的怀表","sand"},
    },
    {
      ["chs"]="祭水之人",
      ["eng"]="prayersForDestiny",
      {"","cup"},
      {"","feather"},
      {"","flower"},
      {"祭水礼冠","head"},
      {"","sand"},
    },
    {
      ["chs"]="昔日宗室之仪",
      ["eng"]="noblesseOblige",
      {"宗室银瓮","cup"},
      {"宗室之翎","feather"},
      {"宗室之花","flower"},
      {"宗室面具","head"},
      {"宗室时计","sand"},
    },
    {
      ["chs"]="祭冰之人",
      ["eng"]="prayersToSpringtime",
      {"","cup"},
      {"","feather"},
      {"","flower"},
      {"祭冰礼冠","head"},
      {"","sand"},
    },
    {
      ["chs"]="幸运儿",
      ["eng"]="luckyDog",
      {"幸运儿之杯","cup"},
      {"幸运儿鹰羽","feather"},
      {"幸运儿绿花","flower"},
      {"幸运儿银冠","head"},
      {"幸运儿沙漏","sand"},
    },
    {
      ["chs"]="渡过烈火的贤人",
      ["eng"]="lavaWalker",
      {"渡火者的醒悟","cup"},
      {"渡火者的解脱","feather"},
      {"渡火者的决绝","flower"},
      {"渡火者的智慧","head"},
      {"渡火者的煎熬","sand"},
    },
    {
      ["chs"]="苍白之火",
      ["eng"]="paleFlame",
      {"超越之盏","cup"},
      {"贤医之羽","feather"},
      {"无垢之花","flower"},
      {"嗤笑之面","head"},
      {"停摆之刻","sand"},
    },
    {
      ["chs"]="染血的骑士道",
      ["eng"]="bloodstainedChivalry",
      {"染血骑士之杯","cup"},
      {"染血的黑之羽","feather"},
      {"染血的铁之心","flower"},
      {"染血的铁假面","head"},
      {"骑士染血之时","sand"},
    },
    {
      ["chs"]="炽烈的炎之魔女",
      ["eng"]="crimsonWitch",
      {"魔女的心之火","cup"},
      {"魔女常燃之羽","feather"},
      {"魔女的炎之花","flower"},
      {"焦灼的魔女帽","head"},
      {"魔女破灭之时","sand"},
    },
    {
      ["chs"]="冰风迷途的勇士",
      ["eng"]="blizzardStrayer",
      {"遍结寒霜的傲骨","cup"},
      {"摧冰而行的执望","feather"},
      {"历经风雪的思念","flower"},
      {"破冰踏雪的回音","head"},
      {"冰雪故园的终期","sand"},
    },
    {
      ["chs"]="教官",
      ["eng"]="instructor",
      {"教官的茶杯","cup"},
      {"教官的羽饰","feather"},
      {"教官的胸花","flower"},
      {"教官的帽子","head"},
      {"教官的怀表","sand"},
    },
    {
      ["chs"]="勇者之心",
      ["eng"]="braveHeart",
      {"勇士的壮行","cup"},
      {"勇士的期许","feather"},
      {"勇士的勋章","flower"},
      {"勇士的冠冕","head"},
      {"勇士的坚毅","sand"},
    },
    {
      ["chs"]="遗馈",
      ["eng"]="exile",
      {"流放者之杯","cup"},
      {"流放者之羽","feather"},
      {"流放者之花","flower"},
      {"流放者头冠","head"},
      {"流放者怀表","sand"},
    },
    {
      ["chs"]="祭火之人",
      ["eng"]="prayersForIllumination",
      {"","cup"},
      {"","feather"},
      {"","flower"},
      {"祭火礼冠","head"},
      {"","sand"},
    },
    {
      ["chs"]="翠绿之影",
      ["eng"]="viridescentVenerer",
      {"翠绿猎人的容器","cup"},
      {"猎人青翠的箭羽","feather"},
      {"野花记忆的绿野","flower"},
      {"翠绿的猎人之冠","head"},
      {"翠绿猎人的笃定","sand"},
    },
    {
      ["chs"]="守护之心",
      ["eng"]="defenderWill",
      {"守护之皿","cup"},
      {"守护徽印","feather"},
      {"守护之花","flower"},
      {"守护束带","head"},
      {"守护座钟","sand"},
    },
    {
      ["chs"]="被怜爱的少女",
      ["eng"]="maidenBeloved",
      {"少女片刻的闲暇","cup"},
      {"少女飘摇的思念","feather"},
      {"远方的少女的心","flower"},
      {"少女易逝的芳颜","head"},
      {"少女苦短的良辰","sand"},
    },
    {
      ["chs"]="行者之心",
      ["eng"]="resolutionOfSojourner",
      {"异国之盏","cup"},
      {"归乡之羽","feather"},
      {"故人之心","flower"},
      {"感别之冠","head"},
      {"逐光之石","sand"},
    },
    {
      ["chs"]="平息鸣雷的尊者",
      ["eng"]="thunderSmoother",
      {"平雷之器","cup"},
      {"平雷之羽","feather"},
      {"平雷之心","flower"},
      {"平雷之冠","head"},
      {"平雷之刻","sand"},
    },
    {
      ["chs"]="冒险家",
      ["eng"]="adventurer",
      {"冒险家金杯","cup"},
      {"冒险家尾羽","feather"},
      {"冒险家之花","flower"},
      {"冒险家头带","head"},
      {"冒险家怀表","sand"},
    },
    {
      ["chs"]="奇迹",
      ["eng"]="tinyMiracle",
      {"奇迹之杯","cup"},
      {"奇迹之羽","feather"},
      {"奇迹之花","flower"},
      {"奇迹耳坠","head"},
      {"奇迹之沙","sand"},
    },
    {
      ["chs"]="如雷的盛怒",
      ["eng"]="thunderingFury",
      {"降雷的凶兆","cup"},
      {"雷灾的孑遗","feather"},
      {"雷鸟的怜悯","flower"},
      {"唤雷的头冠","head"},
      {"雷霆的时计","sand"},
    },
    {
      ["chs"]="悠古的磐岩",
      ["eng"]="archaicPetra",
      {"巉岩琢塑之樽","cup"},
      {"嵯峨群峰之翼","feather"},
      {"磐陀裂生之花","flower"},
      {"不动玄石之相","head"},
      {"星罗圭壁之晷","sand"},
    },
    {
      ["chs"]="血战之人",
      ["eng"]="berserker",
      {"战狂的骨杯","cup"},
      {"战狂的翎羽","feather"},
      {"战狂的蔷薇","flower"},
      {"战狂的鬼面","head"},
      {"战狂的时计","sand"},
    },
    {
      ["chs"]="仁心",
      ["eng"]="travelingDoctor",
      {"游医的药壶","cup"},
      {"游医的枭羽","feather"},
      {"游医的银莲","flower"},
      {"游医的方巾","head"},
      {"游医的怀钟","sand"},
    },
    {
      ["chs"]="学士",
      ["eng"]="scholar",
      {"学士的墨杯","cup"},
      {"学士的羽笔","feather"},
      {"学士的书签","flower"},
      {"学士的镜片","head"},
      {"学士的时钟","sand"},
    },
    {
      ["chs"]="逆飞的流星",
      ["eng"]="retracingBolide",
      {"夏祭水玉","cup"},
      {"夏祭终末","feather"},
      {"夏祭之花","flower"},
      {"夏祭之面","head"},
      {"夏祭之刻","sand"},
    },
    {
      ["chs"]="征涛之人",
      ["eng"]="heartOfDepth",
      {"沉波之盏","cup"},
      {"追忆之风","feather"},
      {"饰金胸花","flower"},
      {"酒渍船帽","head"},
      {"坚铜罗盘","sand"},
    },
    {
      ["chs"]="绝缘之旗印",
      ["eng"]="绝缘之旗印",
      {"明威之镡","flower"},
      {"切落之羽","feather"},
      {"雷云之笼","sand"},
      {"绯花之壶","cup"},
      {"华饰之兜","head"},
    },
    {
      ["chs"]="追忆之注连",
      ["eng"]="追忆之注连",
      {"羁缠之花","flower"},
      {"思忆之矢","feather"},
      {"朝露之时","sand"},
      {"祈望之心","cup"},
      {"无常之面","head"},
    },
    {
      ["chs"]="华馆梦醒形骸记",
      ["eng"]="huskOfOpulentDreams",
      {"荣花之期","flower"},
      {"华馆之羽","feather"},
      {"众生之谣","sand"},
      {"梦醒之瓢","cup"},
      {"形骸之笠","head"},
    },
    {
      ["chs"]="海染砗磲",
      ["eng"]="oceanHuedClam",
      {"海染之花","flower"},
      {"渊宫之羽","feather"},
      {"离别之贝","sand"},
      {"真珠之笼","cup"},
      {"海祇之冠","head"},
    },
  }

  for v in string.gmatch(entry,"\n(.-)\n") do
    v=v:gsub(" ","")
    if v=="" then
     else
      for i2,v2 in pairs(relic_all) do
        for i3,v3 in pairs(v2) do
          if v and v3[1] then
            if v:find(v3[1]) then
              if v3[1]~="" then
                name=v3[1]
              end
            end
          end
        end
      end
      v1=v:match("%+(.+)")
      tab[#tab+1]=v
      --print(v)
    end
  end

  tab2={
  }

  grade="+0"

  for i,v in ipairs(tab) do
    if tonumber(v)==nil then
      if tonumber(tab[i+1])~=nil then
        if v:match("[0-9]") then
          v=v:gsub(v:match("[0-9]")," "..v:match("[0-9]"))
          local a,b=v:match("(.+) (.+)")
          --print(v)
          main,mainVal=a,b
          --print(1,a,b)
          if tonumber(tab[i+1]) then
            --print(1,tab[i+1])
            grade=tab[i+1]
          end
         else
          main,mainVal=v,tab[i+1]
          --print(2,v,tab[i+1])
          --print(2,tab[i+2])
          grade=tab[i+2]
        end
        if v:match("%%") then
          v=v:gsub(" ","")
          if tab[i-1] then
            --print(3)
            if not mainVal then
              main,mainVal=tab[i-1],v
              --print(3,tab[i-1],v)
            end
            if tonumber(tab[i+1]) then
              --print(3,tab[i+1])
              grade=tab[i+1]
            end
          end
        end
       else
        local a,b=v:match("(.+)%+(.+)")
        if a==nil then
         a=""
         end
        if b==nil then 
        b="" 
      end
        if a=="" and b=="" then
          if v:find("%%") then
            if main==nil or main=="" then
              main,mainVal=tab[i-1],v
              --print(4,tab[i-1],v)
            end
          end
         else
          tab2[#tab2+1]={a:gsub("%.",""),b}
        end
      end
    end
  end

  if name:find("%+") and grade=="+0" then
    name,grade=name:match("(.+)%+(.+)")
    grade="+"..grade
  end

  for i,v in ipairs(tab2) do
    if #v==0 then
      tab2[i]=nil
    end
  end

  muktable={
    pairsBySort=function(_t, func)
      local a = {}
      for n in pairs(_t) do a[#a + 1] = n end
      table.sort(a, func)
      local i = 0
      return function()
        i = i + 1
        return a[i], _t[a[i]]
      end
    end,
    sort=function(_t,func)
      _t1={}
      for i,v in muktable.pairsBySort(_t,func) do
        _t1[#_t1 + 1] = v
      end
      return _t1
    end,
  }

  tab3={
    ["name"]=name,
    ["main"]={main,mainVal},
    ["grade"]=grade,
    ["mainPos"]=mainPos,
    table={},
  }

  for i,v in muktable.pairsBySort(tab2) do
    tab3.table[#tab3.table + 1] = v
  end

  nname.Text=tab3.name
  for i,v in ipairs(entry_main) do
    if v==main then
      nmain.Text=main
      nmain.textColor=转0x(textc)
    end
  end
  nmainVal.Text=mainVal
  ngrade.Text=tab3.grade
  npos.Text=tab3.mainPos
  if tab3.table[1] then
    for i,v in ipairs(entry_side) do
      if v==tab3.table[1][1] then
        nside1.Text=tab3.table[1][1]
        nside1.textColor=转0x(textc)
      end
    end
    nside1Val.Text=tab3.table[1][2]
  end
  if tab3.table[2] then
    for i,v in ipairs(entry_side) do
      if v==tab3.table[2][1] then
        nside2.Text=tab3.table[2][1]
        nside2.textColor=转0x(textc)
      end
    end
    nside2Val.Text=tab3.table[2][2]
  end
  if tab3.table[3] then
    for i,v in ipairs(entry_side) do
      if v==tab3.table[3][1] then
        nside3.Text=tab3.table[3][1]
        nside3.textColor=转0x(textc)
      end
    end
    nside3Val.Text=tab3.table[3][2]
  end
  if tab3.table[4] then
    for i,v in ipairs(entry_side) do
      if v==tab3.table[4][1] then
        nside4.Text=tab3.table[4][1]
        nside4.textColor=转0x(textc)
      end
    end
    nside4Val.Text=tab3.table[4][2]
  end

end

function select(id_,pos)

  local bwz
  if 全局主题值~="Night" then
    bwz=0x3f000000
   else
    bwz=0x3fffffff
  end

  local dialog_layout={
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
        Text="选择";
        Typeface=AppFont.特粗;
        textColor=primaryc;
      };
      {
        GridView;
        layout_width="-1";
        layout_height="-1";
        layout_weight="1",
        id="_gv",
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
            关闭对话框(dialogs)
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
            Text="关闭";
            textColor=stextc;
            BackgroundDrawable=activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{bwz}));
          };
        };
      },
    };
  };

  dialog=BottomDialog(activity)
  dialog.setView(loadlayout(dialog_layout))
  dialog.setGravity(Gravity.BOTTOM)
  dialog.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
  dialog.setMinHeight(0)
  dialog.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
  --设置圆角
  dialog.setRadius(dp2px(16),转0x(backgroundc))
  dialog.setCancelable(true)
  dialog.setCanceledOnTouchOutside(true);
  dialogs=dialog.show()

  local list_item={
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
          id_.Text=v.Text
          id_.textColor=转0x(textc)
          关闭对话框(dialogs)
        end;
        textColor="#00000000";
      };
    };
  };

  local dialog_adp
  dialog_adp=LuaAdapter(activity,list_item)

  _gv.setAdapter(dialog_adp)
  
  if pos==0 then
    for i,v in ipairs(entry_main) do
      dialog_adp.add{
        tladp_text=v,
        tladp_activity={
          text=v,
          BackgroundDrawable=波纹2("方自适应"),
        },
      }
    end
   elseif pos==1 then
    for i,v in ipairs(entry_side) do
      dialog_adp.add{
        tladp_text=v,
        tladp_activity={
          text=v,
          BackgroundDrawable=波纹2("方自适应"),
        },
      }
    end
   elseif pos==2 then
    for i,v in ipairs(methods) do
      dialog_adp.add{
        tladp_text=v,
        tladp_activity={
          text=v,
          BackgroundDrawable=波纹2("方自适应"),
        },
      }
    end
  end
end

nmain.onClick=function(v)
  select(v,0)
end
nside1.onClick=function(v)
  select(v,1)
end
nside2.onClick=function(v)
  select(v,1)
end
nside3.onClick=function(v)
  select(v,1)
end
nside4.onClick=function(v)
  select(v,1)
end

nmethod.onClick=function(v)
  select(v,2)
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

分屏()