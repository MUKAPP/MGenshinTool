module('util', package.seeall)
local data = require 'files.data'

local Build=luajava.bindClass "android.os.Build"
local context = luajava.getContext()
local v=tonumber(Build.VERSION.RELEASE)or 0

function isData(path)
  return path:find('/Android/data', nil, true) and
  (v>=11)
end

function ls(path)
  if isData(path) then
    return data.ls(path)
   else
    return io.ls(path)
  end
end

function isdir(path)
  if isData(path) then
    return data.isdir(path)
   else
    return io.isdir(path)
  end
end

function time(path)
  if isData(path) then
    return data.lastModified(path)
   else
    return io.info(path).mtime
  end
end

function size(path)
  if isData(path) then
    return data.length(path) or 0
   else
    return io.info(path).size or 0
  end
end

function pf(path)
  return path:gsub('/$', ''):match('^(.-)/[^/]+$')
end

return _M
