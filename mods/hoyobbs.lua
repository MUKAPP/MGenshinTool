--# 米游社的Salt
mihoyobbs_Salt = "t0qEgfub6cvueAPgR5m9aQWWVciEer7v"--X6
mihoyobbs_Salt2 = "fdv0fY9My9eA7MR0NpjGP9RjueFvjUSQ" --K2
mihoyobbs_Salt_web = "jEpJb9rRARU2rXDA9qYbZ3selxkuct9a" --LK2
mihoyobbs_Salt_login = "JwYDpKvLj6MrMqqYU6jTKF17KNO2PXoS" --PROD
--X4 xV8v4Qu44lUKrEYFZkJhB8cuOh9Asafs
--# 米游社的版本
mihoyobbs_Version = "2.40.1" --# Salt和Version相互对应
--# 米游社的客户端类型
mihoyobbs_Client_type = "2" --# 1为ios 2为安卓
mihoyobbs_Client_type_web = "5" --# 4为pc web 5为mobile web
--# 云原神版本
cloudgenshin_Version = "3.0.0"

hoyo_ua1="Mozilla/5.0 (Linux; Android "..Build.VERSION.RELEASE.."; "..Build.MODEL.." Build/"..Build.DISPLAY.."; wv) "
.."AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36"
.." miHoYoBBS/"..mihoyobbs_Version
hoyo_ua2=hoyo_ua1

function getDS(q,b)
  local b = b or ""
  local q = q or ""

  local i = tostring(tointeger(os.time()))

  local ascii_lowercase_digits = {
    "0","1","2","3","4","5",
    "6","7","8","9",
    "a","b","c","d",
    "e","f","g","h",
    "i","j","k","l",
    "m","n","o","p",
    "q","r","s","t",
    "u","v","w","x",
    "y","z"
  }
  local r = ""

  for i = 1, 6 do
    local ran = math.random(1, #ascii_lowercase_digits)
    r = r .. ascii_lowercase_digits[ran]
    table.remove(ascii_lowercase_digits, ran)
  end

  local c = string.lower(MD5("salt="..mihoyobbs_Salt_web.."&t=" .. i .. "&r=" .. r))
  return i .. "," .. r .. "," .. c
end

function getNewDS(q, b)
  local b = b or ""
  local q = q or ""

  local i = tostring(tointeger(os.time()))

  local r = tostring(math.random(100000, 200000))

  local c =
  string.lower(MD5("salt=xV8v4Qu54lUKrEYFZkJhB8cuOh9Asafs&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
  return i .. "," .. r .. "," .. c
end

function getDS2(q, b)
  local b = b or ""
  local q = q or ""

  local i = tostring(tointeger(os.time()))

  local r = tostring(math.random(100000, 200000))

  local c =
  string.lower(MD5("salt="..mihoyobbs_Salt.."&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
  return i .. "," .. r .. "," .. c
end

function getLoginDS(q)
  local b = "{}"
  local q = q or ""

  local i = tostring(tointeger(os.time()))

  local r = tostring(math.random(100000, 200000))

  local c =
  string.lower(MD5("salt="..mihoyobbs_Salt_login.."&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
  return i .. "," .. r .. "," .. c
end

SOURCE = "webstatic.mihoyo.com"
BBSAPI = "https://bbs-api.mihoyo.com"
SDKAPI = "https://api-sdk.mihoyo.com"
HK4API = "https://hk4e-api.mihoyo.com"
WEBAPI = "https://webapi.account.mihoyo.com/Api"
RECAPI = "https://api-takumi-record.mihoyo.com/game_record/app"
TAKUMI_AUTH_API = "https://api-takumi.mihoyo.com/auth/api"
TAKUMI_BINDING_API = "https://api-takumi.mihoyo.com/binding/api"

function checkMobileRegistered(phoneNumber,ret)
  local currentTimeMills=os.time()
  local url = WEBAPI .. "/is_mobile_registrable?mobile="..phoneNumber.."&t="..currentTimeMills
  Http.get(url,nil,nil,function(code,content)
    if code==200 then
      local json = JSON.decode(content)
      if json.code==0 then
        if json.data.is_registrable then
          ret(true)
         else
          ret(false)
        end
       else
        ret(nil,json.msg)
      end
     else
      ret(nil,"网络错误")
    end
  end)
end