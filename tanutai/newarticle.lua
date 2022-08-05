require "import"
import "mods.muk"
import "mods.tanutai"

import "okhttp3.OkHttpClient"
import "okhttp3.Request"
import "okhttp3.Call"
import "okhttp3.RequestBody"
import "okhttp3.FormBody"
import "okhttp3.MediaType"
import "okhttp3.MultipartBody"

activity.Title="写文章"

layout={
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
      layout_width="-1";
      background=barbackgroundc;
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
          onClick=function()关闭页面()end;
        };
      };
      {
        TextView;--标题
        Typeface=AppFont.特粗;
        textSize="20sp";
        Text=activity.Title;
        ellipsize="end";
        layout_marginLeft="16dp";
        SingleLine=true;
        textColor=primaryc;
        layout_weight="1";
      };
      {
        LinearLayout;
        layout_width="32dp";
        layout_height="56dp";
        --background=backgroundc;
        gravity="center";
        layout_marginRight="12dp",
        {
          ImageView;
          layout_width="32dp";
          layout_height="32dp";
          padding="4dp";
          ColorFilter=primaryc;
          src=图标("send");
          id="_send";
        };
      };
    };
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      focusable=true,
      focusableInTouchMode=true,
      orientation="vertical";
      {
        ScrollView,
        layout_width="-1",
        layout_height="-1",
        background=backgroundc;
        layout_weight="1",
        id="scroll",
        {
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          {
            MEditText
            {
              textSize="14sp",
              textColor=textc;
              HintTextColor=stextc;
              hint="标题";
              layout_width="-1";
              layout_height="-2";
              --text="#2196F3";
              id="title",
              inputType="text",
            };
            layout_marginTop="8dp";
            layout_margin="16dp";
            layout_marginBottom="8dp";
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
              layout_height="-2";
              layout_width="-1";
              gravity="left|center",
              paddingTop="8dp",
              paddingBottom="8dp";
              id="topiclay",
              {
                CardView;
                CardElevation="0dp";
                CardBackgroundColor=cardbackc;
                Radius="6dp";
                layout_width="72dp";
                layout_height="40dp";
                layout_marginLeft="8dp";
                {
                  ImageView;
                  layout_height="-1";
                  layout_width="-1";
                  scaleType="centerCrop";
                  id="topic_img",
                };
              },
              {
                TextView;
                textColor=textc;
                textSize="14sp";
                gravity="center|left";
                Typeface=AppFont.标准;
                padding="12dp";
                paddingTop="4dp",
                paddingBottom="4dp";
                text="选择话题",
                id="topic",
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
            layout_marginTop="8dp";
            layout_marginBottom="64dp";
            {
              LinearLayout;
              layout_height="-2";
              layout_width="-1";
              orientation="vertical";
              {
                LinearLayout;
                orientation="horizontal";
                layout_height="-2";
                layout_width="-1";
                gravity="right|center";
                paddingRight="16dp",
                paddingTop="16dp";
                {
                  ImageView;
                  ColorFilter=primaryc;
                  src=图标("visibility");
                  layout_height="32dp";
                  layout_width="32dp";
                  padding="4dp";
                  id="preview_switch";
                  onClick=function()end;
                };
              };
              {
                EditText,
                id="edit",
                padding="16dp",
                paddingTop="8dp";
                layout_margin=0,
                textColor=textc;
                textSize="16sp";
                gravity="left|top";
                Typeface=AppFont.标准;
                layout_width="-1";
                layout_height="-1";
                background="#00000000",
                hint="文章内容",
              },
              {
                TextView,
                id="preview",
                paddingTop="8dp";
                padding="16dp",
                textColor=textc;
                textSize="16sp";
                gravity="left|top";
                Typeface=AppFont.标准;
                layout_width="-1";
                layout_height="-1";
              },
            },
          },
        },

      },

      {
        CardView;
        layout_width="-1",
        layout_height="40dp",
        radius="0";
        layout_margin="0";
        CardBackgroundColor=backgroundc;
        elevation="0";
        translationZ="4dp";
        {
          HorizontalScrollView;
          layout_height="-1";
          layout_width="-1";
          horizontalScrollBarEnabled=false,
          id="ps_bar";
          {
            LinearLayout,
            layout_height="-1";
            layout_width="-1";
            paddingLeft="16dp",
            paddingRight="16dp",
          }
        };
        {
          HorizontalScrollView;
          layout_height="-1";
          layout_width="-1";
          horizontalScrollBarEnabled=false,
          id="ps_bar_title";
          {
            LinearLayout,
            layout_height="-1";
            layout_width="-1";
            paddingLeft="16dp",
            paddingRight="16dp",
          }
        };
      };
    };
  };
};

