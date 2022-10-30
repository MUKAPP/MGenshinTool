require "import"

hutaoapi={}

hutaoapi.url="https://homa.snapgenshin.com"

hutaoapi.token=""

hutaoapi.ua="MUKGenshinTool/"..应用版本名

hutaoapi.login=function(func)
  local map = HashMap()
  map.put("content-type", "text/json; charset=utf-8")
  Http.post(hutaoapi.url.."/Auth/Login",
  JSON.encode{
    "Appid"="08da6c58-47df-4214-8aab-45758a8e25b9",
    "Secret"="/cRDISSy5mI1bfGlmU8YlQSC1oIatarq4HOZesdjSq4=",
  },nil,nil,map,
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

hutaoapi.statistics.overview=function(func)
  --获取总览数据
  local map = HashMap()
  --map.put("content-type", "text/json; charset=utf-8")
  --map.put("Authorization", "Bearer "..hutaoapi.token)
  map.put("User-Agent", hutaoapi.ua)
  Http.get(hutaoapi.url.."/Statistics/Overview",
  nil,nil,map,
  function(code,content,cookie,header)
    --printLog("hutaoapi.statistics.overview",code,content)
    if code==200
      local data=JSON.decode(content)
      if data.retcode==0
        printLog("hutaoapi.statistics.overview","ok")
        func(data)
       else
        提示("获取失败："..data.message)
      end
     else
      提示("获取失败："..code)
    end
  end)
end

hutaoapi.statistics.avatar_attendanceRate=function(func)
  --获取角色出场率
  local map = HashMap()
  --map.put("content-type", "text/json; charset=utf-8")
  --map.put("Authorization", "Bearer "..hutaoapi.token)
  map.put("User-Agent", hutaoapi.ua)
  Http.get(hutaoapi.url.."/Statistics/Avatar/AttendanceRate",
  nil,nil,map,
  function(code,content,cookie,header)
    --printLog("hutaoapi.statistics.avatar.attendanceRate",code,content)
    if code==200
      local data=JSON.decode(content)
      if data.retcode==0
        printLog("hutaoapi.statistics.avatar_attendanceRate","ok")
        func(data)
       else
        提示("获取失败："..data.message)
      end
     else
      提示("获取失败："..code)
    end
  end)
end

hutaoapi.statistics.avatar_utilizationRate=function(func)
  --获取角色使用率
  local map = HashMap()
  --map.put("content-type", "text/json; charset=utf-8")
  --map.put("Authorization", "Bearer "..hutaoapi.token)
  map.put("User-Agent", hutaoapi.ua)
  Http.get(hutaoapi.url.."/Statistics/Avatar/UtilizationRate",
  nil,nil,map,
  function(code,content,cookie,header)
    --printLog("hutaoapi.statistics.avatar.attendanceRate",code,content)
    if code==200
      local data=JSON.decode(content)
      if data.retcode==0
        printLog("hutaoapi.statistics.avatar_utilizationRate","ok")
        func(data)
       else
        提示("获取失败："..data.message)
      end
     else
      提示("获取失败："..code)
    end
  end)
end

hutaoapi.statistics.avatar_holdingRate=function(func)
  --获取角色持有率
  local map = HashMap()
  --map.put("content-type", "text/json; charset=utf-8")
  --map.put("Authorization", "Bearer "..hutaoapi.token)
  map.put("User-Agent", hutaoapi.ua)
  Http.get(hutaoapi.url.."/Statistics/Avatar/HoldingRate",
  nil,nil,map,
  function(code,content,cookie,header)
    if code==200
      local data=JSON.decode(content)
      if data.retcode==0
        printLog("hutaoapi.statistics.avatar_holdingRate","ok")
        func(data)
       else
        提示("获取失败："..data.message)
      end
     else
      提示("获取失败："..code)
    end
  end)
end
