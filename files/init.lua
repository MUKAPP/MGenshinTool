require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
module('files', package.seeall)
local io = require 'io'
local util = require 'files.util'
local data = require 'files.data'
local Build=luajava.bindClass "android.os.Build"
local ColorStateList=luajava.bindClass "android.content.res.ColorStateList"
local InputMethodManager=luajava.bindClass "android.view.inputmethod.InputMethodManager"

local scale = activity.getResources().getDisplayMetrics().scaledDensity
local base_dialog = AlertDialog.Builder(this).setTitle('文件选择')

local color = require'files.color'.ripples
local ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0, 0)

local ext={
  alp='box',
  apk='android',
  txt='zfile',
  bat='zfile',
  aly='zfile',
  lua='zfile',
  mp3='music',
  ogg='music',
  wav='music',
  jpg='image',
  jpeg='image',
  png='image',
  ppt='ppt',
  word='word',
  pdf='pdf'
}

local avr=0

pcall(function()
  avr=Build.VERSION.RELEASE
end)

local function findExt(name)
  local v=name:match('%.([^%.]+)$')
  if !v
    return 'file'
  end
  return ext[v] or 'file'
end

function open(path, mode)
  path = path or '/sdcard'
  mode = mode or 'f'

  local self = {}
  setmetatable(self, {
    __index = _M
  })

  self.path = path:gsub('/$','')
  self.dialog = base_dialog.create()
  self.candir = not not mode:find('d', nil, true)
  self.canfile = not not mode:find('f', nil, true)
  self.canmulti = not not mode:find('m', nil, true)
  self.ids = {}
  self.sort={0,1}

  self:initlayout()
  return self
end

function _M:on(func)
  self.func=func
  return self
end

