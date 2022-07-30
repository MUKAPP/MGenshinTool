require "import"

local api={}
api.rooturl="https://gbase.mukapp.top/"
api.apiurl=api.rooturl.."api/"

--登录 身份验证
api.token=function(username,password,callback)
  Http.post(
  api.apiurl.."token",
  {
    ["identification"]=username,
    ["password"]=password,
  },
  function(...)
    callback(...)
  end)
end

--论坛信息 貌似有问题？
api.forum=function(authentication,callback)
  local header={}
  if authentication
    header["Authentication"]=authentication
  end
  Http.get(
  api.apiurl.."forum",
  header,
  function(...)
    callback(...)
  end)
end

--获取所有讨论
api.discussions=function(authentication,q,callback)
  local header={}
  if authentication
    header["Authentication"]=authentication
  end
  if q
    header["q"]=q
  end
  Http.get(
  api.apiurl.."discussions",
  header,
  function(...)
    callback(...)
  end)
end


mukth=api