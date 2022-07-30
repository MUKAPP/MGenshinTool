require "import"

hutaoapi={}

hutaoapi.url="https://hutao-api.snapgenshin.com"

hutaoapi.token=""

hutaoapi.login=function(func)
  local map = HashMap()
  map.put("content-type", "text/json; charset=utf-8")
  Http.post(hutaoapi.url.."/Auth/Login",
  JSON.encode{
    "Appid"="08da6c58-47df-4214-8aab-45758a8e25b9",
    "Secret"="/cRDISSy5mI1bfGlmU8YlQSC1oIatarq4HOZesdjSq4=",
  },nil,nil,
  map,
  function(code,content,cookie,header)
    printLog("hutaoapi.login",code,content,header)
    if code==307
      Http.post(header.Location[0],
      JSON.encode{
        "Appid"="08da6c58-47df-4214-8aab-45758a8e25b9",
        "Secret"="/cRDISSy5mI1bfGlmU8YlQSC1oIatarq4HOZesdjSq4=",
      },nil,nil,
      map,
      function(code,content,cookie,header)
        local data=JSON.decode(content)
        if data.retcode==0
          hutaoapi.token=data.data.accessToken
          printLog("hutaoapi.login","登录成功")
          func()
         else
          提示("获取失败："..data.message)
        end
      end)
     else
      提示("获取失败："..code)
    end
  end)
end

hutaoapi.statistics={}

hutaoapi.statistics.overview=function()
  local map = HashMap()
  --map.put("content-type", "text/json; charset=utf-8")
  map.put("Authorization", "Bearer "..hutaoapi.token)
  Http.get(hutaoapi.url.."/Statistics/Overview",
  nil,nil,
  map,
  function(code,content,cookie,header)
    printLog("hutaoapi.statistics.overview",code,content)
    if code==200
     else
      提示("获取失败："..code)
    end
  end)
end