function _M:initlayout()
  self.dialog.setView(loadlayout('files.layout', self.ids))
  self.ids.up.background = activity.Resources.getDrawable(ripples)
  .setColor(ColorStateList({{}},{color}))
  self.ids.sort.background = activity.Resources.getDrawable(ripples)
  .setColor(ColorStateList({{}},{color}))
  self.ids.filter.background = activity.Resources.getDrawable(ripples)
  .setColor(ColorStateList({{}},{color}))

  self.ids.up.onClick = function()
    local _, _ = self.path:gsub('^/storage/emulated/%d+', '/内置存储'):gsub('^/sdcard', '/内置存储'):gsub('/', '')
    if _ <= 1 then
      return
    end
    self.path = util.pf(self.path)
    self:go(self.path)
  end

  self.ids.list
  .setEmptyView(self.ids.empty)

  self.list={}
  self.list1=self.list
  self.list2={}
  self.adp=LuaAdapter(activity,self.list,require 'files.item')
  self.adp2=LuaAdapter(activity,self.list2,require 'files.item')

  self.ids.list.setAdapter(self.adp)

  if self.candir or self.canmulti
    self.dialog.setButton('确定',function()
      if self.slast
        return self.func(self.path..'/'..self.slast.name..'/')
      end
      local t={}
      for k,v ipairs(self.list)
        if v.m.checked
          t[#t+1]=string.format('%s/%s',self.path,v.name)
          if v.img:find'folder'
            t[#t]=t[#t]..'/'
          end
        end
      end
      if #t>0
        if #t==1
          t=t[1]
        end
        self.func(t)
       elseif self.candir
        self.func(self.path..'/')
      end
    end)
    self.dialog.setButton2('取消',nil)

    if self.canmulti
      self.dialog.setButton3('反选',nil)
      self.temp=function(s)
        for k,v ipairs(self.list)
          if v.img:find'folder'
            if self.candir
              v.m.checked=not v.m.checked
              continue
            end
           else
            v.m.checked=not v.m.checked
          end
        end
        self.adp.notifyDataSetChanged()
      end
    end
  end

  local ids=self.ids
  self.state=0
  local box={
    loadlayout('files.box1',ids),
    loadlayout('files.box2',ids)
  }

  ids.sort.onClick=function(v)
    if self.state==1
      self:filter0()
      v.colorFilter=require'files.color'.text
      ids.box.visibility=8
      self.state=0
     else
      self.state=1
      v.colorFilter=require'files.color'.theme
      ids.filter.colorFilter=require'files.color'.text
      ids.box.removeAllViews()
      ids.box.visibility=0
      ids.box.addView(box[1])
    end
  end

  ids.filter.onClick=function(v)
    if self.state==2
      v.colorFilter=require'files.color'.text
      ids.box.visibility=8
      self.state=0
      self:filter0()
     else
      self.state=2
      v.colorFilter=require'files.color'.theme
      ids.sort.colorFilter=require'files.color'.text
      ids.box.removeAllViews()
      ids.box.visibility=0
      ids.box.addView(box[2])
    end
  end

  ids.list.onItemClick=function(s,v,p,i)
    local t=self.list[i]
    if t.img:find'folder'
      self.path=self.path..'/'..t.name
      self:go(self.path)
      return
    end
    self:hide()
    self.func(self.path..'/'..t.name)
  end

  ids.sort1_1.id=0x82913
  ids.sort1_2.id=0x82914
  ids.sort1_3.id=0x82915
  ids.sort2_1.id=0x82916
  ids.sort2_2.id=0x82917

  ids.sort1.check(0x82913)
  .setOnCheckedChangeListener{
    onCheckedChanged=function(v,i)
      self.sort[2]=4-(0x82916-i)
      self:resort()
  end}

  ids.sort2.check(0x82916)
  .setOnCheckedChangeListener{
    onCheckedChanged=function(v,i)
      self.sort[1]=1-(0x82917-i)
      self:resort()
  end}



  ids.filter1.addTextChangedListener{
    onTextChanged=function(s)
      if ids.filter1.tag
        ids.filter1.tag=nil
        return
      end
      if tostring(s)==""
        self:filter0()
        return
      end
      self:filter0(tostring(s))
  end}

  ids.frame.post(function()
    if this.width>this.height
      ids.frame.setOrientation(0)
      ids.sort1.setOrientation(1)
      ids.sort2.setOrientation(1)

      local lp=ids.box.getLayoutParams()
      lp.width=150*scale+0.5
      lp.height=-1
      ids.box.setLayoutParams(lp)
    end
  end)

  local super=_G.onConfigurationChanged
  function _G.onConfigurationChanged(...)
    if super
      super(...)
    end
    ids.frame.post(function()
      if this.width>this.height
        ids.frame.setOrientation(0)
        ids.sort1.setOrientation(1)
        ids.sort2.setOrientation(1)

        local lp=ids.box.getLayoutParams()
        lp.width=180*scale+0.5
        lp.height=-1
        ids.box.setLayoutParams(lp)
        return
      end
      ids.frame.setOrientation(1)
      ids.sort1.setOrientation(0)
      ids.sort2.setOrientation(0)

      local lp=ids.box.getLayoutParams()
      lp.width=-1
      lp.height=-2
      ids.box.setLayoutParams(lp)
    end)
  end

  return self
end

function _M:go(path)
  self.path=path
  path = path:gsub('^/storage/emulated/%d+', '/内置存储'):gsub('^/sdcard', '/内置存储')

  self:filter0()

  if path:find('/Android',nil,true) and ((tonumber(avr) or 0)>11)
    if not data.check()
      local p=self.path
      AlertDialog.Builder(this)
      .setTitle("温馨提示")
      .setMessage("从安卓11开始，因系统限制第三方软件均无法访问 Android/data 目录。您可以尝试通过授权，来让软件获得访问该目录的权限。点击[确定]进入授权页面后，直接点击底部[使用此文件夹]即可完成授权。")
      .setPositiveButton("确定",function()
        data.request(function(...)
          data.save(...)
          self:go(p)
        end)
      end)
      .setNegativeButton("取消",nil)
      .show()

      self.path=util.pf(self.path)
      return
    end
  end


  local t = {}
  path:gsub('/$', ''):gsub('[^/]+', function(w)
    t[#t + 1] = w
  end)

  self.ids.path.removeAllViews()
  local s = {}
  for i = 1, #t - 1 do
    s[i] = t[i]
    s[1] = 'sdcard'
    local str = table.concat(s, '/')
    self.ids.path.addView(loadlayout {
      TextView,
      background = activity.Resources.getDrawable(ripples)
      .setColor(ColorStateList({{}},{color})),
      text = t[i],
      gravity = "center",
      padding = "3dp",
      textColor = require'files.color'.sub_text,
      onClick = function()
        self.path = '/' .. str
        self:go(self.path)
      end
    })
    self.ids.path.addView(loadlayout {
      ImageView,
      layout_height = "23dp",
      layout_width = "23dp",
      src = "files/res/path.png",
      colorFilter = require'files.color'.text,
      alpha=0.3
    })
  end

  self.ids.path.addView(loadlayout {
    TextView,
    background = activity.Resources.getDrawable(ripples)
    .setColor(ColorStateList({{}},{color})),
    text = t[#t],
    gravity = "center",
    padding = "3dp",
    textColor = require'files.color'.text,
    onClick = function()
    end
  })

  self.ids.bar.post(function()
    self.ids.bar.fullScroll(ScrollView.FOCUS_RIGHT)
  end)

  self:load()

  return self
end

function _M:load()
  if self.t
    self.t.interrupt()
  end

  self.slast=nil

  self.adp.clear()
  self.ids.pb.visibility=0
  self.ids.tv.visibility=0

  self.t=thread(function(path,sort,callback)
    local util=require 'files.util'
    local List=luajava.bindClass 'java.util.List'
    local s1,s2=sort[0],sort[1]

    local ls=util.ls(path)
    for i=1,#ls
      if util.isdir(string.format('%s/%s',path,ls[i]))
        ls[i]=string.format('%s/',ls[i])
      end
    end
    table.sort(ls,function(a,b)
      local _a,_b=0,0
      if a:sub(-1)=='/'
        _a=1
      end
      if b:sub(-1)=='/'
        _b=1
      end
      if _a==_b
        if s1==1
          if s2==1
            return a>b
           elseif s2==2
            return util.time(string.format('%s/%s',path,a))>util.time(string.format('%s/%s',path,b))
           elseif s2==3
            return util.size(string.format('%s/%s',path,a))>util.size(string.format('%s/%s',path,b))
          end
         else
          if s2==1
            return a<b
           elseif s2==2
            return util.time(string.format('%s/%s',path,a))<util.time(string.format('%s/%s',path,b))
           elseif s2==3
            return util.size(string.format('%s/%s',path,a))<util.size(string.format('%s/%s',path,b))
          end
        end
        return f
       else
        return _a>_b
      end
    end)

    activity.runOnUiThread(function()
      callback(List(ls))
    end)
    end,self.path,List(self.sort),function(ls)

    local noclick=lambda:;


    local list=self.list
    for i=0,#ls-1
      local v,ext,tp=ls[i]
      if v:sub(-1)=='/'
        v=v:sub(1,-2)
        ext='folder'
        if self.candir
          if self.canmulti
            tp=1
           else
            tp=2
          end
         else
          tp=0
        end
       else
        if !self.canfile
          continue
        end
        if self.fls
          local e=v:match'%.([^%.]+)$'
          if not e
            continue
          end
          if not self.fls[e]
            continue
          end
        end
        if self.canmulti
          tp=1
         else
          tp=0
        end
        ext=findExt(v)
      end

      if v=="." or v==".."
        continue
      end

      local s,m

      local k=#list+1

      if tp==0
        s,m={
          visibility=8,
          checked=false,
          tag={self,k}
          },{
          visibility=8,
          checked=false,
          tag={self,k}
        }
       elseif tp==1
        s,m={
          visibility=8,
          checked=false,
          tag={self,k}
          },{
          visibility=0,
          checked=false,
          tag={self,k}
        }
       else
        s,m={
          visibility=0,
          checked=false,
          tag={self,k}
          },{
          visibility=8,
          checked=false,
          tag={self,k}
        }
      end


      list[k]={
        img=string.format('files/res/%s.png',ext),
        name=v,
        s=s,
        m=m
      }
    end
    self.ids.pb.visibility=8
    self.ids.tv.visibility=8
    self.adp.notifyDataSetChanged()
  end)

  return self
end

function _M:resort()
  local path=self.path
  local s1,s2=table.unpack(self.sort)
  table.sort(self.list,function(a,b)
    local _a,_b=0,0
    if a.img:find'folder'
      _a=1
    end
    if b.img:find'folder'
      _b=1
    end
    a,b=a.name,b.name
    if _a==_b
      if s1==1
        if s2==1
          return a>b
         elseif s2==2
          return util.time(string.format('%s/%s',path,a))>util.time(string.format('%s/%s',path,b))
         elseif s2==3
          return util.size(string.format('%s/%s',path,a))>util.size(string.format('%s/%s',path,b))
        end
       else
        if s2==1
          return a<b
         elseif s2==2
          return util.time(string.format('%s/%s',path,a))<util.time(string.format('%s/%s',path,b))
         elseif s2==3
          return util.size(string.format('%s/%s',path,a))<util.size(string.format('%s/%s',path,b))
        end
      end
      return f
     else
      return _a>_b
    end
  end)
  self.adp.notifyDataSetChanged()
  return self
end

local state
function _M:filter0(s)
  if !s
    if state
      state=false
      self.list,self.list2=self.list2,self.list
      self.adp,self.adp2=self.adp2,self.adp
      self.ids.list.setAdapter(self.adp)
    end
    self.ids.sort.colorFilter=require'files.color'.text
    self.ids.filter.colorFilter=require'files.color'.text
    self.ids.box.visibility=8
    self.state=0
    self.ids.filter1.tag=true
    self.ids.filter1.text=""
    return self
  end
  if state
    self.list,self.list2=self.list2,self.list
    self.adp,self.adp2=self.adp2,self.adp
  end
  state=true
  local is1,is2=self.ids.filter2.checked,self.ids.filter3.checked
  if not is1
    s=s:lower()
  end

  table.clear(self.list2)
  local t,b=self.list,self.list2
  for i,v in ipairs(t)do
    local _=v
    v=v.name
    if not is1
      v=v:lower()
    end
    if v:find(tostring(s),nil,not is2)
      b[#b+1]=_
    end
  end
  self.list,self.list2=self.list2,self.list
  self.adp,self.adp2=self.adp2,self.adp
  self.ids.list.setAdapter(self.adp)
  return self
end

function _M:filter(...)
  local t=self.fls or {}
  self.fls=t
  for k,v ipairs{...}
    t[v]=true
  end
  return self
end

function _M:title(s)
  self.dialog.setTitle(s)
  return self
end

function _M:show()
  self:go(self.path)
  self.dialog.show()
  if self.temp
    self.dialog.getButton(-3).onClick=self.temp
  end

  self.dialog.setCanceledOnTouchOutside(true)
  .getWindow()
  .clearFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM)
  .setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE)
  return self
end

function _M:hide()
  self.dialog.dismiss()
  return self
end

function _M:close()
  self:hide()

  luajava.clear(self.dialog)
  luajava.clear(self.adp)
  luajava.clear(self.adp2)
  for k,v ipairs(self.ids)
    luajava.clear(v)
  end
  table.clear(self)
  System.gc()
  collectgarbage("collect")
  return self
end