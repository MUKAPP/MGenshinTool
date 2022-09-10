--# 米游社的Salt
mihoyobbs_Salt = "n0KjuIrKgLHh08LWSCYP0WXlVXaYvV64"
mihoyobbs_Salt2 = "t0qEgfub6cvueAPgR5m9aQWWVciEer7v"
mihoyobbs_Salt_web = "YVEIkzDFNHLeKXLxzqCA9TzxCpWwbIbk"
--# 米游社的版本
mihoyobbs_Version = "2.36.1"  --# Slat和Version相互对应
--# 米游社的客户端类型
mihoyobbs_Client_type = "2"  --# 1为ios 2为安卓
mihoyobbs_Client_type_web = "5"  --# 4为pc web 5为mobile web
--# 云原神版本
cloudgenshin_Version = "3.0.0"

function getDS()
  local i = tostring(tointeger(os.time()))

  local ascii_lowercase_digits = {
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
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