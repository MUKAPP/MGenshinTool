require "import"
import "android.widget.*"
import "android.view.*"

import "android.content.res.Resources$Theme"

import "com.github.chrisbanes.photoview.*"

import "jp.wasabeef.glide.transformations.*"
import "com.bumptech.glide.*"
import "com.bumptech.glide.load.engine.*"
import "com.bumptech.glide.request.*"
import "com.bumptech.glide.load.model.*"
import "com.bumptech.glide.request.target.Target"

import "android.graphics.drawable.ColorDrawable"

local link=...

activity.setContentView(loadlayout{
  PhotoView,
  layout_width="-1",
  layout_height="-1",
  id="photo",
})

local glideUrl
if link:find("tanutai%-1254044507") then
  glideUrl = GlideUrl(link, LazyHeaders.Builder()
  .addHeader("Referer", "https://tanutai.mukapp.top")
  .build())
 else
  glideUrl = GlideUrl(link, LazyHeaders.Builder()
  --.addHeader("Referer", "https://tanutai.mukapp.top")
  .build())
end

Glide.with(activity)
.load(glideUrl)
--.skipMemoryCache(true)
.override(Target.SIZE_ORIGINAL, Target.SIZE_ORIGINAL) 
.into(photo)

photo.onClick=function()
  activity.finish()

end

photo.onLongClick=function()
  print("long click")
end

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
local _window = activity.getWindow();
_window.setBackgroundDrawable(ColorDrawable(0xff000000))

function onDestroy()
  pcall(function()
    Glide.get(activity).clearMemory()
  end)
end