设置视图(layout)

波纹({back,_send,preview_switch},"圆主题")
波纹({topiclay},"方自适应")

控件隐藏(topic_img.getParent())
控件隐藏(ps_bar_title)
控件隐藏(preview)

transitioner = LayoutTransition()
ps_bar.getParent().setLayoutTransition(transitioner)
ps_bar.getParent().getParent().setLayoutTransition(transitioner)
--edit.getParent().setLayoutTransition(transitioner)
topic_img.getParent().getParent().setLayoutTransition(transitioner)

local tableTheme = TableTheme.Builder()
.tableCellPadding(dp2px(12))
.tableBorderColor(转0x(cardbackc))
.tableBorderWidth(dp2px(2))
.tableOddRowBackgroundColor(转0x(cardbackc))
.tableEvenRowBackgroundColor(转0x(cardbackc))
.tableHeaderRowBackgroundColor(转0x(primaryc)-0x7f000000)
.build()

markwon = Markwon.builder(this)
.usePlugin(MarkwonPlugin{
  configureTheme=function(builder)
    builder
    .linkColor(转0x(primaryc))
    .blockMargin(dp2px(16))--文本内容前的起始边距
    .blockQuoteWidth(dp2px(4))--引用条纹宽度
    .blockQuoteColor(转0x(primaryc))--引用条纹颜色
    .listItemColor(转0x(primaryc))--列表项颜色
    .bulletListItemStrokeWidth(dp2px(2))--项目符号列表项的边框宽度（2 级）
    .bulletWidth(dp2px(8))--项目符号的宽度
    .codeTextColor(转0x(textc))--内联代码
    .codeBackgroundColor(转0x(cardbackc))
    .codeBlockTextColor(转0x(textc))--块代码
    .codeBlockBackgroundColor(转0x(cardbackc))
    .codeBlockMargin(dp2px(8))--块代码内容的前导边距
    .headingBreakHeight(dp2px(12))--H1和H2下的刹车高度
    .headingBreakColor(转0x(primaryc)-0x7f000000)--H1和H2下刹车的颜色
    .headingTypeface(AppFont.粗体)--标题字体
    .thematicBreakColor(转0x(cardbackc))--主题休息的颜色
    .thematicBreakHeight(dp2px(2))--主题休息的高度
  end,
  configureConfiguration=function(builder)
    builder
    .linkResolver(LinkResolver{
      resolve=function(view,link)
        if link:find("^image%:%:") then
          activity.newActivity("tanutai/viewimage",{link:match("^image%:%:(.+)")})
         elseif link:find("^copy%:%:") then
          复制文本(link:match("^copy%:%:(.+)"))
          提示("已复制文本")
         elseif link:find("^bilibili%:%:") then
          提示("正在获取视频信息")
          local bv
          local page
          if link:find("|") then
            bv,page=link:match("^bilibili%:%:(.-)|(.+)")
           else
            bv=link:match("^bilibili%:%:(.+)")
          end
          local url="https://api.bilibili.com/x/web-interface/view?bvid="..bv
          Http.get(url,function(code,content)
            if code==200 then
              local content=JSON.decode(content)
              if content.code=="0" then
                提示("获取视频信息失败："..content.message)
               else
                local aid=content.data.aid
                local pages=content.data.pages
                local pagesinfo={}
                for i=1,#pages do
                  pagesinfo[#pagesinfo+1]={pages[i].cid,pages[i].dimension.width,pages[i].dimension.height,}
                end
                activity.newActivity("tanutai/bili",{aid,bv,pagesinfo,page})
              end
             else
              提示("获取视频信息失败："..code)
            end
          end)
         else
          if link:find("^http%:") or link:find("^https%:") then
            activity.newActivity("web",{link})
           else
            浏览器打开(link)
          end
        end
      end,
    })
  end,
  processMarkdown=function(x)
    --print(x)
    return x
  end
})
.usePlugin(MovementMethodPlugin.create(BetterLinkMovementMethod.getInstance()))
.usePlugin(LinkifyPlugin.create())
.usePlugin(GlideImagesPlugin.create(GlideImagesPlugin.GlideStore{
  load=function(drawable)
    local link=drawable.getDestination()
    local glideUrl
    if link:find("tpic.mukapp.top") then
      glideUrl = GlideUrl(link, LazyHeaders.Builder()
      .addHeader("Referer", "https://tanutai.mukapp.top")
      .build())
     else
      glideUrl = GlideUrl(link, LazyHeaders.Builder()
      --.addHeader("Referer", "https://tanutai.mukapp.top")
      .build())
    end
    return Glide.with(this)
    .load(glideUrl)
    .placeholder(BitmapDrawable(loadbitmap("res/loading_image.png")))
    .transition(DrawableTransitionOptions
    .with(DrawableCrossFadeFactory.Builder(328)
    .setCrossFadeEnabled(true).build()))
    .override(activity.Width-dp2px(16*2*2), dp2px(512))
    .transform({FitCenter(), RoundedCorners(dp2px(6))})
  end,
  cancel=function(target)
    Glide.with(this).clear(target)
  end,
}))
.usePlugin(StrikethroughPlugin.create())
.usePlugin(TablePlugin.create(tableTheme))
.usePlugin(TaskListPlugin.create(转0x(primaryc), 转0x(stextc), 转0x(backgroundc)))
.usePlugin(HtmlPlugin.create(HtmlPlugin.HtmlConfigure{
  configureHtml=function(plugin)
    plugin.addHandler(SimpleTagHandlerImpl(CallBack{
      getSpans=function(configuration, renderProps, tag)
        local spans=ArrayList()
        if tag.attributes().get("color")~=nil
          and tag.attributes().get("color")~="" then
          spans.add(ForegroundColorSpan(转0x(tag.attributes().get("color"))))
        end
        return spans.toArray()
      end,
      supportedTags=function()
        return Collections.singleton("font")
      end,
    })
    )
  end
}))
.usePlugin(MarkwonInlineParserPlugin.create())
.build()

previewing=false

preview_switch.onClick=function()
  if previewing then
    previewing=false
    控件隐藏(preview)
    控件可见(edit)
    preview_switch.setImageBitmap(loadbitmap(图标("visibility")))
    preview_switch.setColorFilter(转0x(primaryc))
   else
    previewing=true
    控件可见(preview)
    控件隐藏(edit)
    markwon.setMarkdown(preview,edit.Text)
    preview_switch.setImageBitmap(loadbitmap(图标("visibility_off")))
    preview_switch.setColorFilter(转0x(stextc))

    inputMethodManager = activity.getSystemService(Context.INPUT_METHOD_SERVICE);
    inputMethodManager.hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken()
    ,InputMethodManager.HIDE_NOT_ALWAYS);
  end
