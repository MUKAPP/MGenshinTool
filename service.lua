require "import"

import "android.content.*"
import "android.util.*"
import "android.app.*"
import "android.icu.util.*"
import "java.util.*"
import "android.net.*"
import "android.os.*"
import "android.graphics.*"
import "androidx.core.app.NotificationCompat"
import "com.androlua.*"
import "java.lang.Thread"
import "java.net.URL"
import "java.io.File"
import "android.os.Environment"

--import "mods.mukmod"
import "mods.hoyobbs"

loadstring([[JSON=import "mods.json"]])()

function 文件是否存在(file)
  if file:find("noad")
   else
  end
  return File(file).exists()
end

function 读取文件(路径)
  if 文件是否存在(路径) then
    return io.open(路径):read("*a")
   else
    return ""
  end
end
function 内置存储(path)
  if path then
    return Environment.getExternalStorageDirectory().toString() .. "/" .. path
   else
    return Environment.getExternalStorageDirectory().toString()
  end
end

function 新内置存储文件(u)
  if u == "" or u == nil then
    return 内置存储("Download/MUKGenshinTool")
   else
    return 内置存储("Download/MUKGenshinTool/" .. u)
  end
end

device_id=读取文件(新内置存储文件("Settings/device_id"))

xpcall(function()
  function split(s, delim)
    if not s then
      return {}
    end
    assert (type (delim) == "string" and string.len (delim) > 0, "bad delimiter")
    local start = 1
    local t = {}
    while true do
      local pos = string.find(s, delim, start, true)
      if not pos then
        break
      end
      table.insert (t, string.sub (s, start, pos - 1))
      start = pos + string.len (delim)
    end
    table.insert (t, string.sub (s, start))
    return t
  end

  lastresin=0
  lastcoin=0

  function sendNotification(notification_title,notification_content,
    id,name,url,ongoing,sound,fullscreen)
    local builder
    --intent = Intent()
    local intent=Intent(this, luajava.bindClass("com.androlua.LuaActivity"))
    .setData(Uri.parse("file://"..this.getLuaDir(url)))
    if url==""
      intent=Intent()
    end
    local mNManager = this.getSystemService(Context.NOTIFICATION_SERVICE)
    local pendingIntent = PendingIntent.getActivity(this, 0, intent, 0)

    if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
      builder= NotificationCompat.Builder(this,"1773798610"..id);
     else
      builder= NotificationCompat.Builder(this);
    end

    --设置标题
    builder.setContentTitle(notification_title);
    --设置内容
    builder.setContentText(notification_content);
    --设置状态栏显示的图标，建议图标颜色透明
    builder.setSmallIcon(R.drawable.transicon)
    --设置通知灯光（LIGHTS）、铃声（SOUND）、震动（VIBRATE）、（ALL 表示都设置）
    if sound==true then
      builder.setDefaults(Notification.DEFAULT_ALL)
     else
      builder.setVibrate(nil);
      builder.setSound(nil);
      builder.setLights(0, 0, 0);
    end
    --通知栏点击后自动消失
    if ongoing==true then
      builder.setAutoCancel(false);
     else
      builder.setAutoCancel(true);
    end
    --简单通知栏设置 Intent
    builder.setContentIntent(pendingIntent);
    if sound==true then
      builder.setPriority(Notification.PRIORITY_HIGH)
     else
      if ongoing
        builder.setPriority(Notification.PRIORITY_DEFAULT)
       else
        builder.setPriority(Notification.PRIORITY_LOW)
      end
    end
    builder.setVisibility(Notification.VISIBILITY_PRIVATE)
    if fullscreen==true then
      --builder.setFullScreenIntent(pendingIntent, false)
     else
    end
    --常驻通知
    --if this.getSharedData("Note_Notification_Ongoing")=="true"
    builder.setOngoing(ongoing)
    --else
    --builder.setOngoing(false)
    --end
    --设置下拉之后显示的图片
    --builder.setLargeIcon(BitmapFactory.decodeResource(this.getResources(), R.drawable.icon));

    if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
      --mNManager.deleteNotificationChannel("1773798610"..id)

      local channel
      if sound==true then
        channel = NotificationChannel("1773798610"..id, name, NotificationManager.IMPORTANCE_HIGH);
       else
        channel = NotificationChannel("1773798610"..id, name, NotificationManager.IMPORTANCE_LOW);
      end
      channel.enableLights(sound);--是否在桌面icon右上角展示小红点
      channel.setLightColor(Color.RED);--小红点颜色
      --是否振动
      channel.enableVibration(sound);
      if sound==true then
        channel.setShowBadge(true); --是否在久按桌面图标时显示此渠道的通知
        channel.setImportance(NotificationManager.IMPORTANCE_HIGH)
       else
        channel.setShowBadge(false); --是否在久按桌面图标时显示此渠道的通知
        if ongoing
          channel.setImportance(NotificationManager.IMPORTANCE_DEFAULT)
         else
          channel.setImportance(NotificationManager.IMPORTANCE_LOW)
        end
      end
      mNManager.createNotificationChannel(channel);
    end
    bigTextStyle = NotificationCompat.BigTextStyle();
    bigTextStyle.setBigContentTitle(notification_title);
    bigTextStyle.bigText(notification_content);
    builder.setStyle(bigTextStyle);

    notification=builder.build();
    mNManager.notify(tointeger(id),notification);
  end

  function MD5(s)
    local HexTable = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    local A = 0x67452301
    local B = 0xefcdab89
    local C = 0x98badcfe
    local D = 0x10325476

    local S11 = 7
    local S12 = 12
    local S13 = 17
    local S14 = 22
    local S21 = 5
    local S22 = 9
    local S23 = 14
    local S24 = 20
    local S31 = 4
    local S32 = 11
    local S33 = 16
    local S34 = 23
    local S41 = 6
    local S42 = 10
    local S43 = 15
    local S44 = 21

    local function F(x,y,z)
      return (x & y) | ((~x) & z)
    end
    local function G(x,y,z)
      return (x & z) | (y & (~z))
    end
    local function H(x,y,z)
      return x ~ y ~ z
    end
    local function I(x,y,z)
      return y ~ (x | (~z))
    end
    local function FF(a,b,c,d,x,s,ac)
      a = a + F(b,c,d) + x + ac
      a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
      return a & 0xffffffff
    end
    local function GG(a,b,c,d,x,s,ac)
      a = a + G(b,c,d) + x + ac
      a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
      return a & 0xffffffff
    end
    local function HH(a,b,c,d,x,s,ac)
      a = a + H(b,c,d) + x + ac
      a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
      return a & 0xffffffff
    end
    local function II(a,b,c,d,x,s,ac)
      a = a + I(b,c,d) + x + ac
      a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
      return a & 0xffffffff
    end

    local function MD5StringFill(s)
      local len = s:len()
      local mod512 = len * 8 % 512
      --需要填充的字节数
      local fillSize = (448 - mod512) // 8
      if mod512 > 448 then
        fillSize = (960 - mod512) // 8
      end

      local rTab = {}

      --记录当前byte在4个字节的偏移
      local byteIndex = 1
      for i = 1,len do
        local index = (i - 1) // 4 + 1
        rTab[index] = rTab[index] or 0
        rTab[index] = rTab[index] | (s:byte(i) << (byteIndex - 1) * 8)
        byteIndex = byteIndex + 1
        if byteIndex == 5 then
          byteIndex = 1
        end
      end
      --先将最后一个字节组成4字节一组
      --表示0x80是否已插入
      local b0x80 = false
      local tLen = #rTab
      if byteIndex ~= 1 then
        rTab[tLen] = rTab[tLen] | 0x80 << (byteIndex - 1) * 8
        b0x80 = true
      end

      --将余下的字节补齐
      for i = 1,fillSize // 4 do
        if not b0x80 and i == 1 then
          rTab[tLen + i] = 0x80
         else
          rTab[tLen + i] = 0x0
        end
      end

      --后面加原始数据bit长度
      local bitLen = math.floor(len * 8)
      tLen = #rTab
      rTab[tLen + 1] = bitLen & 0xffffffff
      rTab[tLen + 2] = bitLen >> 32

      return rTab
    end

    --	Func:	计算MD5
    --	Param:	string
    --	Return:	string
    ---------------------------------------------


    --填充
    local fillTab = MD5StringFill(s)
    local result = {A,B,C,D}

    for i = 1,#fillTab // 16 do
      local a = result[1]
      local b = result[2]
      local c = result[3]
      local d = result[4]
      local offset = (i - 1) * 16 + 1
      --第一轮
      a = FF(a, b, c, d, fillTab[offset + 0], S11, 0xd76aa478)
      d = FF(d, a, b, c, fillTab[offset + 1], S12, 0xe8c7b756)
      c = FF(c, d, a, b, fillTab[offset + 2], S13, 0x242070db)
      b = FF(b, c, d, a, fillTab[offset + 3], S14, 0xc1bdceee)
      a = FF(a, b, c, d, fillTab[offset + 4], S11, 0xf57c0faf)
      d = FF(d, a, b, c, fillTab[offset + 5], S12, 0x4787c62a)
      c = FF(c, d, a, b, fillTab[offset + 6], S13, 0xa8304613)
      b = FF(b, c, d, a, fillTab[offset + 7], S14, 0xfd469501)
      a = FF(a, b, c, d, fillTab[offset + 8], S11, 0x698098d8)
      d = FF(d, a, b, c, fillTab[offset + 9], S12, 0x8b44f7af)
      c = FF(c, d, a, b, fillTab[offset + 10], S13, 0xffff5bb1)
      b = FF(b, c, d, a, fillTab[offset + 11], S14, 0x895cd7be)
      a = FF(a, b, c, d, fillTab[offset + 12], S11, 0x6b901122)
      d = FF(d, a, b, c, fillTab[offset + 13], S12, 0xfd987193)
      c = FF(c, d, a, b, fillTab[offset + 14], S13, 0xa679438e)
      b = FF(b, c, d, a, fillTab[offset + 15], S14, 0x49b40821)

      --第二轮
      a = GG(a, b, c, d, fillTab[offset + 1], S21, 0xf61e2562)
      d = GG(d, a, b, c, fillTab[offset + 6], S22, 0xc040b340)
      c = GG(c, d, a, b, fillTab[offset + 11], S23, 0x265e5a51)
      b = GG(b, c, d, a, fillTab[offset + 0], S24, 0xe9b6c7aa)
      a = GG(a, b, c, d, fillTab[offset + 5], S21, 0xd62f105d)
      d = GG(d, a, b, c, fillTab[offset + 10], S22, 0x2441453)
      c = GG(c, d, a, b, fillTab[offset + 15], S23, 0xd8a1e681)
      b = GG(b, c, d, a, fillTab[offset + 4], S24, 0xe7d3fbc8)
      a = GG(a, b, c, d, fillTab[offset + 9], S21, 0x21e1cde6)
      d = GG(d, a, b, c, fillTab[offset + 14], S22, 0xc33707d6)
      c = GG(c, d, a, b, fillTab[offset + 3], S23, 0xf4d50d87)
      b = GG(b, c, d, a, fillTab[offset + 8], S24, 0x455a14ed)
      a = GG(a, b, c, d, fillTab[offset + 13], S21, 0xa9e3e905)
      d = GG(d, a, b, c, fillTab[offset + 2], S22, 0xfcefa3f8)
      c = GG(c, d, a, b, fillTab[offset + 7], S23, 0x676f02d9)
      b = GG(b, c, d, a, fillTab[offset + 12], S24, 0x8d2a4c8a)

      --第三轮
      a = HH(a, b, c, d, fillTab[offset + 5], S31, 0xfffa3942)
      d = HH(d, a, b, c, fillTab[offset + 8], S32, 0x8771f681)
      c = HH(c, d, a, b, fillTab[offset + 11], S33, 0x6d9d6122)
      b = HH(b, c, d, a, fillTab[offset + 14], S34, 0xfde5380c)
      a = HH(a, b, c, d, fillTab[offset + 1], S31, 0xa4beea44)
      d = HH(d, a, b, c, fillTab[offset + 4], S32, 0x4bdecfa9)
      c = HH(c, d, a, b, fillTab[offset + 7], S33, 0xf6bb4b60)
      b = HH(b, c, d, a, fillTab[offset + 10], S34, 0xbebfbc70)
      a = HH(a, b, c, d, fillTab[offset + 13], S31, 0x289b7ec6)
      d = HH(d, a, b, c, fillTab[offset + 0], S32, 0xeaa127fa)
      c = HH(c, d, a, b, fillTab[offset + 3], S33, 0xd4ef3085)
      b = HH(b, c, d, a, fillTab[offset + 6], S34, 0x4881d05)
      a = HH(a, b, c, d, fillTab[offset + 9], S31, 0xd9d4d039)
      d = HH(d, a, b, c, fillTab[offset + 12], S32, 0xe6db99e5)
      c = HH(c, d, a, b, fillTab[offset + 15], S33, 0x1fa27cf8)
      b = HH(b, c, d, a, fillTab[offset + 2], S34, 0xc4ac5665)

      --第四轮
      a = II(a, b, c, d, fillTab[offset + 0], S41, 0xf4292244)
      d = II(d, a, b, c, fillTab[offset + 7], S42, 0x432aff97)
      c = II(c, d, a, b, fillTab[offset + 14], S43, 0xab9423a7)
      b = II(b, c, d, a, fillTab[offset + 5], S44, 0xfc93a039)
      a = II(a, b, c, d, fillTab[offset + 12], S41, 0x655b59c3)
      d = II(d, a, b, c, fillTab[offset + 3], S42, 0x8f0ccc92)
      c = II(c, d, a, b, fillTab[offset + 10], S43, 0xffeff47d)
      b = II(b, c, d, a, fillTab[offset + 1], S44, 0x85845dd1)
      a = II(a, b, c, d, fillTab[offset + 8], S41, 0x6fa87e4f)
      d = II(d, a, b, c, fillTab[offset + 15], S42, 0xfe2ce6e0)
      c = II(c, d, a, b, fillTab[offset + 6], S43, 0xa3014314)
      b = II(b, c, d, a, fillTab[offset + 13], S44, 0x4e0811a1)
      a = II(a, b, c, d, fillTab[offset + 4], S41, 0xf7537e82)
      d = II(d, a, b, c, fillTab[offset + 11], S42, 0xbd3af235)
      c = II(c, d, a, b, fillTab[offset + 2], S43, 0x2ad7d2bb)
      b = II(b, c, d, a, fillTab[offset + 9], S44, 0xeb86d391)

      --加入到之前计算的结果当中
      result[1] = result[1] + a
      result[2] = result[2] + b
      result[3] = result[3] + c
      result[4] = result[4] + d
      result[1] = result[1] & 0xffffffff
      result[2] = result[2] & 0xffffffff
      result[3] = result[3] & 0xffffffff
      result[4] = result[4] & 0xffffffff
    end

    --将Hash值转换成十六进制的字符串
    local retStr = ""
    for i = 1,4 do
      for _ = 1,4 do
        local temp = result[i] & 0x0F
        local str = HexTable[temp + 1]
        result[i] = result[i] >> 4
        temp = result[i] & 0x0F
        retStr = retStr .. HexTable[temp + 1] .. str
        result[i] = result[i] >> 4
      end
    end

    return retStr
  end

  function dailyNote2(retry)
    if this.getSharedData("Note_Notification")=="true" then
     else
      cancel(1)
      return true
    end

    local cookie=this.getSharedData("myscookie")

    if cookie==nil then
      sendNotification("实时便笺","你还没有登录，点击登录米游社账号并设置默认账号","1","实时便笺",
      "tools/managemys.lua",true,false,false)
      return true
    end

    function secondtostring(n)
      local day
      local dif=tointeger(os.date("%d",os.time()+n))-tointeger(os.date("%d"))
      if dif~=0 then
        if dif==1 then
          day="明天 "
         elseif dif==2 then
          day="后天 "
         else
          day=tostring(os.date("%m月%d日 ",os.time()+n))
        end
       else
        day="今天 "
      end
      return day..os.date("%H时%M分",os.time()+n)
    end

    Http.get("https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
    cookie,nil,nil,
    function(code,content)
      if code~=200 then
        sendNotification("实时便笺","获取失败："..code,"1","实时便笺",
        "main.lua",true,false,false)
        if retry==nil then
          dailyNote2(true)
        end
        return true
      end

      local content=JSON.decode(content)

      if content.message~="OK" then
        sendNotification("实时便笺","获取失败："..content.message,"1","实时便笺",
        "main.lua",true,false,false)
        if retry==nil then
          dailyNote2(true)
        end
        return true
      end

      local serverid
      local uid

      if #content.data.list>1 then
        serverid=content.data.list[this.getSharedData("memo_num")].region
        uid=content.data.list[this.getSharedData("memo_num")].game_uid
       else
        serverid=content.data.list[1].region
        uid=content.data.list[1].game_uid
      end

      local ds=getNewDS("role_id="..uid.."&server="..serverid)

      --print(ds)

      local map = HashMap()
      map.put("DS",ds)
      map.put("Origin","https://webstatic.mihoyo.com")
      map.put("x-rpc-app_version",mihoyobbs_Version)
      map.put("User-Agent",hoyo_ua2)
      map.put("x-rpc-client_type","5")
      map.put("x-rpc-page", "3.1.3_#/ys/deep")
      map.put("Referer","https://webstatic.mihoyo.com/")
      map.put("x-rpc-device_id",device_id)
      map.put("X-Requested-With","com.mihoyo.hyperion")

      Http.get("https://api-takumi-record.mihoyo.com/game_record/app/genshin/api/dailyNote?server="..serverid.."&role_id="..uid,
      cookie,nil,map,
      function(code,content)
        if code~=200 then
          --("请求失败，错误码："..code)
          sendNotification("实时便笺","获取失败："..code,"1","实时便笺",
          "main.lua",true,false,false)
          return true
        end

        local content=JSON.decode(content)

        if content.retcode == 0 then
          local data=content.data

          local str=""
          local function add(n)
            if str=="" then
              str=n
             else
              str=str.."\n"..n
            end
          end

          if this.getSharedData("Note_Notification_Simple")=="false"
            add("原粹树脂 "..data.current_resin.."/"..data.max_resin)
            if data.resin_recovery_time=="0" then
              add(" - 树脂溢出了呜呜呜")
             else
              add(" - 将于 "..secondtostring(tointeger(data.resin_recovery_time)).." 全部恢复")
            end
            add("每日委托 "..data.finished_task_num.."/"..data.total_task_num)
            add("探索派遣 "..data.current_expedition_num.."/"..data.max_expedition_num)

            local expedition_stime=0

            for i,v in pairs(data.expeditions) do
              if tointeger(v.remained_time)>expedition_stime then
                expedition_stime=tointeger(v.remained_time)
              end
            end

            if expedition_stime==0 then
              add(" - 派遣已经全部完成了")
             else
              add(" - 将于 "..secondtostring(tointeger(expedition_stime)).." 全部完成")
            end
            add("洞天宝钱 "..data.current_home_coin.."/"..data.max_home_coin)
            add("周本减半 "..data.remain_resin_discount_num.."/"..data.resin_discount_num_limit)

            if data.transformer.obtained
              if data.transformer.recovery_time.reached
                add("参量质变仪 可使用")
               else
                add("参量质变仪 冷却中")
                local transformertime=data.transformer.recovery_time
                add(" - 将在 "..transformertime.Day.."天 后恢复")
              end
             else
              add("参量质变仪 未获得")
            end

            add("（每"..tostring(this.getSharedData("Note_Time")).."分钟刷新一次）")
           else
            if data.resin_recovery_time=="0" then
              add("树脂 "..data.current_resin.."/"..data.max_resin.." - 已回满")
             else
              add("树脂 "..data.current_resin.."/"..data.max_resin.." - "..secondtostring(tointeger(data.resin_recovery_time)).." 回满")
            end

            local expedition_stime=0
            for i,v in pairs(data.expeditions) do
              if tointeger(v.remained_time)>expedition_stime then
                expedition_stime=tointeger(v.remained_time)
              end
            end
            if expedition_stime==0 then
              add("派遣 "..data.current_expedition_num.."/"..data.max_expedition_num.." - 已完成")
             else
              add("派遣 "..data.current_expedition_num.."/"..data.max_expedition_num.." - "..secondtostring(tointeger(expedition_stime)).." 完成")
            end

            add("委托 "..data.finished_task_num.."/"..data.total_task_num)
            add("宝钱 "..data.current_home_coin.."/"..data.max_home_coin)
            add("周本 "..(3-data.remain_resin_discount_num).."/"..data.resin_discount_num_limit)

            if data.transformer.obtained
              if data.transformer.recovery_time.reached
                add("质变仪 - 可使用")
               else
                local transformertime=data.transformer.recovery_time
                add("质变仪 - "..transformertime.Day.."天 后恢复")
              end
             else
            end

            add("")
            add("（每"..tostring(this.getSharedData("Note_Time")).."分钟刷新一次）")
          end

          if tointeger(data.current_resin)<lastresin then
            lastresin=0
          end

          import "android.util.Log"

          Log.d("NoteService",tostring("树脂 "..lastresin.."->"..tointeger(data.current_resin)))

          if tointeger(data.current_resin)==40 or tointeger(data.current_resin)==80 or tointeger(data.current_resin)==120 then
            if lastresin~=tointeger(data.current_resin) then
              Log.d("NoteService",tostring("树脂提醒 "..lastresin.."->"..tointeger(data.current_resin)))
              sendNotification("树脂提醒","你的原粹树脂已恢复到 "..data.current_resin,"2","树脂提醒",
              "main.lua",false,true,true)
            end
          end

          if tointeger(data.current_resin)==159 then
            if lastresin~=tointeger(data.current_resin) then
              Log.d("NoteService",tostring("树脂提醒 "..lastresin.."->"..tointeger(data.current_resin)))
              sendNotification("树脂提醒","你的原粹树脂马上就要满了，已恢复到 "..data.current_resin,"2","树脂提醒",
              "main.lua",false,true,true)
            end
          end

          if tointeger(data.current_resin)==160 then
            if lastresin~=tointeger(data.current_resin) then
              Log.d("NoteService",tostring("树脂满了 "..lastresin.."->"..tointeger(data.current_resin)))
              sendNotification("树脂提醒","你的原粹树脂满了！溢出了呜呜呜","2","树脂提醒",
              "main.lua",false,true,true)
            end
          end
          lastresin=tointeger(data.current_resin)

          sendNotification("实时便笺",str,"1","实时便笺",
          "main.lua",true,false,false)
         else

          if content.message:find("not public") or content.message:find("Data not") then
            sendNotification("实时便笺","获取失败："..content.message.."\n请到米游社内找到 我的-我的角色-实时便笺 开启实时便笺功能","1","实时便笺",
            "main.lua",true,false,false)
            return true
          end
          if content.retcode == 1034 then
            sendNotification("实时便笺","获取失败：请到米游社内查看实时便笺过验证","1","实时便笺",
            "main.lua",true,false,false)
            return true
          end

          sendNotification("实时便笺","获取失败：错误码 "..content.retcode.."；错误信息 "..content.message,"1","实时便笺",
          "main.lua",true,false,false)
        end
      end)

    end)
  end

  function mys_signIn()
    local all_uid={}--所有游戏角色
    local cookies
    local cookies_format={}--所有cookie

    local gotuid=0--已经获取过uid
    local signed=0--签到过的
    local haserror = false

    local act_id

    local sign_results={}--签到结果

    local signok=0

    xpcall(function()
      cookies = JSON.decode(this.getSharedData("myscookies"))
    end,
    function(e)
      this.setSharedData("myscookies", JSON.encode({}))
      cookies = JSON.decode(this.getSharedData("myscookies"))
    end)

    for i,v in pairs(cookies)
      cookies_format[#cookies_format+1]={i,v}
    end

    if #cookies_format == 0 then
      sendNotification("自动签到","请先登录米游社账号","3","自动签到",
      "tools/managemys.lua",false,true,true)
      return true
    end
    issigning = true
    sendNotification("正在签到…","正在获取签到信息","4","正在签到",
    "",false,false,false)


    function signIn()
      signed=signed+1
      sendNotification("正在签到…","正在签到: "..signed.."/"..#all_uid,"4","正在签到",
      "",false,false,false)

      local nickname,uid,region,region_name,nam,cookie=
      all_uid[signed][1],all_uid[signed][2],
      all_uid[signed][3],all_uid[signed][4],
      all_uid[signed][5],all_uid[signed][6]

      local function next()
        local nextTicker=Ticker()
        nextTicker.Period=1000
        nextTicker.onTick=function()
          nextTicker.stop()
          if signed+1<=#all_uid
            signIn()
           else
            for i,v in ipairs(sign_results)
              if v[2]:find("签到过了") or v[2]:find("成功") or v[2]:find("签到过啦")
                signok=signok+1
              end
            end

            cancel(4)
            this.setSharedData("signresult", JSON.encode(sign_results))
            this.setSharedData("sign_act_id", act_id)
            sendNotification("自动签到结果","成功: "..signok.." 失败: "..(#all_uid-signok).."  点击查看详情","3","自动签到",
            "tools/signreturn.lua",false,true,true)
          end
        end
        nextTicker.start()
      end

      Http.get("https://api-takumi.mihoyo.com/event/bbs_sign_reward/info?region=" ..
      region .. "&act_id=" .. act_id .. "&uid=" .. uid,
      cookie,nil,nil,function(code, content)
        local content = JSON.decode(content)
        --printLog("BBS Sign","get sign info",code, content)
        --[[data={
                ["message"] = "OK" ;
                ["data"] = {
                  ["total_sign_day"] = 3 ;
                  ["month_first"] = false ;
                  ["first_bind"] = false ;
                  ["is_sign"] = true ;
                  ["is_sub"] = false ;
                  ["today"] = "2021-08-03" ;
                } ;
                ["retcode"] = 0 ;
              };]]
        xpcall(function()
          local data = content.data

          local calendar = Calendar.getInstance()
          local month = calendar.get(Calendar.MONTH) + 1
          local day = calendar.get(Calendar.DAY_OF_MONTH)

          local is_sign=content.data.is_sign
          local sign_cnt_missed=content.data.sign_cnt_missed

          local total_sign_day

          if is_sign
            total_sign_day = data.total_sign_day
           else
            total_sign_day = data.total_sign_day+1
          end

          Http.get(
          "https://api-takumi.mihoyo.com/event/bbs_sign_reward/home?act_id=" .. act_id,
          cookie,nil,nil,function(code, all_sign_content)
            --printLog("BBS Sign","get final",code, content)
            if code ~= 200 then
              if code == 427 then
                sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","请求失败，短时间内请求过多，请稍后再试",cookie}
                next()
                haserror=true
                return true
              end
              sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","请求失败，错误码：" .. code,cookie}
              next()
              haserror=true
              return true
            end
            all_sign_content = JSON.decode(all_sign_content)

            if is_sign==true
              sign_results[#sign_results+1]={nickname .. "  UID: " .. uid .." (".. region_name..")",[[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. "今天已经签到过啦",cookie}
              --printLog("BBS Sign",signin_table_2)
              --printLog("BBS Sign",nickname .. "  UID: " .. uid,"重复签到")
              next()
             else
              local ds = getDS()

              --print(ds)

              local map = HashMap()
              map.put("Origin", "https://webstatic.mihoyo.com")
              map.put("x-rpc-app_version", mihoyobbs_Version)
              map.put("User-Agent",hoyo_ua1)
              map.put("x-rpc-client_type", mihoyobbs_Client_type_web)
              map.put("Referer", "https://webstatic.mihoyo.com/bbs/event/signin-ys/index.html?bbs_auth_required=true&act_id="..act_id.."&utm_source=bbs&utm_medium=mys&utm_campaign=icon")
              map.put("x-rpc-device_id",device_id)
              map.put("X-Requested-With", "com.mihoyo.hyperion")
              map.put("Content-Type", "application/json")

              map.put("DS", ds)

              Http.post("https://api-takumi.mihoyo.com/event/bbs_sign_reward/sign",
              JSON.encode({
                ["act_id"] = act_id,
                ["uid"] = uid,
                ["region"] = region
                }),cookie,nil,map,function(code, content)
                --printLog("BBS Sign","sign",code)
                if code ~= 200 then
                  sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","请求失败，错误码：" .. code,cookie}
                  next()
                  haserror=true
                  return true
                end
                local content = JSON.decode(content)
                --printLog("BBS Sign","sign_dump",code, dump(content))
                local message = content.message
                local data=content.data
                if data
                  if content.retcode == 0 and data.success==0 then
                    message = "签到成功"
                    --printLog("BBS Sign",nickname .. "  UID: " .. uid,"签到成功")
                    sign_results[#sign_results+1]={nickname .. "  UID: " .. uid.." (".. region_name..")", [[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                      all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. message,cookie}
                    next()
                   else
                    if data.success == 1
                      capacha_challenge=data.challenge
                      capacha_gt=data.gt
                      message = "通过验证码失败，若重新签到还一直失败就去米游社手动签吧"
                      --printLog("BBS Sign",nickname .. "  UID: " .. uid,"需要验证码")
                      --处理验证码

                      sendNotification("正在签到…","正在签到: "..signed.."/"..#all_uid
                      .."\n需要验证码，正在尝试通过","4","正在签到",
                      "",false,false,false)
                      if capacha_challenge and capacha_gt
                        Http.get("https://api.geetest.com/ajax.php?gt="..capacha_gt.."&challenge="..capacha_challenge.."&lang=zh-cn&pt=3&client_type=web_mobile&callback=geetest_1663984420850",
                        function(code,content)
                          if code==200
                            local content=content:match("%((.-)%)")
                            local content = JSON.decode(content)
                            --printLog("Capacha",content)
                            local validate=content.data.validate
                            if validate
                              --printLog("Capacha","start")
                              local ds = getDS()--验证码请求 start

                              --print(ds)

                              local map = HashMap()
                              map.put("Origin", "https://webstatic.mihoyo.com")
                              map.put("x-rpc-app_version", mihoyobbs_Version)
                              map.put("User-Agent",hoyo_ua1)
                              map.put("x-rpc-client_type", mihoyobbs_Client_type_web)
                              map.put("Referer", "https://webstatic.mihoyo.com/bbs/event/signin-ys/index.html?bbs_auth_required=true&act_id="..act_id.."&utm_source=bbs&utm_medium=mys&utm_campaign=icon")
                              map.put("x-rpc-device_id",device_id)
                              map.put("X-Requested-With", "com.mihoyo.hyperion")
                              map.put("Content-Type", "application/json")

                              map.put("x-rpc-validate", validate)
                              map.put("x-rpc-challenge", capacha_challenge)
                              map.put("x-rpc-seccode", validate.."%7Cjordan")

                              map.put("DS", ds)

                              Http.post("https://api-takumi.mihoyo.com/event/bbs_sign_reward/sign",
                              JSON.encode({
                                ["act_id"] = act_id,
                                ["uid"] = uid,
                                ["region"] = region
                                }),cookie,nil,map,function(code, content)
                                --printLog("BBS Sign","sign",code)
                                if code ~= 200 then
                                  sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","请求失败，错误码：" .. code,cookie}
                                  next()
                                  haserror=true
                                  return true
                                end
                                local content = JSON.decode(content)
                                --printLog("BBS Sign","sign_dump",code, dump(content))
                                local message = content.message
                                local data=content.data
                                if data
                                  if content.retcode == 0 and data.success==0 then
                                    message = "签到成功"
                                    --printLog("BBS Sign",nickname .. "  UID: " .. uid,"签到成功")
                                    sign_results[#sign_results+1]={nickname .. "  UID: " .. uid.." (".. region_name..")", [[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                                      all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. message,cookie}
                                    next()
                                   else
                                    if data.success == 1
                                      capacha_challenge=data.challenge
                                      capacha_gt=data.gt
                                      message = "通过验证码失败，若重新签到还一直失败就去米游社手动签吧"
                                      --printLog("BBS Sign",nickname .. "  UID: " .. uid,"通过验证码失败")

                                      sign_results[#sign_results+1]={nickname .. "  UID: " .. uid.." (".. region_name..")", [[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                                        all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day-1 .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. message,cookie}
                                      next()
                                      haserror=true
                                    end
                                  end
                                end

                              end)--验证码请求 end

                             else
                              sign_results[#sign_results+1]={nickname .. "  UID: " .. uid.." (".. region_name..")", [[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                                all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day-1 .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. message,cookie}
                              next()
                              haserror=true
                            end
                           else
                            sign_results[#sign_results+1]={nickname .. "  UID: " .. uid.." (".. region_name..")", [[今日奖励: ]].. all_sign_content.data.awards[total_sign_day].name .. [[ × ]] ..
                              all_sign_content.data.awards[total_sign_day].cnt .. [[ 
本月累签: ]].. total_sign_day-1 .. [[ 天
本月漏签: ]].. sign_cnt_missed .. [[ 天
签到结果: ]].. message,cookie}
                            next()
                            haserror=true
                          end
                        end)
                        return true
                      end
                    end
                  end
                end

              end)

            end
          end)

          end,function(e)
          haserror=true
          if content.retcode == -100 then
            sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","登录状态失效(签到的状态检测更加严格)，请重新登录",cookie}
            next()
            return true
          end
          if content.retcode == -1004 then
            sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","触发签到速度限制，请稍后再试",cookie}
            next()
            return true
          end
          sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","请求失败，未知错误："..dump(content),cookie}
          next()
          return true
        end)
      end)
    end

    function getUids()
      gotuid=gotuid+1
      sendNotification("正在签到…","正在获取UID: "..gotuid.."/"..#cookies_format,"4","正在签到",
      "",false,false,false)

      local nam,cookie = cookies_format[gotuid][1], cookies_format[gotuid][2]

      local function next()
        local nextTicker=Ticker()
        nextTicker.Period=200
        nextTicker.onTick=function()
          nextTicker.stop()
          if gotuid+1<=#cookies_format
            getUids()
           else
            --printLog("getUids",all_uid)
            signIn()
          end
        end
        nextTicker.start()
      end

      Http.get("https://api-takumi.mihoyo.com/binding/api/getUserGameRolesByCookie?game_biz=hk4e_cn",
      cookie,nil,nil,function(code, content)
        if code ~= 200 then
          sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败","获取账号信息失败，错误码："..code,cookie}
          next()
          haserror=true
          return true
        end
        local content = JSON.decode(content)

        if content.data == nil then
          sign_results[#sign_results+1]={"账号 " .. nam .. " 签到失败",content.message,cookie}
          next()
          haserror=true
          return true
        end
        for i0, v0 in ipairs(content.data.list) do
          local data = content.data.list[i0]
          local nickname = data.nickname
          local uid = data.game_uid
          local region = data.region
          local region_name = data.region_name
          --[[data={
                  ["level"] = 55 ;
                  ["is_official"] = true ;
                  ["region_name"] = "天空岛" ;
                  ["is_chosen"] = false ;
                  ["game_uid"] = "114640851" ;
                  ["nickname"] = "喵嗷呜汪qwq" ;
                  ["game_biz"] = "hk4e_cn" ;
                  ["region"] = "cn_gf01" ;
                }]]
          all_uid[#all_uid+1]={nickname,uid,region,region_name,nam,cookie}
        end
        next()
      end)
    end

    Http.get("https://bbs-api.mihoyo.com/apihub/api/home/new?cpu=mt6785v/cc&device=Xiaomi%20Redmi%20Note%208%20Pro&gids=2",
    function(code, content)
      if code ~= 200 then
        haserror=true
        for i,v in ipairs(sign_results)
          if v:find("签到过了") or n:find("成功") or n:find("签到过啦")
            signok=signok+1
          end
        end

        cancel(4)
        this.setSharedData("signresult", JSON.encode(sign_results))
        this.setSharedData("sign_act_id", act_id)
        --this.setSharedData("signresult", signres)
        sendNotification("自动签到结果","全部签到失败\n获取签到信息失败，错误码："..code,"3","自动签到",
        "tools/signreturn.lua",false,true,true)
        return true
      end
      local content = JSON.decode(content)
      for i, v in ipairs(content.data.navigator) do
        if v.name == "签到福利" then
          local data = split(v.app_path:match("%?(.+)"), "&")
          for i, v in pairs(data) do
            if v:find("act_id") then
              act_id = v:match("=(.+)")
              --act_id 获取成功
              getUids()
            end
          end
        end
      end
    end)

  end

  function cancel(id)
    local mNManager = this.getSystemService(Context.NOTIFICATION_SERVICE)
    mNManager.cancel(id)
  end

  end,function(e)
  import "android.util.Log"
  Log.i("ServiceError",tostring(e))
end)

function openService()
  opened=true
  if tidailyNote2
    pcall(function()
      tidailyNote2.stop()
    end)
  end
  tidailyNote2=Ticker()
  tidailyNote2.Period=tointeger(this.getSharedData("Note_Time"))*60*1000
  tidailyNote2.onTick=function()
    dailyNote2()
  end
  tidailyNote2.start()
  dailyNote2()

  if autoSign
    pcall(function()
      autoSign.stop()
    end)
  end
  autoSign=Ticker()
  autoSign.Period=1*60*1000
  autoSign.onTick=function()
    if tointeger(os.date("%H"))>=8 and tointeger(os.date("%H"))<=22
      if tointeger(os.date("%M"))==00
        if this.getSharedData("Note_Auto_Sign")=="true"
          mys_signIn()
        end
      end
    end
  end
  autoSign.start()
  if this.getSharedData("Note_Auto_Sign2")=="true"
    mys_signIn()
  end
end

function closeService()
  pcall(function()
    cancel(1)
    cancel(4)
  end)
  pcall(function()
    tidailyNote2.stop()
  end)
  pcall(function()
    autoSign.stop()
  end)
end

openService()