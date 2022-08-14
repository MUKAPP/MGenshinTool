require "import"

import "mods.muk"

import "androidx.core.widget.NestedScrollView"

import "androidx.recyclerview.widget.StaggeredGridLayoutManager"
import "androidx.recyclerview.widget.*"
import "androidx.recyclerview.widget.RecyclerView"

import "com.pretend.recyclerview.lua.adapter.LuaAdapterCreator"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerHolder"
import "com.pretend.recyclerview.lua.adapter.LuaRecyclerViewAdapter"

import "com.pretend.recyclerview.LuaSpanSizeLookup"
import "com.pretend.recyclerview.LuaSpanSizeLookup$luaSpanSizeLookup"

import "com.michael.*"

import "com.bumptech.glide.request.RequestOptions"
import "com.bumptech.glide.load.resource.bitmap.RoundedCorners"
import "com.bumptech.glide.load.resource.bitmap.CenterCrop"

local t={
  "android.permission.WRITE_EXTERNAL_STORAGE"
}

print(activity.requestPermissions(t,0))