end

控件隐藏(ps_bar.getParent())
edit.setOnFocusChangeListener({
  onFocusChange=function(v, hasFocus)
    if (hasFocus) then
      控件可见(ps_bar.getParent())
     else
      控件隐藏(ps_bar.getParent())
    end
  end
});

function insert(n)
  edit.getText().insert(edit.getSelectionStart(), n);
end

function insertAt(index,n)
  edit.getText().insert(index, n)
end

function delete(s,e)
  edit.getText().delete(s, e)
end

bardata={
  {"标题","title"},
  {"粗体","format_bold"},
  {"斜体","format_italic"},
  {"换行","enter_key"},
  {"字体颜色","format_color_text"},
  {"删除线","format_strikethrough"},
  {"图片","insert_photo"},
  {"视频","smart_display"},
  {"链接","insert_link"},
  {"引用","format_quote"},
  {"无序列表","format_list_bulleted"},
  {"有序列表","format_list_numbered"},
  {"任务列表","checklist"},
  {"表格","table_chart"},
  {"分割线","horizontal_rule"},
  {"复制","content_copy"},
  {"代码","code"},
  {"代码块","code_block_icons8"},
}

function watermark(n)
  if n==""
    return ""
   else
    return "?imageView2/0/q/75|watermark/2/text/"..n.."/font/6buR5L2T/fontsize/640/fill/I0VFRUVFRQ==/dissolve/83/gravity/SouthEast/dx/10/dy/10"
  end
