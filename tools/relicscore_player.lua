require "import"

ACTIVITY="relicscore_player"

import "mods.muk"

characters=loadstring([[return import "enka.characters"]])()
loc=loadstring([[return import "enka.loc"]])()

loc=loc[getLanguage("loc",0)]

local uid=...

activity.Title=getLanguage("角色评分")

layout = {
  LinearLayout,
  orientation = "vertical",
  layout_width = "fill",
  layout_height = "fill",
  Gravity = "center|top",
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
      LinearLayout,
      orientation = "vertical",
      layout_width = "-1",
      layout_height = "-1",
      {
        CardView,
        CardElevation = "0dp",
        CardBackgroundColor = cardbackc,
        Radius = "8dp",
        layout_width = "-1",
        layout_height = "-2",
        {
          LinearLayout,
          orientation = "vertical",
          --layout_marginTop="20dp",
          layout_width = "-1",
          layout_height = "-1",
          {
            TextView,
            text = "nickname",
            textColor = primaryc,
            textSize = "16sp",
            gravity = "center|left",
            Typeface = AppFont.特粗,
            padding = "16dp",
            paddingBottom = "4dp",
            id = "nickname"
          },
          {
            TextView,
            text = "位置",
            textColor = textc,
            textSize = "12sp",
            gravity = "center|left",
            Typeface = AppFont.细体,
            id = "level_worldlevel",
            layout_height = "-2",
            layout_width = "-2",
            padding = "16dp",
            paddingTop = "0",
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
              layout_height = "-2",
              {
                LinearLayout,
                layout_width = "-1",
                layout_height = "-2",
                padding = "16dp",
                paddingTop = "8dp",
                paddingBottom = "8dp",
                orientation = "vertical",
                layout_gravity = "center",
                layout_weight = "1",
                {
                  TextView,
                  text = "主词条",
                  textColor = primaryc,
                  textSize = "14sp",
                  gravity = "center|left",
                  Typeface = AppFont.标准,
                  id = "amain",
                  layout_width = "-2",
                  layout_height = "-2"
                  --layout_marginLeft="16dp";
                  --layout_marginRight="16dp";
                },
                {
                  TextView,
                  text = "值",
                  textColor = primaryc,
                  textSize = "16sp",
                  gravity = "center|left",
                  Typeface = AppFont.粗体,
                  id = "amainVal",
                  layout_height = "-2",
                  layout_width = "-2"
                  --layout_marginLeft="16dp";
                  --layout_marginRight="16dp";
                  --paddingBottom="4dp",
                },
                {
                  CardView,
                  CardElevation = "0dp",
                  CardBackgroundColor = cardbackc,
                  Radius = "2dp",
                  layout_width = "-2",
                  layout_height = "-2",
                  paddingTop = "4dp",
                  {
                    LinearLayout,
                    layout_width = "-1",
                    layout_height = "-2",
                    padding = "4dp",
                    paddingTop = "1dp",
                    paddingBottom = "1dp",
                    {
                      TextView,
                      text = "等级",
                      textColor = textc,
                      textSize = "12sp",
                      gravity = "center|left",
                      Typeface = AppFont.细体,
                      id = "amainGrade",
                      layout_height = "-2",
                      layout_width = "-2"
                    }
                  }
                }
              },
              {
                CardView,
                CardElevation = "0dp",
                CardBackgroundColor = cardbackc,
                Radius = "4dp",
                layout_width = "64dp",
                layout_height = "64dp",
                layout_margin = "16dp",
                layout_marginBottom = "8dp",
                layout_marginTop = "8dp",
                layout_gravity = "center",
                id = "imgw",
                {
                  ImageView,
                  id = "img",
                  scaleType = "fitCenter",
                  layout_width = "-1",
                  layout_height = "-1",
                  colorFilter = viewshaderc
                }
              }
            }
          },
          {
            TextView,
            text = "副词条",
            textColor = textc,
            textSize = "14sp",
            gravity = "center|left",
            Typeface = AppFont.标准,
            paddingLeft = "16dp",
            paddingRight = "16dp",
            paddingBottom = "12dp",
            paddingTop = "8dp",
            id = "atext",
            layout_width = "-1",
            layout_weight = "1"
          },
          {
            CardView,
            CardElevation = "0dp",
            CardBackgroundColor = primaryc,
            Radius = "4dp",
            layout_width = "-1",
            layout_height = "-2",
            layout_marginLeft = "16dp",
            layout_marginRight = "16dp",
            {
              LinearLayout,
              layout_width = "-1",
              layout_height = "-2",
              padding = "16dp",
              paddingTop = "8dp",
              paddingBottom = "8dp",
              orientation = "vertical",
              {
                TextView,
                text = "最终得分",
                textColor = backgroundc,
                textSize = "18sp",
                gravity = "center|left",
                Typeface = AppFont.特粗,
                id = "ascore",
                layout_width = "-1",
                layout_height = "-2"
              },
              {
                TextView,
                text = "评语",
                textColor = backgroundc,
                textSize = "14sp",
                gravity = "center|left",
                Typeface = AppFont.斜体,
                id = "comment",
                layout_width = "-1",
                layout_height = "-2"
              }
            }
          },
          {
            TextView,
            text = "———— 应急食品 ————",
            textColor = stextc,
            textSize = "12sp",
            gravity = "center",
            Typeface = AppFont.特细,
            id = "right",
            layout_width = "-1",
            layout_height = "-2",
            layout_marginTop = "8dp"
          },
        },
      },
      {
        LinearLayout,
        orientation = "vertical",
        layout_width = "-1",
        layout_height = "-2",
        Gravity = "center",
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
          {
            ImageView,
            src = 图标("save"),
            layout_width = "56dp",
            layout_height = "56dp",
            padding = "16dp",
            id = "TranslationClick",
            ColorFilter = backgroundc
          }
        }
      }
    }
  }
}

activity.setContentView(loadlayout(layout))

波纹({fh}, "圆主题")
波纹({TranslationClick}, "方黑")

function onCreate()
  Http.get("https://enka.network/u/"..uid.."/__data.json",function(code,content)
    if code~=200
      print(getLanguage("获取失败")..": "..code)
      return true
    end
    content=JSON.decode(content)
    
    local playerInfo=content.playerInfo

    local profilePicture=content.playerInfo.profilePicture.avatarId

    local all_avatar={}
    local showAvatarInfoList=content.playerInfo.showAvatarInfoList

    if showAvatarInfoList
      for i=1,#showAvatarInfoList do
        local avatarId=tostring(showAvatarInfoList[i].avatarId)
        local character=characters[avatarId]
        all_avatar[#all_avatar+1]={
          loc[tostring(character.NameTextMapHash)],
        }
      end
     else
      提示("无角色展柜")
    end

    nickname.Text=playerInfo.nickname
    level_worldlevel.Text=getLanguage("等级").." "..playerInfo.level

    提示("ok")

  end)
end