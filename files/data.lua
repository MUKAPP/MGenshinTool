module('data',package.seeall)

local Build=luajava.bindClass "android.os.Build"
local Intent=luajava.bindClass "android.content.Intent"
local Cursor=luajava.bindClass 'android.database.Cursor'
local Uri=luajava.bindClass 'android.net.Uri'
local DocumentsContract=luajava.bindClass 'android.provider.DocumentsContract'
local String=luajava.bindClass "java.lang.String"
local ByteBuffer=luajava.bindClass "java.nio.ByteBuffer"
local context=luajava.getContext()

local cls=_ENV
setmetatable(cls,cls)


local resolver=context.getContentResolver()
local rootUri = Uri.parse("content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata")


local ran
function request(callback)
  local intent = Intent("android.intent.action.OPEN_DOCUMENT_TREE")
  intent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
  | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
  | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
  | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION)
  intent.putExtra("android.provider.extra.INITIAL_URI",DocumentsContract.buildDocumentUriUsingTree(rootUri,DocumentsContract.getTreeDocumentId(rootUri)))
  ran=os.time()+math.random(0x100000,0xffffff)
  context.startActivityForResult(intent,ran)
  local super=_G.onActivityResult
  function _G.onActivityResult(a,b,c)
    if super
      super(a,b,c)
    end
    if a==ran
      when callback
      callback(a,b,c)
    end
  end
end

function save(a,b,c)
  when !c return;
  local uri=c.getData()
  local uri1="^content://com.android.externalstorage.documents/tree/.+%%3AAndroid%%2Fdata%%?2?F?$"

  if tostring(uri):find(uri1) and uri
    resolver.takePersistableUriPermission(uri,c.getFlags()&(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION))
    return true
  end
end

function check()
  when tonumber(Build.VERSION.SDK)<30 return true
  local list=resolver.getPersistedUriPermissions()
  for i=0,#list-1
    local v=list[i]
    if (v.isReadPermission() && v.getUri().toString():find("content://com.android.externalstorage.documents/tree/primary%%3AAndroid%%2Fdata")) then
      return true
    end
  end
  return false
end


function toUri(path)
  path=path
  :gsub("/$","")
  :gsub("^/storage/emulated/%d+/", "")
  :gsub("^/sdcard/","")
  :gsub("/", "%%2F")
  return Uri.parse("content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata/document/primary%3A"..path)
end

function create(path)
  local type,name
  if path:sub(-1)=='/'
    type="vnd.android.document/directory"
    path=path:sub(1,-2)
   else
    type="*/*"
  end
  path,name=path:match'^(.-)/([^/]+)$'
  return pcall(DocumentsContract.createDocument,resolver,toUri(path),type,name)
end

function mkdir(path)
  if path:sub(-1)~="/"
    path=path..'/'
  end
  return create(path)
end

function mkfile(path)
  if path:sub(-1)=="/"
    path=path:sub(1,-2)
  end
  return create(path)
end

function delete(path)
  when type(path)=="table" path=path.uri
  when type(path)=="string" path=toUri(path)
  return pcall(DocumentsContract.deleteDocument,resolver,path)
end

function rename(path,name)
  when type(path)=="table" path=path.uri
  when type(path)=="string" path=toUri(path)
  return pcall(DocumentsContract.renameDocument,resolver,path,name)
end

function exists(path)
  when type(path)=="table" path=path.uri
  when type(path)=="string" path=toUri(path)
  local a,b=pcall(function()
    local cursor=resolver.query(path,{"document_id"},nil,nil,nil)
    local n=cursor.getCount()>0
    cursor.close()
    return n
  end)
  when a return b
  return false
end

function isDirectory(path)
  when type(path)=="table" path=path.uri
  when type(path)=="string" path=toUri(path)
  local a,b=pcall(function()
    local cursor=resolver.query(path,{"mime_type"},nil,nil,nil)
    cursor.moveToFirst()
    local n=cursor.getString(0)
    cursor.close()
    return n=='vnd.android.document/directory'
  end)
  when a return b
  return false
end
isdir=isDirectory
isFile=lambda...:not isdir(...)
isfile=isFile

function getName(path)
  when type(path)=="table" path=path.uri
  when type(path)=="string" path=toUri(path)
  local a,b=pcall(function()
    local cursor=resolver.query(path,{"_display_name"},nil,nil,nil)
    cursor.moveToFirst()
    local n=cursor.getString(0)
    cursor.close()
    return n
  end)
  when a return b
end
name=getName

function length(uri)
  if type(uri)=="table"
    local self=uri
    if self.canRead
      return self.fic.size()
    end

    if self.canWrite
      return self.foc.size()
    end
  end
  when type(uri)=="string" uri=toUri(uri)
  local cursor=resolver.query(uri,{"_size"},nil,nil,nil)
  cursor.moveToFirst()
  local n=cursor.getLong(0)
  cursor.close()
  return n
end

function lastModified(uri)
  when type(path)=="table" path=path.uri
  when type(uri)=="string" uri=toUri(uri)
  local cursor=resolver.query(uri,{"last_modified"},nil,nil,nil)
  cursor.moveToFirst()
  local n=cursor.getLong(0)
  cursor.close()
  return n/1000