end

for i,v in ipairs(bardata) do
  ps_bar.getChildAt(0).addView(loadlayout{
    RelativeLayout;
    layout_width="-1";
    layout_height="-1";
    background=backgroundc,
    {
      ImageView;
      ColorFilter=textc;
      layout_height="-1";
      layout_width="40dp";
      padding="8dp";
      id="img";
      src=图标(v[2]),
      BackgroundDrawable=波纹2("方自适应"),
      onClick=function()
        local index = edit.getSelectionStart();
        local indexEnd = edit.getSelectionEnd();
        local editable = edit.getText();
        if v[1]=="标题" then
          控件隐藏(ps_bar)
          控件可见(ps_bar_title)
         elseif v[1]=="粗体" then
          insertAt(indexEnd,"**")
          insertAt(index,"**")
          edit.setSelection(indexEnd+2)
         elseif v[1]=="斜体" then
          insertAt(indexEnd,"*")
          insertAt(index,"*")
          edit.setSelection(indexEnd+1)
         elseif v[1]=="删除线" then
          insertAt(indexEnd,"~~")
          insertAt(index,"~~")
          edit.setSelection(indexEnd+2)
         elseif v[1]=="图片" then
          ChooseFile("image/*",function(f)
            加载对话框("正在上传图片","请稍等…",0)
            local url="https://pic.mukapp.top/api/v1/upload"
            -- 拿到Client
            local okHttpClient = OkHttpClient()

            local request_body = MultipartBody.Builder()
            .setType(MultipartBody.FORM)
            .addFormDataPart("file", String(f).substring(String(f).lastIndexOf("/") + 1), RequestBody.create(MediaType.parse("image/*"), File(f)))
            .build()

            local request = Request.Builder()
            .header("Accept","application/json")
            .header("Content-Type","multipart/form-data")
            .url(url)
            .post(request_body)
            .build()

            -- 封装为Call
            local m_call = okHttpClient.newCall(request)

            -- 异步请求
            m_call.enqueue({
              onFailure = function(call, e)
                activity.runOnUiThread(function()
                  关闭对话框()
                  提示("上传失败："..e.getMessage())
                end)
              end,
              onResponse = function(call, response)
                local res = response.body().string()
                activity.runOnUiThread(function()
                  关闭对话框()
                  local data=JSON.decode(res)
                  printLog("uploadImage",data)
                  if data.status==true then
                    local thumbnail_url=data.data.links.thumbnail_url
                    local url=data.data.links.url
                    提示("上传成功")
                    insert(" [![图片描述]("..thumbnail_url..")](image::"..url..") ")
                   else
                    提示("上传失败："..data.message)
                  end
                end)
              end
            })

          end)
         elseif v[1]=="视频" then
          dann={
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
                Text="插入视频";
                Typeface=AppFont.特粗;
                textColor=primaryc;
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入视频BV号";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="bv_edit",
                };
                layout_marginTop="8dp";
                layout_margin="24dp";
                layout_marginBottom="8dp";
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入视频分P（若没有请留空）";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="splitp_edit",
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
                  radius="4dp";
                  background=primaryc;
                  layout_marginTop="8dp";
                  layout_marginLeft="8dp";
                  layout_marginRight="24dp";
                  layout_marginBottom="24dp";
                  Elevation="1dp";
                  onClick=function()
                    if tostring(bv_edit.Text)==nil and tostring(bv_edit.Text)=="" then
                      提示("BV号不能为空")
                      return true
                    end
                    local split=""
                    if tostring(splitp_edit.Text)~=nil and tostring(splitp_edit.Text)~="" then
                      split="|"..splitp_edit.Text
                    end
                    insert(" [![视频描述](https://api.mukapp.top/bilipic.php?id="..bv_edit.Text..")](bilibili::"..bv_edit.Text..split..") ")
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
         elseif v[1]=="链接" then
          dann={
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
                Text="插入链接";
                Typeface=AppFont.特粗;
                textColor=primaryc;
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入链接";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="link_edit",
                };
                layout_marginTop="8dp";
                layout_margin="24dp";
                layout_marginBottom="8dp";
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入链接描述";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="linkt_edit",
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
                  radius="4dp";
                  background=primaryc;
                  layout_marginTop="8dp";
                  layout_marginLeft="8dp";
                  layout_marginRight="24dp";
                  layout_marginBottom="24dp";
                  Elevation="1dp";
                  onClick=function()
                    if tostring(link_edit.Text)==nil and tostring(link_edit.Text)=="" then
                      提示("链接不能为空")
                      return true
                    end
                    local split="链接"
                    if tostring(linkt_edit.Text)~=nil and tostring(linkt_edit.Text)~="" then
                      split=linkt_edit.Text
                    end
                    insert(" ["..split.."]("..link_edit.Text..")")
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
         elseif v[1]=="换行" then
          insert("  \n")
         elseif v[1]=="引用" then
          for i=index,1,-1 do
            if utf8.sub(tostring(editable),i,i)=="\n" then
              insertAt(i,"> ")
              return true
            end
          end
          insertAt(0,"> ")
         elseif v[1]=="无序列表" then
          for i=index,1,-1 do
            if utf8.sub(tostring(editable),i,i)=="\n" then
              insertAt(i,"- ")
              return true
            end
          end
          insertAt(0,"- ")
         elseif v[1]=="有序列表" then
          for i=index,1,-1 do
            if utf8.sub(tostring(editable),i,i)=="\n" then
              for i2=i-1,1,-1 do
                if utf8.sub(tostring(editable),i2,i2)=="\n" then
                  if utf8.sub(tostring(editable),i2+1,i2+3):find("%. ") then
                    if tointeger(utf8.sub(tostring(editable),i2+1,i2+2):match("(.+)%.")) then
                      insertAt(i,(tointeger(utf8.sub(tostring(editable),i2+1,i2+2):match("(.+)%."))+1)..". ")
                      return true
                    end
                  end
                  insertAt(i,"1. ")
                  return true
                end
                if i2==1 then
                  if utf8.sub(tostring(editable),i2,i2+2):find("%. ") then
                    if tointeger(utf8.sub(tostring(editable),i2,i2+1):match("(.+)%.")) then
                      insertAt(i,(tointeger(utf8.sub(tostring(editable),i2,i2+1):match("(.+)%."))+1)..". ")
                      return true
                    end
                  end
                end
              end
              insertAt(i,"1. ")
              return true
            end
          end
          insertAt(0,"1. ")
         elseif v[1]=="任务列表" then
          for i=index,1,-1 do
            if utf8.sub(tostring(editable),i,i)=="\n" then
              if utf8.sub(tostring(editable),i+1,i+5):match("%- %[(.-)%]")==" " then
                delete(i,i+6)
                insertAt(i,"- [x] ")
                return true
              end
              if utf8.sub(tostring(editable),i+1,i+5):match("%- %[(.-)%]")=="x" then
                delete(i,i+6)
                return true
              end
              insertAt(i,"- [ ] ")
              return true
            end
          end
          if utf8.sub(tostring(editable),1,5):match("%- %[(.-)%]")==" " then
            delete(0,6)
            insertAt(0,"- [x] ")
            return true
          end
          if utf8.sub(tostring(editable),1,5):match("%- %[(.-)%]")=="x" then
            delete(0,6)
            return true
          end
          insertAt(0,"- [ ] ")
         elseif v[1]=="表格" then
          提示("表格不支持快捷添加，如果想插入表格可以搜搜 Markdown表格")
         elseif v[1]=="分割线" then
          insert("\n\n_ _ _\n\n")
         elseif v[1]=="复制" then
          dann={
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
                Text="插入点击复制文本";
                Typeface=AppFont.特粗;
                textColor=primaryc;
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入标题";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="copyn_edit",
                };
                layout_marginTop="8dp";
                layout_margin="24dp";
                layout_marginBottom="8dp";
              };
              {
                MEditText
                {
                  textSize="14sp",
                  textColor=textc;
                  HintTextColor=stextc;
                  hint="输入复制内容";
                  layout_width="-1";
                  layout_height="-2";
                  --text="#2196F3";
                  id="copy_edit",
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
                  radius="4dp";
                  background=primaryc;
                  layout_marginTop="8dp";
                  layout_marginLeft="8dp";
                  layout_marginRight="24dp";
                  layout_marginBottom="24dp";
                  Elevation="1dp";
                  onClick=function()
                    if tostring(copy_edit.Text)==nil and tostring(copy_edit.Text)=="" then
                      提示("内容不能为空")
                      return true
                    end
                    local split="点击复制"
                    if tostring(copyn_edit.Text)~=nil and tostring(copyn_edit.Text)~="" then
                      split=copyn_edit.Text
                    end
                    insert(" ["..split.."](copy::"..copy_edit.Text..")")
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
         elseif v[1]=="代码" then
          insertAt(indexEnd,"`")
          insertAt(index,"`")
          edit.setSelection(indexEnd+1)
         elseif v[1]=="代码块" then
          insertAt(indexEnd,"\n```")
          insertAt(index,"```\n")
          edit.setSelection(indexEnd+4)
         elseif v[1]=="字体颜色" then
          ColorPicker(function(n)
            insertAt(indexEnd,"</font>")
            insertAt(index,"<font color=\""..n.."\">")
            edit.setSelection(indexEnd+22)
          end)
         else
          insert(v[1])
        end
      end;
    };
  })
end

bardata2={
  {"返回"},
  {"H1","# "},
  {"H2","## "},
  {"H3","### "},
  {"H4","#### "},
  {"H5","##### "},
  {"H6","###### "},
}

for i,v in ipairs(bardata2) do
  ps_bar_title.getChildAt(0).addView(loadlayout{
    RelativeLayout;
    layout_width="-1";
    layout_height="-1";
    background=backgroundc,
    {
      TextView;
      textColor=textc;
      textSize="14sp";
      gravity="center";
      Typeface=AppFont.粗体;
      layout_height="-1";
      layout_width="-2";
      paddingLeft="8dp";
      paddingRight="8dp";
      id="text";
      Text=v[1],
      BackgroundDrawable=波纹2("方自适应"),
      onClick=function()
        local index = edit.getSelectionStart();
        local indexEnd = edit.getSelectionEnd();
        local editable = edit.getText();
        if v[1]~="返回" then
          for i=index,1,-1 do
            if utf8.sub(tostring(editable),i,i)=="\n" then
              insertAt(i,v[2])
              return true
            end
          end
          insertAt(0,v[2])
         else
          控件可见(ps_bar)
          控件隐藏(ps_bar_title)
        end
      end,
    };
  })
end

_send.onClick=function()
  if title.Text=="" or title.Text==nil then
    提示("标题不能为空")
    return true
  end
  if topic_==nil then
    提示("话题不能为空")
    return true
  end
  if edit.Text==nil or edit.Text=="" then
    提示("内容不能为空")
    return true
  end
  加载对话框("正在发布","请稍等…",0)
  tanutai.createArticle(title.Text,topic_,edit.Text,
  function(content)
    关闭对话框()
    if content.code==0 then
      edit.Text=""
      activity.result({})
     else
      提示("发布失败："..content.message)
    end
    end,function(code)
    关闭对话框()
    提示("发布失败："..code)
  end)
end

topiclay.onClick=function()
  加载对话框("正在获取","请稍等…",0)
  tanutai.topic(function(content)
    关闭对话框()
    if content.code==0 then
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
            Text="选择话题";
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
                Text="关闭";
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
          BackgroundDrawable=波纹2("方自适应"),
          id="tladp_activity",
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
        };
      };

      local tladp2
      tladp2=LuaAdapter(activity,tool_list_item2)

      gv.setAdapter(tladp2)

      for i=1,#content.data do
        tladp2.add{
          tladp_text=content.data[i].name,
          tladp_activity={
            onClick=function()
              控件可见(topic_img.getParent())
              topic_=content.data[i].topic_id
              topic.Text=content.data[i].name

              Glide.with(this)
              .load(content.data[i].cover.small)
              .transition(DrawableTransitionOptions
              .with(DrawableCrossFadeFactory.Builder(328)
              .setCrossFadeEnabled(true).build()))
              .into(topic_img)
              关闭对话框()
            end,
          },
        }
      end
     else
      提示("获取失败："..content.message)
    end
    end,function(code,content)
    关闭对话框()
    提示("获取失败："..code)
  end)
end

if mukactivity.getData("tanutai_newarticle_draft") then
  edit.Text=mukactivity.getData("tanutai_newarticle_draft")
end

function onStop()
  mukactivity.setData("tanutai_newarticle_draft",tostring(edit.Text))
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