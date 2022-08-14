mihoyobbs_Salt = "z8DRIUjNDT7IT5IZXvrUAxyupA1peND9"
mihoyobbs_Salt_web = "9nQiU3AV0rJSIBWgdynfoGMGKaklfbM7"
mihoyobbs_Salt_web_old = "h8w582wxwgqvahcdkpvdhbh2w9casgfl"
-- 米游社的版本
mihoyobbs_Version = "2.34.1" -- salt和Version相互对应
mihoyobbs_Version_old = "2.3.0"
-- 米游社的客户端类型
mihoyobbs_Client_type = "2" -- 1为ios 2为安卓


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


function checkMobileRegistered()
  end