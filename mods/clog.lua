require "import"
loadstring([[
local LinearLayout=import "android.widget.LinearLayout"
local RelativeLayout=import "android.widget.RelativeLayout"
local FrameLayout=import "android.widget.FrameLayout"
local ScrollView=import "android.widget.ScrollView"
local Button=import "android.widget.Button"
local EditText=import "android.widget.EditText"
]])()

local function dp(d)
  return tonumber((d*activity.getResources().getDisplayMetrics().density)+0.5)
end

local function status_bar_height()
  return tonumber(activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height))
end

local function navigation_bar_height()
  return tonumber(activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().navigation_bar_height))
end

local function createView(class,w,h,l)
  if not l then l=FrameLayout end
  local v=class(activity)
  local p=l.LayoutParams(w or -2,h or -2)
  v.setLayoutParams(p)
  return v,p
end

local root=activity.getDecorView()

local body=createView(RelativeLayout,-1,-1)
root.addView(body)

local decor=createView(LinearLayout,activity.getWidth(),-1,RelativeLayout)
decor.setBackgroundColor(0xFF202125)
decor.setOrientation(1)
decor.setElevation(dp(8))
decor.setPadding(0,status_bar_height(),0,navigation_bar_height())
decor.setVisibility(8)
body.addView(decor)

local button,buttonP=createView(TextView,-2,-2,RelativeLayout)
button.setBackgroundColor(0xaF202125)
button.setTextColor(0xFF88A8E8)
button.setText("调试")
buttonP.addRule(15)
buttonP.addRule(11)
button.setPadding(dp(4),dp(4),dp(4),dp(4))
button.setElevation(dp(2))
button.onClick=function()
  local s=8
  if decor.getVisibility()==8 then s=0 end
  decor.setVisibility(s)
end
body.addView(button)

local scroll,scrollP=createView(ScrollView,-1,-1,LinearLayout)
scroll.setBackgroundColor(0xFF202125)
scrollP.weight=1
decor.addView(scroll)

local view=createView(LinearLayout,-1,-1,ScrollView)
view.setOrientation(1)
scroll.addView(view)

local text,textP=createView(EditText,-1,-1,LinearLayout)
--text.setLineHeight(dp(24))
text.setBackgroundColor(0)
text.setTextSize(14)
text.setGravity(8)
text.setPadding(dp(16),dp(16),dp(16),dp(16))
--text.setMinHeight(dp(56))
text.setTextColor(0xffffffff)
view.addView(text)

local button2,button2P=createView(Button,-1,dp(48),LinearLayout)
button2.setBackgroundColor(0xFF36373B)
button2.setText("关闭")
button2.setTextColor(0xFF88A8E8)
button2.setTextSize(16)
button2.onClick=function()
  local s=8
  if decor.getVisibility()==8 then s=0 end
  decor.setVisibility(s)
end
decor.addView(button2)

local clear,clearP=createView(Button,-1,dp(48),LinearLayout)
clear.setBackgroundColor(0xFF36373B)
clear.setText("清空")
clear.setTextColor(0xFF88A8E8)
clear.setTextSize(16)
clear.onClick=function()
  text.setText("")
end
decor.addView(clear)

local object={}

function object.print(...)
  local b={...}
  local o=tostring(text.getText())
  if o~="" then o=o.."\n\n" end
  local s=""
  for k,v in pairs(b) do
    if k>1 then
      if type(v)=="string" then
        s=s.."\n"..v
       else
        s=s.."\n"..dump(v)
      end
    end
  end
  n=b[1] or "Developer Mode"
  s=o.."- "..n.." - "..os.date("%Y-%m-%d %H:%M:%S").." -"..s
  text.setText(s)
  --print(s)
end

printLog=object.print

return object