end

function cls:truncate(n)
  if self.canWrite
    self.foc.truncate(n)
  end
  return self.canWrite
end

function open(path,mode)
  local _path=path
  when type(path)=="string" path=toUri(path)
  mode=mode or 'r'

  local self={}
  setmetatable(self,self)

  self.__index=_ENV
  self.__len=function(a)
    return a:length()
  end

  self.path=_path
  self.uri=path

  local s1=mode:sub(1,1)
  local s2=mode:sub(2,2)

  self.canRead=s1=='r'
  self.canWrite=s1~='r'

  local is

  if s1=='w'
    self.writeMode=1
    if not exists(self.uri)
      assert((mkfile(self.path)),'data::write error!')
     else
      is=true
    end
   else
    when not exists(self.uri) return;
    self.writeMode=2
  end

  if s2=='+' and s1=='r'
    self.canWrite=true
    self.writeMode=1
   elseif s2=='+'
    self.canRead=true
  end

  if self.canRead
    self.fis=resolver.openInputStream(self.uri)
    self.fic=self.fis.getChannel()
  end

  if self.canWrite
    self.fos=resolver.openOutputStream(self.uri)
    self.foc=self.fos.getChannel()
  end

  if is
    self:truncate(0)
  end

  self.pos=0

  return self
end

function cls:seek(mode,n)
  if type(mode)=="string" and not n
    if mode=="set"
      n=1
     elseif mode=="end"
      n=-1
     else
      n=0
    end
  end
  when not n mode,n='cur',mode
  when not n return self.pos+1
  if mode=='set'
    self.pos=n-1
   elseif mode=='end'
    self.pos=#self+n
   else
    self.pos=self.pos+n
  end
  return self.pos+1
end

function cls:read(n)
  if type(self)=='string'
    return _read(self,n)
  end
  assert(self.canRead,'data::The file cannot be read!')
  if not n
    n=#self-self.pos
  end

  when n<0 return ""

  self.fic.position(self.pos)

  local buff=ByteBuffer.allocate(n)
  self.fic.read(buff)
  local b=buff.array()
  local s=String(b)
  local str=tostring(s)
  self:seek(n)
  luajava.clear(b)
  luajava.clear(buff)
  luajava.clear(s)
  return str
end

function cls:write(fmt,...)
  if type(self)=='string'
    return _write(self,fmt,...)
  end
  if ...
    fmt=string.format(fmt,...)
  end
  local s=String(fmt)
  fmt=s.getBytes()
  local buff=ByteBuffer.wrap(fmt)
  self.foc.position(self.pos)
  self.foc.write(buff)
  self:seek(#fmt)
  luajava.clear(s)
  luajava.clear(fmt)
  luajava.clear(buff)
  return self
end

function cls:flush()
  self.fic.force(false)
  self.foc.force(false)
  return self
end

function cls:close()
  luajava.clear(self.uri)

  if self.canRead
    self.fic.close()
    self.fis.close()
    luajava.clear(self.fic)
    luajava.clear(self.fis)
  end
  if self.canWrite
    self.fos.close()
    self.foc.close()
    luajava.clear(self.fos)
    luajava.clear(self.foc)
  end

  getmetatable(self)
  .__index=lambda:
  error('data::Cannot open closed file!')

  return self
end

function ls(path,is,is2)
  when type(path)=="string" path=toUri(path)
  local a,b=pcall(function()
    local tree=DocumentsContract.buildChildDocumentsUriUsingTree(path, DocumentsContract.getDocumentId(path))
    local cursor=resolver.query(tree,{"document_id"},nil,nil,nil)
    if not is2
      local list,count={},cursor.getCount()
      when count>60000 list=String[count]
      local k=0
      while cursor.moveToNext()
        k=k+1
        local len=k
        when count>60000 len=k-1
        list[len]=cursor.getString(0)
        if is
          list[len]=string.format('/sdcard/%s',list[len]:sub(9))
         else
          list[len]=list[len]:match('([^/]+)$')
        end
      end
      cursor.close()
      luajava.clear(tree)
      return list
    end
    local n=0
    return function()
      if cursor.moveToNext()
        local s=cursor.getString(0)
        n=n+1
        if is
          return n,string.format('/sdcard/%s',s:sub(9))
         else
          return n,s:match('([^/]+)$')
        end
      end
      cursor.close()
      luajava.clear(tree)
    end
  end)
  when a return b
end

function _read(path,n)
  local uri=toUri(path)
  local fis=resolver.openInputStream(uri)
  when !n n=fis.available()
  local b=byte[n]
  fis.read(b)
  fis.close()
  local s=String(b)
  local str=tostring(s)
  luajava.clear(s)
  luajava.clear(b)
  return str
end

function _write(path,fmt,...)
  local uri=toUri(path)
  local fos=resolver.openOutputStream(uri)
  if ...
    fmt=string.format(fmt,...)
  end
  local s=String(fmt)
  fmt=s.getBytes()
  fos.write(fmt)
  fos.close()
  luajava.clear(s)
  luajava.clear(fmt)
  return true
end

return _M