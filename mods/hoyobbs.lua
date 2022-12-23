--# 米游社的Salt
mihoyobbs_Salt = "t0qEgfub6cvueAPgR5m9aQWWVciEer7v" --X6
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

hoyo_ua1 = "Mozilla/5.0 (Linux; Android " ..
    Build.VERSION.RELEASE .. "; " .. Build.MODEL .. " Build/" .. Build.DISPLAY .. "; wv) "
    .. "AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36"
    .. " miHoYoBBS/" .. mihoyobbs_Version
hoyo_ua2 = hoyo_ua1

function getDS(q, b)
    local b = b or ""
    local q = q or ""

    local i = tostring(tointeger(os.time()))

    local ascii_lowercase_digits = {
        "0", "1", "2", "3", "4", "5",
        "6", "7", "8", "9",
        "a", "b", "c", "d",
        "e", "f", "g", "h",
        "i", "j", "k", "l",
        "m", "n", "o", "p",
        "q", "r", "s", "t",
        "u", "v", "w", "x",
        "y", "z"
    }
    local r = ""

    for i = 1, 6 do
        local ran = math.random(1, #ascii_lowercase_digits)
        r = r .. ascii_lowercase_digits[ran]
        table.remove(ascii_lowercase_digits, ran)
    end

    local c = string.lower(MD5("salt=" .. mihoyobbs_Salt_web .. "&t=" .. i .. "&r=" .. r))
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
    string.lower(MD5("salt=" .. mihoyobbs_Salt .. "&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
    return i .. "," .. r .. "," .. c
end

function getDS3(q, b)
    local b = b or ""
    local q = q or ""

    local i = tostring(tointeger(os.time()))

    local r = tostring(math.random(100000, 200000))

    local c =
    string.lower(MD5("salt=" .. mihoyobbs_Salt2 .. "&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
    return i .. "," .. r .. "," .. c
end

function getLoginDS(q)
    local b = "{}"
    local q = q or ""

    local i = tostring(tointeger(os.time()))

    local r = tostring(math.random(100000, 200000))

    local c =
    string.lower(MD5("salt=" .. mihoyobbs_Salt_login .. "&t=" .. i .. "&r=" .. r .. "&b=" .. b .. "&q=" .. q))
    return i .. "," .. r .. "," .. c
end

ApiGeetest = "https://api.geetest.com";
ApiV6Geetest = "https://apiv6.geetest.com";

ApiTakumi = "https://api-takumi.mihoyo.com";
ApiTakumiAuthApi = ApiTakumi .. "/auth/api";
ApiTaKumiBindingApi = ApiTakumi .. "/binding/api";

ApiTakumiRecord = "https://api-takumi-record.mihoyo.com";
ApiTakumiRecordApi = ApiTakumiRecord .. "/game_record/app/genshin/api";

ApiTakumiCardApi = ApiTakumiRecord .. "/game_record/app/card/api";
ApiTakumiCardWApi = ApiTakumiRecord .. "/game_record/app/card/wapi";

App = "https://app.mihoyo.com";
AppAuthApi = App .. "/account/auth/api";

BbsApi = "https://bbs-api.mihoyo.com";
BbsApiUserApi = BbsApi .. "/user/wapi";

Hk4eApi = "https://hk4e-api.mihoyo.com";
Hk4eApiAnnouncementApi = Hk4eApi .. "/common/hk4e_cn/announcement/api";
Hk4eApiGachaInfoApi = Hk4eApi .. "/event/gacha_info/api";

PassportApi = "https://passport-api.mihoyo.com";
PassportApiAuthApi = PassportApi .. "/account/auth/api";
PassportApiV4 = "https://passport-api-v4.mihoyo.com";

SdkStatic = "https://sdk-static.mihoyo.com";
SdkStaticLauncherApi = SdkStatic .. "/hk4e_cn/mdk/launcher/api";

AnnouncementQuery = "game=hk4e&game_biz=hk4e_cn&lang=zh-cn&bundle_id=hk4e_cn&platform=pc&region=cn_gf01&level=55&uid=100000000";

---分割Cookie
---@type table
---@param cookie string 要分割的Cookie
function cookieSplit(cookie)
    cookie = cookie:gsub(" ", "")
    local cookieTable = {}
    local cookieTableBefore = mukutils.split(cookie, ";")
    for i, v in ipairs(cookieTableBefore) do
        cookieTable[v:match("^(.-)%=")] = v:match("%=(.+)")
    end
    return cookieTable
end

function mergeSplit(cookieTable)
    local cookie = ""
    for i, v in pairs(cookieTable) do
        if cookie ~= "" then
            cookie = cookie .. ";" .. i .. "=" .. v
        else
            cookie = i .. "=" .. v
        end
    end
    return cookie
end
