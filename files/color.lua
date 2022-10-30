module('files.color', package.seeall)

local Color = luajava.bindClass 'android.graphics.Color'
local Configuration = luajava.bindClass "android.content.res.Configuration"
local theme = luajava.getContext().getTheme()
local typedValue = luajava.newInstance 'android.util.TypedValue'
theme.resolveAttribute(android.R.attr.colorAccent, typedValue, true)
local tcolor = typedValue.data
local typedValue = luajava.newInstance 'android.util.TypedValue'
theme.resolveAttribute(android.R.attr.windowBackground, typedValue, true)
local bcolor = typedValue.data
local hsv = float[3]
Color.colorToHSV(bcolor, hsv)
local dark = hsv[2] < 0.5

local color = {
  theme = {tcolor, tcolor},
  text = {0xffffffff, 0xff000000},
  sub_text = {0x50ffffff, 0x50000000},
  ripples = {0x20ffffff, 0x20000000},
  bg ={0xff303030, 0xffeeeeee}
}

local t = {}
for k, v in pairs(color) do
  t[k] = v[dark and 1 or 2]
end

return t
