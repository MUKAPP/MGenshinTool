require "import"
--import "mods.chooser"
Toast = nil
--import "android.widget.*"
import "mods.imports"
import "mods.mukmod"
import "mods.loadlayout"
loadstring([[JSON=import "mods.json"]])()

mukactivity.setDataR("Language", "Simplified_Chinese")
mukactivity.setDataR("Navigation_Bar_Height", "true")

import "mods.language"

--print(mukactivity.getData("Language"))
setLanguage(mukactivity.getData("Language"))

import "android.graphics.Typeface"
import "java.io.File"

---获取字体 Typeface
---@param fontName string 字体名称
---@return Typeface
function 字体(fontName)
    return Typeface.createFromFile(File(activity.getLuaDir() .. "/res/" .. fontName .. ".ttf"))
end

---应用字体
---@type table
AppFont = {
    ["淡体"] = 字体("Jost-Thin"),
    ["特细"] = 字体("Jost-ExtraLight"),
    ["细体"] = 字体("Jost-Light"),
    --次细
    ["标准"] = 字体("Jost-Regular"),
    ["适中"] = 字体("Jost-Medium"),
    --次粗
    ["粗体"] = 字体("Jost-SemiBold"),
    ["特粗"] = 字体("Jost-Bold"),
    ["浓体"] = 字体("Jost-Black"),
    --特浓
    ["淡体斜"] = 字体("Jost-ThinItalic"),
    ["特细斜"] = 字体("Jost-ExtraLightItalic"),
    ["细体斜"] = 字体("Jost-LightItalic"),
    --次细斜
    ["斜体"] = 字体("Jost-Italic"),
    ["适中斜"] = 字体("Jost-MediumItalic"),
    --次粗斜
    ["粗体斜"] = 字体("Jost-SemiBoldItalic"),
    ["特粗斜"] = 字体("Jost-BoldItalic"),
    ["浓体斜"] = 字体("Jost-BlackItalic")
    --特浓斜
}

开发者模式 = mukactivity.getData("Setting_Developer_Mode")

if 开发者模式 == "true" then
    loadstring([[clog=import "mods.clog"]])()
    printLog("提示", "开发者模式已开启，你可以前往设置关闭开发者模式。")
else
    function printLog()
    end
end

--[[
CrashUtils.init({
  onCrash=function(crashInfo,e)
    print(crashInfo,e)
  end,
})
]]

状态栏高度 = activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
--导航栏高度=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().navigation_bar_height)

function getNavigationBarHeight(context)
    local rid = context.resources.getIdentifier("config_showNavigationBar", "bool", "android")
    if (rid ~= 0) then
        resourceId = context.resources.getIdentifier("navigation_bar_height", "dimen", "android")
        return context.resources.getDimensionPixelSize(resourceId)
    else
        return 0
    end
end

function isEdgeToEdgeEnabled(context)
    resources = context.getResources()
    resourceId = resources.getIdentifier("config_navBarInteractionMode", "integer", "android")
    if (resourceId > 0) then
        return resources.getInteger(resourceId)
    end
    return 0
end

if isEdgeToEdgeEnabled(activity) == 2 then
    --0 普通三按钮
    --1 胶囊双按钮
    --2 手势
    导航栏高度 = getNavigationBarHeight(activity)
else
    导航栏高度 = getNavigationBarHeight(activity)
end

import "android.graphics.Point"
local outSize = Point()
activity.getWindowManager().getDefaultDisplay().getRealSize(outSize)
screenX = outSize.x
screenY = outSize.y

mukactivity.setDataR("dscreenX", screenX)
mukactivity.setDataR("dscreenY", screenY)

厂商 = Build.BRAND
型号 = Build.MODEL
SDK版本 = tonumber(Build.VERSION.SDK)
安卓版本 = Build.VERSION.RELEASE
ROM类型 = string.upper(Build.MANUFACTURER)
内部存储路径 = Environment.getExternalStorageDirectory().toString() .. "/"
xpcall(function()
    import "android.provider.Settings$Secure"
    安卓ID = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
end, function(e)
    安卓ID = ""
end)

import "com.blankj.utilcode.util.*"
ImageUtils = nil
import "com.blankj.utilcode.util.ImageUtils"

是否是手机 = PhoneUtils.isPhone()
ROM信息 = RomUtils.getRomInfo().name .. " " .. RomUtils.getRomInfo().version

应用版本名 =
activity.getPackageManager().getPackageInfo(activity.getPackageName(), PackageManager.GET_ACTIVITIES).versionName
应用版本 = activity.getPackageManager().getPackageInfo(activity.getPackageName(), PackageManager.GET_ACTIVITIES).versionCode
应用包名 = activity.getPackageName()

mukvar = {
    onLayoutLoaded = {},
    textColorMode = {}
}

printLog("Phone Info",
    "BRAND: " .. 厂商,
    "MODEL: " .. 型号,
    "SDK: " .. SDK版本,
    "RELEASE: " .. 安卓版本,
    "MANUFACTURER: " .. ROM类型,
    "ROMINFO: " .. ROM信息,
    "ANDROID_ID: " .. 安卓ID,
    "ISPHONE: " .. tostring(是否是手机))

function 状态栏颜色(n, n1, n2, n3)
    pcall(
        function()
            local window = activity.getWindow()
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
            window.setStatusBarColor(n)
            statusbarcolor = n
            if SDK版本 >= 23 then
                if n1 == false then
                    return true
                end
                if n == 0x3f000000 then
                    window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
                    window.setStatusBarColor(0xffffffff)
                else
                    window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE)
                    window.setStatusBarColor(n)
                end
            end
            if SDK版本 >= 23 then
                if n1 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR |
                        View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    )
                elseif n2 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    )
                elseif n3 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
                    )
                end
            end
        end
    )
end

function 导航栏颜色(n, n1)
    pcall(
        function()
            local window = activity.getWindow()
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
            window.setNavigationBarColor(n)
            if SDK版本 >= 23 then
                if n == 0x3f000000 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    )
                    window.setNavigationBarColor(0xffffffff)
                else
                    if n1 then
                        window.getDecorView().setSystemUiVisibility(
                            View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                        )
                    else
                        window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE)
                    end
                    window.setNavigationBarColor(n)
                end
            end
        end
    )
end

function 沉浸状态栏(n1, n2, n3)
    xpcall(
        function()
            local window = activity.getWindow()
            xpcall(
                function()
                    window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
                    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
                    window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
                    window.setStatusBarColor(0x00000000)
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    )
                end,
                function()
                    window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
                end
            )
            if SDK版本 >= 23 then
                if n1 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR |
                        View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    )
                elseif n2 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                    )
                elseif n3 then
                    window.getDecorView().setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                        View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
                    )
                end
            end
        end,
        function(e)
            printLog(nil, e)
        end
    )
end

import "android.util.TypedValue"
function tvc()
    local type = {
        px = "COMPLEX_UNIT_PX",
        dp = "COMPLEX_UNIT_DIP",
        sp = "COMPLEX_UNIT_SP",
        pt = "COMPLEX_UNIT_PT"
    }
    return tonumber(
        TypedValue.applyDimension(TypedValue[type[y]], tonumber(x), activity.getResources().getDisplayMetrics())
    )
end

function dp2px(dpValue)
    --local scale = activity.getResources().getDisplayMetrics().scaledDensity
    --return dpValue * scale + 0.5
    if type(dpValue) == "string" then
        if dpValue:find("dp") then
            return tonumber(dpValue:match("(.+)dp"))
        end
    end
    return ConvertUtils.dp2px(dpValue)
    --return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP,dpValue,activity.getResources().getDisplayMetrics())
end

function px2dp(pxValue)
    --local scale = activity.getResources().getDisplayMetrics().scaledDensity
    --return pxValue / scale + 0.5
    return ConvertUtils.px2dp(pxValue)
    --return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_PX, pxValue, activity.getResources().getDisplayMetrics());
end

function px2sp(pxValue)
    --local scale = activity.getResources().getDisplayMetrics().scaledDensity;
    --return pxValue / scale + 0.5
    return ConvertUtils.px2sp(pxValue)
    --return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_PX, pxValue, activity.getResources().getDisplayMetrics());
end

function sp2px(spValue)
    --local scale = activity.getResources().getDisplayMetrics().scaledDensity
    --return spValue * scale + 0.5
    return ConvertUtils.sp2px(spValue)
    --return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,dpValue,activity.getResources().getDisplayMetrics())
end

import "java.util.Calendar"
function 获取文件修改时间(path)
    local f = File(path)
    local cal = Calendar.getInstance()
    local time = f.lastModified()
    cal.setTimeInMillis(time)
    return cal.getTime().toLocaleString()
end

function 写入文件(路径, 内容, n)
    printLog("File", "写入文件", 路径, n)
    if n then
        local f = File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
        io.open(tostring(路径), "w"):write(tostring(内容)):close()
    else
        xpcall(
            function()
                local f = File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
                io.open(tostring(路径), "w"):write(tostring(内容)):close()
            end,
            function()
                提示("写入文件 " .. 路径 .. " 失败")
            end
        )
    end
end

function 读取文件(路径)
    printLog("File", "读取文件", 路径)
    if 文件是否存在(路径) then
        return io.open(路径):read("*a")
    else
        return ""
    end
end

function 读取文件夹(路径)
    printLog("File", "读取文件夹", 路径)
    local _, ret = xpcall(function()
        return luajava.astable(File(路径).listFiles())
    end,
        function()
            提示("读取文件夹 " .. 路径 .. " 失败")
            return {}
        end)
    return ret
end

import "com.androlua.LuaUtil"
function 复制文件(from, to)
    printLog("File", "复制文件", from, to)
    xpcall(
        function()
            LuaUtil.copyDir(from, to)
        end,
        function()
            提示("复制文件 从 " .. from .. " 到 " .. to .. " 失败")
        end
    )
end

function 创建文件夹(file)
    printLog("File", "创建文件夹", file)
    xpcall(
        function()
            File(file).mkdir()
        end,
        function()
            提示("创建文件夹 " .. file .. " 失败")
        end
    )
end

function 创建文件(file, n)
    printLog("File", "创建文件", file, n)
    if n then
        File(file).createNewFile()
    else
        xpcall(
            function()
                File(file).createNewFile()
            end,
            function()
                提示("创建文件 " .. file .. " 失败")
            end
        )
    end
end

function 创建多级文件夹(file)
    printLog("File", "创建多级文件夹", file)
    xpcall(
        function()
            File(file).mkdirs()
        end,
        function()
            提示("创建文件夹 " .. file .. " 失败")
        end
    )
end

创建文件夹 = 创建多级文件夹

function 文件是否存在(file)
    if file:find("noad") then
    else
        printLog("File", "判断存在", file)
    end
    return File(file).exists()
end

function 删除文件(file)
    printLog("File", "删除文件(夹)", file)
    xpcall(
        function()
            LuaUtil.rmDir(File(file))
        end,
        function()
            提示("删除文件(夹) " .. file .. " 失败")
        end
    )
end

function 文件修改时间(path)
    printLog("File", "获取文件修改时间", file)
    local f = File(path)
    local time = f.lastModified()
    f = nil
    return time
end

function 内置存储(path)
    if path then
        return Environment.getExternalStorageDirectory().toString() .. "/" .. path
    else
        return Environment.getExternalStorageDirectory().toString()
    end
end

function 压缩(from, to, name)
    printLog("File", "压缩1", from, to, name)
    ZipUtil.zip(from, to, name)
end

function 获取系统夜间模式()
    _, Re =
    xpcall(
        function()
            import "android.content.res.Configuration"
            local currentNightMode = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK
            return currentNightMode == Configuration.UI_MODE_NIGHT_YES
            --夜间模式启用
        end,
        function()
            return false
        end
    )
    return Re
end

function 主题(str)
    --str="夜"
    全局主题值 = str
    if 全局主题值 == "Pink" then
        primaryc = "#cb82be"
        secondaryc = "#51326c"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/defaultbackground.png"
        themebackgroundlight = "light"
        bwz = 0x3fffffff
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Sea" then
        primaryc = "#57a2db"
        secondaryc = "#002840"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/sea.jpg"
        themebackgroundlight = "light"
        bwz = 0x3fffffff
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Spring" then
        primaryc = "#d194c2"
        secondaryc = "#404868"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/spring.jpg"
        themebackgroundlight = "dark"
        bwz = 0x3fffffff
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Summer" then
        primaryc = "#c2ad70"
        secondaryc = "#082020"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/summer.jpg"
        themebackgroundlight = "light"
        bwz = 0x3fffffff
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Autumn" then
        primaryc = "#d6765c"
        secondaryc = "#1c0803"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/autumn.jpg"
        themebackgroundlight = "dark"
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        bwz = 0x3fffffff
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Winter" then
        primaryc = "#304038"
        secondaryc = "#E8E8F0"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#ffffffff"
        barbackgroundc = "#afffffff"
        cardbackc = "#10000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/winter.jpg"
        themebackgroundlight = "dark"
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        bwz = 0x3fffffff
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    elseif 全局主题值 == "Night" then
        if mukactivity.getData("Setting_Deeper_Night_Mode") == "true" then
            backgroundc = "#FF0D0E0F"
            barbackgroundc = "#aF0D0E0F"
            ctbackc = "#FF26272B"
            cardbackc = "#10ffffff"
            viewshaderc = "#7f000000"
            状态栏颜色(0xFF0D0E0F)
            导航栏颜色(0xFF0D0E0F)
            导航栏设置 = [[return 0xFF0D0E0F]]
            pcall(
                function()
                    local _window = activity.getWindow()
                    _window.setBackgroundDrawable(ColorDrawable(0xFF0D0E0F))
                    local _wlp = _window.getAttributes()
                    _wlp.gravity = Gravity.BOTTOM
                    _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                    _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                    _window.setAttributes(_wlp)
                    activity.setTheme(android.R.style.Theme_Material_NoActionBar)
                end
            )
        else
            backgroundc = "#FF202125"
            barbackgroundc = "#aF202125"
            ctbackc = "#FF36373B"
            cardbackc = "#14ffffff"
            viewshaderc = "#5f000000"
            状态栏颜色(0xff202125)
            导航栏颜色(0xff202125)
            导航栏设置 = [[return 0xff202125]]
            pcall(
                function()
                    local _window = activity.getWindow()
                    _window.setBackgroundDrawable(ColorDrawable(0xff202125))
                    local _wlp = _window.getAttributes()
                    _wlp.gravity = Gravity.BOTTOM
                    _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                    _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                    _window.setAttributes(_wlp)
                    activity.setTheme(android.R.style.Theme_Material_NoActionBar)
                end
            )
        end
        primaryc = "#88A8E8"
        secondaryc = "#51326c"
        textc = "#E0E0E0"
        stextc = "#9E9E9E"
        grayc = "#191919"
        notenablec = "#9E9E9E"
        themebackground = "res/night.jpg"
        themebackgroundlight = "light"
        bwz = 0x3f000000
    elseif 全局主题值 == "Star" then
        primaryc = "#FFA0B0C0"
        secondaryc = "#FF101818"
        textc = "#ffffff"
        stextc = "#E0E0E0"
        backgroundc = "#FF101818"
        ctbackc = "#eF36373B"
        barbackgroundc = "#9F101818"
        cardbackc = "#21ffffff"
        viewshaderc = "#00000000"
        grayc = "#191919"
        notenablec = "#9E9E9E"
        themebackground = "res/star.jpeg"
        themebackgroundlight = "light"
        themefullscreen = true
        bwz = 0x3f000000
        状态栏颜色(0xFF101818)
        导航栏颜色(0xFF101818)
        导航栏设置 = [[return 0xff202125]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xff202125))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_NoActionBar)
            end
        )
    elseif 全局主题值 == "M_P" then
        primaryc = "#FF603838"
        secondaryc = "#CCF6F5"
        textc = "#212121"
        stextc = "#424242"
        backgroundc = "#ffffffff"
        ctbackc = "#efffffff"
        barbackgroundc = "#9fffffff"
        cardbackc = "#21000000"
        viewshaderc = "#00000000"
        grayc = "#ECEDF1"
        notenablec = "#9E9E9E"
        themebackground = "res/mountain_pink.jpeg"
        themebackgroundlight = "dark"
        themefullscreen = true
        bwz = 0x3fffffff
        状态栏颜色(0x3f000000)
        导航栏颜色(0x3f000000, true)
        导航栏设置 = [[return 0x3f000000,true]]
        pcall(
            function()
                local _window = activity.getWindow()
                _window.setBackgroundDrawable(ColorDrawable(0xffffffff))
                local _wlp = _window.getAttributes()
                _wlp.gravity = Gravity.BOTTOM
                _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
                _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
                _window.setAttributes(_wlp)
                activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
            end
        )
    else
        mukactivity.setData("Setting_Theme", "Sea")
        print("主题设置错误,已切换为 墨海")
    end
    if themefullscreen == nil then
        themefullscreen = false
    end
end

this.window.backgroundDrawable =
LuaDrawable(
    function(ca)
        ca.drawColor(转0x(backgroundc))
    end
)

mukactivity.setDataR("Setting_Night_Mode", "false")
mukactivity.setDataR("Setting_Auto_Night_Mode", "true")
mukactivity.setDataR("Setting_Auto_Update", "true")
mukactivity.setDataR("Setting_Theme", "Sea")
mukactivity.setDataR("Starred_Tools", JSON.encode({}))
mukactivity.setDataR("Setting_Developer_Mode", "false")
mukactivity.setDataR("Setting_Deeper_Night_Mode", "false")
mukactivity.setDataR("myscookies", JSON.encode({}))

if Boolean.valueOf(mukactivity.getData("Setting_Auto_Night_Mode")) == true then
    if 获取系统夜间模式() then
        主题("Night")
    else
        主题(mukactivity.getData("Setting_Theme"))
    end
else
    if Boolean.valueOf(mukactivity.getData("Setting_Night_Mode")) == true then
        主题("Night")
    else
        主题(mukactivity.getData("Setting_Theme"))
    end
end

--print(mukactivity.getData("Setting_Night_Mode"),全局主题值)

--[[if mukactivity.getData("Setting_Home_PlayerBar")==nil then
  mukactivity.setData("Setting_Home_PlayerBar","false")
end]]
--标准
parentcardr = "16dp"
primarycardr = "8dp"
secondcardr = "6dp"
thirdcardr = "4dp"

pcall(
    function()
        activity.getActionBar().hide()
    end
)

function activity背景颜色(color)
    pcall(
        function()
            local _window = activity.getWindow()
            _window.setBackgroundDrawable(ColorDrawable(color))
            local _wlp = _window.getAttributes()
            _wlp.gravity = Gravity.BOTTOM
            _wlp.width = WindowManager.LayoutParams.MATCH_PARENT
            _wlp.height = WindowManager.LayoutParams.MATCH_PARENT --WRAP_CONTENT
            _window.setAttributes(_wlp)
        end
    )
end

function 转0x(hexValue)
    if type(hexValue) == "string" then
        if #hexValue == 7 then
            return tonumber("0xff" .. hexValue:match("#(.+)"))
        else
            return tonumber("0x" .. hexValue:match("#(.+)"))
        end
    else
        return hexValue
    end
end

---Toast
---@param text Text 要打印的文本
function 提示(text)
    local tsbj = {
        LinearLayout,
        Gravity = "bottom",
        {
            CardView,
            layout_width = "-1",
            layout_height = "-2",
            CardElevation = "0",
            CardBackgroundColor = 转0x(textc) - 0x21000000,
            Radius = "8dp",
            layout_margin = "16dp",
            layout_marginBottom = "64dp",
            {
                LinearLayout,
                layout_height = -2,
                layout_width = "-2",
                gravity = "left|center",
                padding = "16dp",
                paddingTop = "12dp",
                paddingBottom = "12dp",
                {
                    TextView,
                    textColor = 转0x(backgroundc),
                    textSize = "14sp",
                    layout_height = -2,
                    layout_width = -2,
                    text = text,
                    Typeface = AppFont.标准
                }
            }
        }
    }

    Toast.makeText(activity, t, Toast.LENGTH_SHORT).setGravity(Gravity.BOTTOM | Gravity.CENTER, 0, 0).setView(
        loadlayout(tsbj)
    ).show()
end

function Snakebar(fill)
    提示(fill)
end

function 随机数(最小值, 最大值)
    return math.random(最小值, 最大值)
end

function 设置视图(layout)
    activity.setContentView(loadlayout(layout))
end

function 信息判断(code)
    if code / 200 == 1 then
        return true
    else
        return false
    end
end

function 静态渐变(a, b, id, fx)
    if fx == "竖" then
        fx = GradientDrawable.Orientation.TOP_BOTTOM
    end
    if fx == "横" then
        fx = GradientDrawable.Orientation.LEFT_RIGHT
    end
    local drawable =
    GradientDrawable(
        fx,
        {
            --右色
            a,
            --左色
            b
        }
    )
    id.setBackgroundDrawable(drawable)
end

xpcall(function()
    ripple = activity.obtainStyledAttributes({ android.R.attr.selectableItemBackgroundBorderless }).getResourceId(0, 0)
    ripples = activity.obtainStyledAttributes({ android.R.attr.selectableItemBackground }).getResourceId(0, 0)
end, function() end)

function 波纹(id, lx)
    for i = 1, #id do
        local ripple = ripple
        local ripples = ripples
        xpcall(function()
            if lx == "圆白" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                        int { 0x3fffffff }))
                )
            end
            if lx == "方白" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                        int { 0x3fffffff }))
                )
            end
            if lx == "圆黑" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                        int { 0x3f000000 }))
                )
            end
            if lx == "方黑" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                        int { 0x3f000000 }))
                )
            end
            if lx == "圆主题" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripple).setColor(
                        ColorStateList(int[0].class { int {} }, int { 转0x(primaryc) - 0xc0000000 })
                    )
                )
            end
            if lx == "方主题" then
                id[i].setBackgroundDrawable(
                    activity.Resources.getDrawable(ripples).setColor(
                        ColorStateList(int[0].class { int {} }, int { 转0x(primaryc) - 0xc0000000 })
                    )
                )
            end
            if lx == "圆自适应" then
                if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
                    id[i].setBackgroundDrawable(
                        activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                            int { 0x3f000000 }))
                    )
                else
                    id[i].setBackgroundDrawable(
                        activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                            int { 0x3fffffff }))
                    )
                end
            end
            if lx == "方自适应" then
                if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
                    id[i].setBackgroundDrawable(
                        activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                            int { 0x3f000000 })))
                else
                    id[i].setBackgroundDrawable(
                        activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                            int { 0x3fffffff }))
                    )
                end
            end
        end,
            function(e)
                printLog(nil, "Ripple no " .. id)
                printLog(nil, e)
            end
        )
    end
end

function 波纹2(lx, col)
    local ripple = ripple
    local ripples = ripples
    local i, z = xpcall(function()
        if lx == "圆白" then
            return activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                int { 0x3fffffff }))
        end
        if lx == "方白" then
            return activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                int { 0x3fffffff }))
        end
        if lx == "圆黑" then
            return activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} },
                int { 0x3f000000 }))
        end
        if lx == "方黑" then
            return activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} },
                int { 0x3f000000 }))
        end
        if lx == "圆主题" then
            return activity.Resources.getDrawable(ripple).setColor(
                ColorStateList(int[0].class { int {} }, int { 转0x(primaryc) - 0xc0000000 })
            )
        end
        if lx == "方主题" then
            return activity.Resources.getDrawable(ripples).setColor(
                ColorStateList(int[0].class { int {} }, int { 转0x(primaryc) - 0xc0000000 })
            )
        end
        if lx == "圆自适应" then
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
                return activity.Resources.getDrawable(ripple).setColor(
                    ColorStateList(int[0].class { int {} }, int { 0x3f000000 })
                )
            else
                return activity.Resources.getDrawable(ripple).setColor(
                    ColorStateList(int[0].class { int {} }, int { 0x3fffffff })
                )
            end
        end
        if lx == "方自适应" then
            if 全局主题值 ~= "Night" and 全局主题值 ~= "Star" then
                return activity.Resources.getDrawable(ripples).setColor(
                    ColorStateList(int[0].class { int {} }, int { 0x3f000000 })
                )
            else
                return activity.Resources.getDrawable(ripples).setColor(
                    ColorStateList(int[0].class { int {} }, int { 0x3fffffff })
                )
            end
        end
        if lx == "圆" then
            return activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class { int {} }, int { col }))
        end
        if lx == "方" then
            return activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class { int {} }, int { col }))
        end
        printLog(nil, "Ripple 2 no " .. lx)
    end, function(e)
        printLog(nil, e)
    end)
    return z
end

function 控件可见(view)
    view.setVisibility(View.VISIBLE)
end

function 控件不可见(view)
    view.setVisibility(View.INVISIBLE)
end

function 控件隐藏(view)
    view.setVisibility(View.GONE)
end

function 对话框按钮颜色(dialog, button, WidgetColor)
    if button == 1 then
        dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(WidgetColor)
    elseif button == 2 then
        dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(WidgetColor)
    elseif button == 3 then
        dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(WidgetColor)
    end
end

function 关闭对话框(en)
    pcall(
        function()
            dl.onDismiss = function()
            end
        end
    )
    if en then
        en.dismiss()
    else
        an.dismiss()
    end
end

function 控件圆角(view, radiu, InsideColor)
    local drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(InsideColor)
    drawable.setCornerRadii({ radiu, radiu, radiu, radiu, radiu, radiu, radiu, radiu })
    view.setBackgroundDrawable(drawable)
end

function 双按钮对话框(bt, nr, qd, qx, qdnr, qxnr, gb)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = bt,
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                ScrollView,
                layout_width = "-1",
                layout_height = "-1",
                layout_weight = "1",
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-2",
                    textSize = "14sp",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "24dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "8dp",
                    Typeface = AppFont.标准,
                    Text = nr,
                    textColor = textc,
                    id = "sandhk_wb"
                }
            },
            {
                LinearLayout,
                orientation = "horizontal",
                layout_width = "-1",
                layout_height = "-2",
                gravity = "right|center",
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = qxnr,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        Typeface = AppFont.特粗,
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = qx,
                        textColor = stextc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                },
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = function()
                        dl.onDismiss = function()
                        end
                        qdnr()
                    end,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        Typeface = AppFont.特粗,
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = qd,
                        textColor = backgroundc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
        dl.onDismiss = function()
            an = dl.show()
        end
    else
        dl.setCanceledOnTouchOutside(true)
    end
    an = dl.show()
end

function 单按钮对话框(bt, nr, qd, qdnr, gb)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = bt,
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                ScrollView,
                layout_width = "-1",
                layout_height = "-1",
                layout_weight = "1",
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-2",
                    textSize = "14sp",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "24dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "8dp",
                    Typeface = AppFont.标准,
                    Text = nr,
                    textColor = textc
                }
            },
            {
                LinearLayout,
                orientation = "horizontal",
                layout_width = "-1",
                layout_height = "-2",
                gravity = "right|center",
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = qdnr,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        Typeface = AppFont.特粗,
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = qd,
                        textColor = backgroundc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz }))
                    }
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
    else
    end
    an = dl.show()
    if gb == 0 then
    else
        dl.setCanceledOnTouchOutside(true)
    end
end

function 三按钮对话框(bt, nr, qd, qx, ds, qdnr, qxnr, dsnr, gb)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = bt,
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                ScrollView,
                layout_width = "-1",
                layout_height = "-1",
                layout_weight = "1",
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-2",
                    textSize = "14sp",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "24dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "8dp",
                    Typeface = AppFont.标准,
                    Text = nr,
                    textColor = textc,
                    id = "sandhk_wb"
                }
            },
            {
                LinearLayout,
                orientation = "horizontal",
                layout_width = "-1",
                layout_height = "-2",
                gravity = "right|center",
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = dsnr,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        Typeface = AppFont.特粗,
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = ds,
                        textColor = stextc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                },
                {
                    LinearLayout,
                    orientation = "horizontal",
                    layout_width = "-1",
                    layout_height = "-2",
                    layout_weight = "1"
                },
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginBottom = "24dp",
                    Elevation = "0",
                    onClick = qxnr,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        Typeface = AppFont.特粗,
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = qx,
                        textColor = stextc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                },
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = qdnr,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        Typeface = AppFont.特粗,
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = qd,
                        textColor = backgroundc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
    else
    end
    an = dl.show()
    if gb == 0 then
    else
        dl.setCanceledOnTouchOutside(true)
    end
end

function 解压缩(压缩路径, 解压缩路径)
    printLog("File", "解压缩", 压缩路径, 解压缩路径)
    xpcall(
        function()
            --ZipUtil.unzip(压缩路径,解压缩路径)
            ZipUtils.unzipFile(压缩路径, 解压缩路径)
        end,
        function()
            提示("解压文件 " .. 压缩路径 .. " 失败")
        end
    )
end

function 压缩(原路径, 压缩路径, 名称)
    printLog("File", "压缩", 原路径, 压缩路径, 名称)
    xpcall(
        function()
            LuaUtil.zip(原路径, 压缩路径, 名称)
        end,
        function()
            提示("压缩文件 " .. 原路径 .. " 至 " .. 压缩路径 .. "/" .. 名称 .. " 失败")
        end
    )
end

function 重命名文件(旧, 新)
    printLog("File", "重命名文件", 旧, 新)
    xpcall(
        function()
            File(旧).renameTo(File(新))
        end,
        function()
            提示("重命名文件 " .. 旧 .. " 失败")
        end
    )
end

function 移动文件(旧, 新)
    printLog("File", "移动文件", 旧, 新)
    xpcall(
        function()
            File(旧).renameTo(File(新))
        end,
        function()
            提示("移动文件 " .. 旧 .. " 至 " .. 新 .. " 失败")
        end
    )
end

function 跳转页面(ym, cs)
    if cs then
        activity.newActivity(ym, cs)
    else
        activity.newActivity(ym)
    end
end

function 渐变跳转页面(ym, cs)
    if cs then
        activity.newActivity(ym, cs)
    else
        activity.newActivity(ym)
    end
    activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
end

function 检测键盘()
    local imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)
    local isOpen = imm.isActive()
    return isOpen == true or false
end

function 隐藏键盘()
    activity.getSystemService(INPUT_METHOD_SERVICE).hideSoftInputFromWindow(
        WidgetSearchActivity.this.getCurrentFocus().getWindowToken(),
        InputMethodManager.HIDE_NOT_ALWAYS
    )
end

function 显示键盘(id)
    activity.getSystemService(INPUT_METHOD_SERVICE).showSoftInput(id, 0)
end

function 关闭页面()
    activity.finish()
end

function 复制文本(文本)
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(文本)
end

function QQ群(h)
    xpcall(
        function()
            local url = "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=" ..
                h .. "&card_type=group&source=qrcode"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
        end,
        function(e)
            提示("拉起QQ失败，请手动添加QQ群 " .. h)
            printLog("Error", e)
        end
    )
end

function QQ(h)
    xpcall(
        function()
            local url = "mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=" .. h
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
        end,
        function(e)
            提示("拉起QQ失败，请手动添加QQ " .. h)
            printLog("Error", e)
        end
    )
end

function 全屏()
    local window = activity.getWindow()
    window.getDecorView().setSystemUiVisibility(
        View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
        View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
    )
    window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)

    xpcall(
        function()
            local lp = window.getAttributes()
            lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            window.setAttributes(lp)
            lp = nil
        end,
        function(e)
        end
    )
    window = nil
end

function 退出全屏()
    activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
end

function 图标(n)
    return "res/twotone_" .. n .. "_black_24dp.png"
end

function 高斯模糊(id, tp, radius1, radius2)
    local function blur(context, bitmap, blurRadius)
        renderScript = RenderScript.create(context)
        blurScript = ScriptIntrinsicBlur.create(renderScript, Element.U8_4(renderScript))
        inAllocation = Allocation.createFromBitmap(renderScript, bitmap)
        outputBitmap = bitmap
        outAllocation = Allocation.createTyped(renderScript, inAllocation.getType())
        blurScript.setRadius(blurRadius)
        blurScript.setInput(inAllocation)
        blurScript.forEach(outAllocation)
        outAllocation.copyTo(outputBitmap)
        inAllocation.destroy()
        outAllocation.destroy()
        renderScript.destroy()
        blurScript.destroy()
        return outputBitmap
    end

    xpcall(
        function()
            bitmap = loadbitmap(tp)
        end,
        function(e)
            bitmap = tp
        end
    )

    local function zoomBitmap(bitmap, scale)
        local w = bitmap.getWidth()
        local h = bitmap.getHeight()
        local matrix = Matrix()
        matrix.postScale(scale, scale)
        local bitmap = Bitmap.createBitmap(bitmap, 0, 0, w, h, matrix, true)
        return bitmap
    end

    local function blurAndZoom(context, bitmap, blurRadius, scale)
        return zoomBitmap(blur(context, zoomBitmap(bitmap, 1 / scale), blurRadius), scale)
    end

    id.setImageBitmap(blurAndZoom(activity, bitmap, radius1, radius2))
end

function 获取应用信息(archiveFilePath)
    local pm = activity.getPackageManager()
    local info = pm.getPackageInfo(archiveFilePath, PackageManager.GET_ACTIVITIES)
    if info ~= nil then
        local appInfo = info.applicationInfo
        local appName = tostring(pm.getApplicationLabel(appInfo))
        return appInfo.packageName, info.versionName, pm.getApplicationIcon(appInfo) --安装包名称 --版本信息
        --图标
    else
        return nil, nil, nil
    end
end

function 编辑框颜色(eid, color)
    pcall(
        function()
            eid.getBackground().setColorFilter(PorterDuffColorFilter(color, PorterDuff.Mode.SRC_ATOP))
        end
    )
end

function 下载文件(链接, 文件名)
    downloadManager = activity.getSystemService(Context.DOWNLOAD_SERVICE)
    local request = DownloadManager.Request(Uri.parse(链接))
    request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE | DownloadManager.Request.NETWORK_WIFI)
    --request.setDestinationInExternalPublicDir("MUKAPP/Download",文件名)
    --request.setTitle("标题")
    --request.setDescription("描述")
    Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).mkdir()
    Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS .. "/MUKAPP").mkdir()
    request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, "MUKAPP/" .. 文件名)
    request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
    downloadManager.enqueue(request)
    Snakebar("正在下载文件，下载到：内置存储/" ..
        Environment.DIRECTORY_DOWNLOADS .. "/MUKAPP/" .. 文件名 .. "\n请查看通知栏以查看下载进度。")
end

function 获取文件MIME(name)
    local ExtensionName = tostring(name):match("%.(.+)")
    local Mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
    return tostring(Mime)
end

function 申请权限(权限)
    ActivityCompat.requestPermissions(this, 权限, 1)
end

--申请权限({Manifest.permission.WRITE_EXTERNAL_STORAGE})--不可用

function 判断悬浮窗权限()
    if (Build.VERSION.SDK_INT >= 23 and not Settings.canDrawOverlays(this)) then
        return false
    elseif Build.VERSION.SDK_INT < 23 then
        return ""
    else
        return true
    end
end

function 获取悬浮窗权限()
    local intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)
    intent.setData(Uri.parse("package:" .. activity.getPackageName()))
    activity.startActivityForResult(intent, 100)
end

function 安装apk(安装包路径)
    local intent = Intent(Intent.ACTION_VIEW)
    intent.setDataAndType(Uri.parse("file:///" .. 安装包路径), "application/vnd.android.package-archive")
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    activity.startActivity(intent)
end

function 浏览器打开(pageurl)
    local viewIntent = Intent("android.intent.action.VIEW", Uri.parse(pageurl))
    activity.startActivity(viewIntent)
end

function 设置图片(preview, url)
    xpcall(
        function()
            preview.setImageBitmap(loadbitmap(url))
        end,
        function(e)
            preview.setImageBitmap(url)
        end
    )
end

function 开关颜色(id, color, color2)
    id.ThumbDrawable.setColorFilter(PorterDuffColorFilter(转0x(color), PorterDuff.Mode.SRC_ATOP))
    id.TrackDrawable.setColorFilter(PorterDuffColorFilter(转0x(color2), PorterDuff.Mode.SRC_ATOP))
end

--[[
function 微信扫一扫()
  intent = activity.getPackageManager().getLaunchIntentForPackage("com.tencent.mm");
  intent.putExtra("LauncherUI.From.Scaner.Shortcut", true);
  activity.startActivity(intent);
end]]
function 微信扫一扫()
    import "android.content.Intent"
    import "android.content.ComponentName"
    local intent = Intent()
    intent.setComponent(ComponentName("com.tencent.mm", "com.tencent.mm.ui.LauncherUI"))
    intent.putExtra("LauncherUI.From.Scaner.Shortcut", true)
    intent.setFlags(335544320)
    intent.setAction("android.intent.action.VIEW")
    activity.startActivity(intent)
end

function 支付宝扫一扫()
    import "android.net.Uri"
    import "android.content.Intent"
    local uri = Uri.parse("alipayqr://platformapi/startapp?saId=10000007")
    local intent = Intent(Intent.ACTION_VIEW, uri)
    activity.startActivity(intent)
end

function 支付宝捐赠()
    --https://qr.alipay.com/fkx01496axmjusadzgm2v97
    xpcall(
        function()
            local url =
            "alipayqr://platformapi/startapp?saId=10000007&clientVersion=10.1.6&qrcode=https://qr.alipay.com/fkx01496axmjusadzgm2v97"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
        end,
        function()
            local url = "https://qr.alipay.com/fkx01496axmjusadzgm2v97"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
        end
    )
end

function 颜色字体(t, c)
    local sp = SpannableString(t)
    sp.setSpan(ForegroundColorSpan(转0x(c)), 0, #sp, Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
    return sp
end

function MD5(s)
    local HexTable = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" }
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

    local function F(x, y, z)
        return (x & y) | ((~x) & z)
    end

    local function G(x, y, z)
        return (x & z) | (y & (~z))
    end

    local function H(x, y, z)
        return x ~ y ~ z
    end

    local function I(x, y, z)
        return y ~ (x | (~z))
    end

    local function FF(a, b, c, d, x, s, ac)
        a = a + F(b, c, d) + x + ac
        a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
        return a & 0xffffffff
    end

    local function GG(a, b, c, d, x, s, ac)
        a = a + G(b, c, d) + x + ac
        a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
        return a & 0xffffffff
    end

    local function HH(a, b, c, d, x, s, ac)
        a = a + H(b, c, d) + x + ac
        a = (((a & 0xffffffff) << s) | ((a & 0xffffffff) >> 32 - s)) + b
        return a & 0xffffffff
    end

    local function II(a, b, c, d, x, s, ac)
        a = a + I(b, c, d) + x + ac
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
        for i = 1, len do
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
        for i = 1, fillSize // 4 do
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
    local result = { A, B, C, D }

    for i = 1, #fillTab // 16 do
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
    for i = 1, 4 do
        for _ = 1, 4 do
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

function MD5字符串(str)
    local md5 = MessageDigest.getInstance("MD5")
    local bytes = md5.digest(String(str).getBytes())
    local result = ""
    for i = 0, #bytes - 1 do
        local temp = string.format("%02x", (bytes[i] & 0xff))
        return result .. temp
    end
end

function 圆形图片(bitmap)
    import "android.graphics.PorterDuffXfermode"
    import "android.graphics.Paint"
    import "android.graphics.RectF"
    import "android.graphics.Bitmap"
    import "android.graphics.PorterDuff$Mode"
    import "android.graphics.Rect"
    import "android.graphics.Canvas"
    import "android.util.Config"
    local width = bitmap.getWidth()
    local output = Bitmap.createBitmap(width, width, Bitmap.Config.ARGB_8888)
    local canvas = Canvas(output)
    local color = 0xff424242
    local paint = Paint()
    local rect = Rect(0, 0, bitmap.getWidth(), bitmap.getHeight())
    local rectF = RectF(rect)
    paint.setAntiAlias(true)
    canvas.drawARGB(0, 0, 0, 0)
    paint.setColor(color)
    canvas.drawRoundRect(rectF, width / 2, width / 2, paint)
    paint.setXfermode(PorterDuffXfermode(Mode.SRC_IN))
    canvas.drawBitmap(bitmap, rect, rect, paint)
    return output
end

function 图片缩放(bmp, scale)
    local bm = loadbitmap(bmp)
    local width = bm.getWidth()
    local height = bm.getHeight()
    local matrix = Matrix()
    matrix.postScale(scale, scale)
    local newbm = Bitmap.createBitmap(bm, 0, 0, width, height, matrix, true)
    if (bm ~= nil and not bm.isRecycled()) then
        bm.recycle()
        bm = nil
    end
    return newbm
end

function androiddata(u)
    if u == "" or u == nil then
        return activity.getExternalFilesDir("").getAbsolutePath()
    else
        return activity.getExternalFilesDir("").getAbsolutePath() .. u
    end
end

function datadata(u)
    if u == "" or u == nil then
        return activity.getFilesDir().getAbsolutePath() .. "/user"
    else
        return activity.getFilesDir().getAbsolutePath() .. "/user/" .. u
    end
end

function 内置存储文件(u)
    if u == "" or u == nil then
        return androiddata("/user")
    else
        return androiddata("/user/" .. u)
    end
end

function MUKAPP文件(u, u2)
    if u2 == "EXTERNAL" then
        if u == "" or u == nil then
            return "/user"
        else
            return "/user/" .. u
        end
    else
        if u == "" or u == nil then
            return androiddata("/user")
        else
            return androiddata("/user/" .. u)
        end
    end
end

function 新内置存储文件(u)
    if u == "" or u == nil then
        return 内置存储("Download/MUKGenshinTool")
    else
        return 内置存储("Download/MUKGenshinTool/" .. u)
    end
end

function 图标注释(view, str)
    view.onLongClick = function(v)
        提示(str)
    end
end

function 检查更新(sdu)
    Http.get(
        "https://www.mukapp.top/api/gtool_update.php",
        function(code, content, cookie, header)
            printLog("Get update info", code)
            if code == 200 then
                content = JSON.decode(content)
                local newversion = content.version
                local newversionname = content.versionname
                local newcon = content.content
                local newsize = content.size
                local newtime = content.time
                local newlink = content.link
                local enforce = content.enforce

                local aqx = "取消"
                local aqxf = function()
                    关闭对话框()
                end
                if enforce == true then
                    aqx = "退出"
                    aqxf = function()
                        关闭对话框()
                        activity.finish()
                    end
                end
                if (newversion > 应用版本) then
                    双按钮对话框(
                        "应急食品有新版本 " .. newversionname .. " 辣~",
                        "更新内容：\n" .. newcon .. "\n更新时间：" .. newtime .. "\n新版大小：" .. newsize
                        ,
                        "更新",
                        aqx,
                        function()
                            关闭对话框()
                            浏览器打开(newlink)
                        end,
                        aqxf
                    )
                else
                    if sdu then
                        提示("当前已是最新版本")
                    end
                end
                printLog(nil, newcon, newversion)
            else
                if sdu then
                    提示("获取更新信息失败：" .. content)
                end
            end
        end
    )
end

function HPageView()
    local function swapEvent(event)
        local width = page.getWidth()
        local height = page.getHeight()
        local newX = (event.getY() / height) * width
        local newY = (event.getX() / width) * height
        event.setLocation(newX, newY)
        return event
    end

    page =
    luajava.override(
        PageView,
        {
            onInterceptTouchEvent = function(super, event)
                --swapEvent(event)
                --return super(swapEvent(event))
                return true
            end,
            onTouchEvent = function(super, event)
                --return super(swapEvent(event))
                return true
            end
        }
    )
    page.setOverScrollMode(PageView.OVER_SCROLL_NEVER)
    ZoomInTransform =
    (PageView.PageTransformer {
        transformPage = function(view, position)
            alpha = 0
            if (position <= 1 and position >= 0) then
                alpha = 1 - position
            elseif (position < 0 and position > -1) then
                alpha = position + 1
            end
            view.setAlpha(alpha)
            transX = view.getWidth() * (-position)
            view.setTranslationX(transX)
            transY = position * view.getHeight()
            view.setTranslationY(transY)
        end
    })
    page.setPageTransformer(true, ZoomInTransform)
    return page
end

import "android.graphics.drawable.*"
yedrawable = GradientDrawable()
yedrawable.setShape(GradientDrawable.RECTANGLE)
yedrawable.setColor(0xffffffff)
yedrawable.setCornerRadii({ dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8), dp2px(8) })
yedrawable.setStroke(2, 0x21212121, 0, 0)

function 设置字体大小倍数(n)
    local res = activity.getResources()
    local config = res.getConfiguration()
    config.fontScale = n
    res.updateConfiguration(config, res.getDisplayMetrics())
end

function 字体大小恢复()
    res = activity.getResources()
    config = res.getConfiguration()
    config.setToDefaults()
    res.updateConfiguration(config, res.getDisplayMetrics())
end

function 设置dpi(n)
    res = activity.getResources()
    config = res.getConfiguration()
    config.densityDpi = n
    res.updateConfiguration(config, res.getDisplayMetrics())
end

function dpi恢复()
    res = activity.getResources()
    config = res.getConfiguration()
    config.setToDefaults()
    res.updateConfiguration(config, res.getDisplayMetrics())
end

--字体大小恢复()
--dpi恢复()
--设置字体大小倍数(1.0)
--设置dpi(320)

function 加载对话框(bt, nr, gb)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = bt,
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                LinearLayout,
                layout_width = "-1",
                layout_height = "-2",
                paddingBottom = "24dp",
                Gravity = "left|center",
                {
                    ProgressBar,
                    layout_width = "56dp",
                    layout_height = "56dp",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "24dp",
                    id = "jzdhk_pb"
                },
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-2",
                    textSize = "14sp",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "16dp",
                    layout_marginRight = "24dp",
                    Typeface = Typeface.createFromFile(File(activity.getLuaDir() .. "/res/Jost-Regular.ttf")),
                    Text = nr,
                    textColor = textc,
                    id = "jzdhk_wb"
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    jzdhk_pb.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(转0x(primaryc), PorterDuff.Mode.SRC_ATOP))

    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
        dl.onDismiss = function()
            an = dl.show()
        end
    else
        dl.setCanceledOnTouchOutside(true)
    end
    an = dl.show()
end

function 加载对话框内容(n)
    jzdhk_wb.text = n
end

function 双按钮对话框内容(n)
    sandhk_wb.text = n
end

function JarToDex(jarPath, dexPath, onks, oncg, onsb)
    onks()
    local function oncgx()
        oncg()
    end

    local function onsbx()
        onsb()
    end

    local Mythread =
    thread(
        function(jarPath, dexPath)
            require "import"
            import "com.android.dx.command.Main"
            xpcall(
                function()
                    Main.main({ "--dex", "--output=" .. dexPath, jarPath })
                    call("oncgx")
                end,
                function(err)
                    call("onsbx")
                end
            )
        end,
        jarPath,
        dexPath
    )
end

function loadBitmapFromViewBySystem(v)
    v.setDrawingCacheEnabled(false)
    v.setDrawingCacheEnabled(true)
    v.buildDrawingCache()
    bm = v.getDrawingCache()
    return bm
end

function 遍历设置文本()
    font = Typeface.create("宋体", Typeface.BOLD)
    function setFont(view)
        if luajava.instanceof(view, TextView) then
            view.setTypeface(font)
        elseif luajava.instanceof(view, ViewGroup) then
            for i = 0, view.getChildCount() - 1 do
                setFont(view.getChildAt(i))
            end
        end
    end

    setFont(activity.getDecorView())
end

function encodeBase64(source_str)
    local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local s64 = ""
    local str = source_str

    while #str > 0 do
        local bytes_num = 0
        local buf = 0

        for byte_cnt = 1, 3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end

        for group_cnt = 1, (bytes_num + 1) do
            local b64char = math.fmod(math.floor(buf / 262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end

        for fill_cnt = 1, (3 - bytes_num) do
            s64 = s64 .. "="
        end
    end

    return s64
end

--解码

function decodeBase64(str64)
    local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local temp = {}
    for i = 1, 64 do
        temp[string.sub(b64chars, i, i)] = i
    end
    temp["="] = 0
    local str = ""
    for i = 1, #str64, 4 do
        if i > #str64 then
            break
        end
        local data = 0
        local str_count = 0
        for j = 0, 3 do
            local str1 = string.sub(str64, i + j, i + j)
            if not temp[str1] then
                return
            end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1] - 1
                str_count = str_count + 1
            end
        end
        for j = 16, 0, -8 do
            if str_count > 0 then
                str = str .. string.char(math.floor(data / math.pow(2, j)))
                data = math.mod(data, math.pow(2, j))
                str_count = str_count - 1
            end
        end
    end

    local last = tonumber(string.byte(str, string.len(str), string.len(str)))
    if last == 0 then
        str = string.sub(str, 1, string.len(str) - 1)
    end
    return str
end

--封装Http_upload函数，上传参数(链接，参数,图片地址,回调)
function Http_upload(ur, name, f, zhacai)
    client = OkTest.newok()
    f = File(f)
    requestBody =
    MultipartBody.Builder().setType(MultipartBody.FORM).addFormDataPart(
        name,
        tostring(f.Name),
        RequestBody.create(MediaType.parse("multipart/form-data"), f)
    ).build()

    request =
    Request.Builder().header("User-Agent", "Dalvik/2.1.0 (Linux; U; Android 9.0; MI MIX Alpha)").url(ur).post(
        requestBody
    ).build()

    client.newCall(request).enqueue(
        Callback {
            onFailure = function(call, e) --请求失败
                zhacai("", "", "")
            end,
            onResponse = function(call, response) --请求成功
                code = response.code()
                --.toString()
                header = response.headers()
                data = String(response.body().bytes()).toString()
                zhacai(code, data, header)
            end
        }
    )
end

function 获取控件图片(view)
    local linearParams = view.getLayoutParams()
    local vw = linearParams.width
    local vh = linearParams.height
    view.layout(0, 0, vw, vh)
    view.setDrawingCacheEnabled(true)
    return Bitmap.createBitmap(view.getDrawingCache())
end

function 获取控件图片(view)
    view.destroyDrawingCache()
    view.setDrawingCacheEnabled(true)
    view.buildDrawingCache()
    return view.getDrawingCache()
end

function 保存图片(name, bm)
    if bm then
        import "java.io.FileOutputStream"
        import "java.io.File"
        import "android.graphics.Bitmap"
        local name = tostring(name)
        local f = File(name)
        local out = FileOutputStream(f)
        bm.compress(Bitmap.CompressFormat.PNG, 100, out)
        out.flush()
        out.close()
        activity.sendBroadcast(Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE, Uri.parse("file://" .. name)))
        return true
    else
        return false
    end
end

function MEditText(v)
    local TransY = 0
    if v.text ~= nil then
        TransY = -dp2px(24 / 2)
    end

    return function()
        return loadlayout(
            {
                LinearLayout,
                layout_width = v.layout_width,
                layout_height = v.layout_height,
                {
                    CardView,
                    CardElevation = "0dp",
                    CardBackgroundColor = cardbackc,
                    Radius = "8dp",
                    layout_width = "-1",
                    layout_height = "-2",
                    {
                        RelativeLayout,
                        focusable = true,
                        layout_width = "-1",
                        layout_height = "-2",
                        focusableInTouchMode = true,
                        --paddingLeft="64dp";
                        --paddingRight="64dp";
                        {
                            EditText,
                            textColor = v.textColor,
                            textSize = "14sp",
                            gravity = "left|top",
                            SingleLine = v.SingleLine,
                            MaxLines = v.MaxLines,
                            layout_width = "-1",
                            layout_height = v.layout_height,
                            id = v.id,
                            background = "#00212121",
                            padding = "16dp",
                            paddingTop = "32dp",
                            text = v.text,
                            Typeface = AppFont.标准,
                            InputType = v.inputType,
                            addTextChangedListener = {
                                onTextChanged = function(_, _, _, _)
                                end
                            },
                            OnFocusChangeListener = ({
                                onFocusChange = function(vw, hasFocus)
                                    if hasFocus then
                                        --print(1)
                                        vw.getParent().getChildAt(1).setTextColor(转0x(primaryc))
                                        if vw.text == "" then
                                            local edity =
                                            ObjectAnimator.ofFloat(
                                                vw.getParent().getChildAt(1),
                                                "Y",
                                                { vw.getParent().getChildAt(1).getY(), -dp2px(24 / 2) }
                                            )
                                            edity.setInterpolator(DecelerateInterpolator())
                                            edity.setDuration(100)
                                            edity.start()
                                        end
                                    else
                                        --print(2)
                                        vw.getParent().getChildAt(1).setTextColor(转0x(v.HintTextColor))
                                        if #vw.Text == 0 then
                                            --vw.getParent().getChildAt(1).TranslationY=0
                                            local edity =
                                            ObjectAnimator.ofFloat(
                                                vw.getParent().getChildAt(1),
                                                "Y",
                                                { vw.getParent().getChildAt(1).getY(), 0 }
                                            )
                                            edity.setInterpolator(DecelerateInterpolator())
                                            edity.setDuration(100)
                                            edity.start()
                                        else
                                            vw.getParent().getChildAt(1).setTextColor(转0x(primaryc))
                                        end
                                    end
                                end
                            })
                        },
                        {
                            TextView,
                            textColor = v.HintTextColor,
                            text = v.hint,
                            textSize = "14sp",
                            layout_width = "-1",
                            layout_height = "-2",
                            gravity = "center|left",
                            padding = "16dp",
                            paddingTop = "24dp",
                            TranslationY = TransY,
                            Typeface = AppFont.特粗
                        }
                    },
                    {
                        TextView,
                        layout_width = "8dp",
                        layout_height = "-1",
                        BackgroundDrawable = GradientDrawable(
                            GradientDrawable.Orientation.LEFT_RIGHT,
                            {
                                转0x(primaryc) - 0xcf000000,
                                转0x(primaryc) - 0xff000000
                            }
                        )
                    }
                }
            }
        )
    end
end

function MSeekBar(v)
    local v_text = v.text .. " 0" .. v.unit
    if v.progress then
        v_text = v.text .. " " .. tostring(v.progress) .. v.unit
    end
    return function()
        return loadlayout(
            {
                LinearLayout,
                layout_width = v.layout_width,
                layout_height = v.layout_height,
                {
                    CardView,
                    --style="?android:attr/buttonBarButtonStyle";
                    CardElevation = "0dp",
                    CardBackgroundColor = cardbackc,
                    layout_width = v.layout_width,
                    layout_height = v.layout_height,
                    Radius = v.radius or "8dp",
                    padding = "0dp",
                    id = v.id,
                    focusable = true,
                    focusableInTouchMode = true,
                    onTouch = function(vi, e)
                        if e.getAction() == MotionEvent.ACTION_DOWN then
                            local c = vi.getChildAt(0).getChildAt(0)
                            local linearParams = c.getLayoutParams()
                            paras = linearParams.width
                            first = e.X
                        else
                            x = e.getX()
                            --print(x)
                            local vw = vi.measure(0, 0).Width
                            local th = vi.getChildAt(0).getChildAt(1)
                            if x < 0 then
                                x = 0
                            end
                            if x > vw then
                                x = vw
                            end
                            local c = vi.getChildAt(0).getChildAt(0)
                            local linearParams = c.getLayoutParams()
                            thewidth = e.X - first + paras
                            if thewidth > vw then
                                thewidth = vw
                            elseif thewidth < 0 then
                                thewidth = 0
                            end
                            linearParams.width = thewidth
                            c.setLayoutParams(linearParams)
                            if v.onProgressChanged then
                                v.onProgressChanged(v, thewidth / vw)
                            end
                            th.text = v.text .. " " .. tostring(tointeger(v.max * thewidth / vw)) .. v.unit
                            local tw = th.measure(0, 0).Width
                            --print(x,tw)
                            if thewidth < tw / 2 then
                                if mukvar.textColorMode[th] ~= textc then
                                    mukvar.textColorMode[th] = textc
                                    th.setTextColor(转0x(textc))
                                end
                            else
                                if mukvar.textColorMode[th] ~= backgroundc then
                                    mukvar.textColorMode[th] = backgroundc
                                    th.setTextColor(转0x(backgroundc))
                                end
                            end
                        end
                        xpcall(
                            function()
                                if e.getAction() == MotionEvent.ACTION_UP then
                                    --允许ScrollView截断点击事件，ScrollView可滑动
                                    vi.getParent().getParent().getParent().requestDisallowInterceptTouchEvent(false)
                                else
                                    if ley then
                                        --print(math.abs(e.getY()-ley)<=10)
                                        if math.abs(e.getY() - ley) <= 20 then
                                            --不允许ScrollView截断点击事件，点击事件由子View处理
                                            vi.getParent().getParent().getParent().requestDisallowInterceptTouchEvent(true)
                                        else
                                            vi.getParent().getParent().getParent().requestDisallowInterceptTouchEvent(false)

                                            local vw = vi.measure(0, 0).Width
                                            local th = vi.getChildAt(0).getChildAt(1)
                                            local c = vi.getChildAt(0).getChildAt(0)
                                            local linearParams = c.getLayoutParams()
                                            thewidth = paras
                                            linearParams.width = thewidth
                                            c.setLayoutParams(linearParams)
                                            if v.onProgressChanged then
                                                v.onProgressChanged(v, thewidth / vw)
                                            end
                                            th.text = v.text ..
                                                " " .. tostring(tointeger(v.max * thewidth / vw)) .. v.unit
                                            local tw = th.measure(0, 0).Width
                                            --print(x,tw)
                                            if thewidth < tw / 2 then
                                                if mukvar.textColorMode[th] ~= textc then
                                                    mukvar.textColorMode[th] = textc
                                                    th.setTextColor(转0x(textc))
                                                end
                                            else
                                                if mukvar.textColorMode[th] ~= backgroundc then
                                                    mukvar.textColorMode[th] = backgroundc
                                                    th.setTextColor(转0x(backgroundc))
                                                end
                                            end
                                        end
                                    end
                                    ley = e.getY()
                                end
                            end,
                            function(e)
                                printLog(e)
                            end
                        )
                        return true
                    end,
                    onDraw = function(vi)
                        local th = vi.getChildAt(0).getChildAt(1)
                        local tw = th.measure(0, 0).Width
                        local c = vi.getChildAt(0).getChildAt(0)
                        local pro = c.getLayoutParams()
                        if mukvar.onLayoutLoaded[vi] then
                        else
                            --th.text=v_text
                            pro.width = v.progress * vi.measure(0, 0).Width / v.max
                            c.setLayoutParams(pro)
                        end
                        if pro.width < tw / 2 then
                            if mukvar.textColorMode[th] ~= textc then
                                mukvar.textColorMode[th] = textc
                                th.setTextColor(转0x(textc))
                            end
                        else
                            if mukvar.textColorMode[th] ~= backgroundc then
                                mukvar.textColorMode[th] = backgroundc
                                th.setTextColor(转0x(backgroundc))
                            end
                        end
                        mukvar.onLayoutLoaded[vi] = true
                    end,
                    {
                        RelativeLayout,
                        layout_width = v.layout_width,
                        layout_height = v.layout_height,
                        --paddingLeft="64dp";
                        --paddingRight="64dp";
                        {
                            LinearLayout,
                            layout_width = v.layout_width,
                            layout_height = v.layout_height,
                            background = primaryc,
                            gravity = "right",
                            {
                                CardView,
                                CardElevation = "0dp",
                                CardBackgroundColor = "#3fffffff",
                                layout_width = "6dp",
                                layout_height = "-1",
                                Radius = "3dp",
                                layout_margin = "8dp"
                            }
                        },
                        {
                            TextView,
                            text = v_text,
                            textSize = "14sp",
                            layout_width = "-2",
                            layout_height = v.layout_height,
                            gravity = "center|left",
                            paddingLeft = "16dp",
                            padding = "12dp",
                            Typeface = AppFont.特粗,
                            textColor = v.textColor or backgroundc
                        },
                        {
                            TextView,
                            layout_width = v.layout_width,
                            layout_height = v.layout_height
                        },
                        {
                            TextView,
                            layout_width = "8dp",
                            layout_height = v.layout_height,
                            BackgroundDrawable = GradientDrawable(
                                GradientDrawable.Orientation.LEFT_RIGHT,
                                {
                                    转0x(primaryc) - 0xcf000000,
                                    转0x(primaryc) - 0xff000000
                                }
                            )
                        }
                    }
                }
            }
        )
    end
end

function timediff(begin_time, end_time)
    local starttime = 0
    local endtime = 0
    if (begin_time < end_time) then
        starttime = begin_time
        endtime = end_time
    else
        starttime = end_time
        endtime = begin_time
    end

    --计算天数
    local timedif = endtime - starttime
    local days = Long(timedif / 86400)
    --计算小时数
    local remain = timedif % 86400
    local hours = Long(remain / 3600)
    --计算分钟数
    local remain = remain % 3600
    local mins = Long(remain / 60)
    --计算秒数
    local secs = remain % 60
    local res = { day = days, hour = hours, min = mins, sec = secs }
    return res
end

function 友好时间(n)
    local tb = timediff(tointeger(os.time()), tointeger(n))
    if tb.day then
        if tb.day.intValue() >= 365 then
            return os.date("%Y-%m-%d", n)
        end
        if tb.day.intValue() >= 31 then
            return tointeger(tb.day.intValue() / 31) .. "月前"
        end
        if tb.day.intValue() > 0 then
            return tb.day.intValue() .. "天前"
        end
        if tb.hour.intValue() > 0 then
            return tb.hour.intValue() .. "小时前"
        end
        if tb.min.intValue() > 0 then
            return tb.min.intValue() .. "分钟前"
        end
        if tb.sec < 30 then
            return "刚刚"
        end
        if tb.sec >= 30 then
            return tb.sec .. "秒前"
        end
    end
end

function isLightColor(ccolor)
    local darkness = 1 - (0.299 * Color.red(ccolor) + 0.587 * Color.green(ccolor) + 0.114 * Color.blue(ccolor)) / 255
    if (darkness < 0.5) then
        return true
    else
        return false
    end
end

Colorise = {}

Colorise.hex2rgb = function(hex)
    local hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

Colorise.hex2rgba = function(hex)
    local hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6)),
        tonumber(
            "0x" .. hex:sub(7, 8)
        )
end

Colorise.rgb2hex = function(rgb)
    local hexadecimal = "#"

    for key = 1, #rgb do
        local value = rgb[key]
        local hex = ""

        while (value > 0) do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub("0123456789ABCDEF", index, index) .. hex
        end

        if (string.len(hex) == 0) then
            hex = "00"
        elseif (string.len(hex) == 1) then
            hex = "0" .. hex
        end
        hexadecimal = hexadecimal .. hex
    end

    return hexadecimal
end

Colorise.rgba2hex = function(rgb)
    return Colorise.rgb2hex(rgb)
end

Colorise.num2hex = function(num)
    return Colorise.rgb2hex { Color.alpha(num), Color.red(num), Color.green(num), Color.blue(num) }
end

function exec(cmd, sh, su)
    local cmd = tostring(cmd)
    if sh == true then
        cmd = io.open(cmd):read("*a")
    end
    if su == 0 then
        p = io.popen(string.format("%s", cmd))
    else
        p = io.popen(string.format("%s", "su -c " .. cmd))
    end
    local s = p:read("*a")
    p:close()
    return s
end

function isValidEmail(str)
    if str == nil then
        return nil
    end
    if (type(str) ~= "string") then
        error("Expected string")
        return nil
    end

    local localPart = str:match("(.+)%@") -- Returns the substring before '@' symbol
    local domainPart = str:match("%@(.+)") -- Returns the substring after '@' symbol
    -- we werent able to split the email properly
    if localPart == nil then
        return nil, "Local name is invalid"
    end

    if domainPart == nil then
        return nil, "Domain is invalid"
    end
    -- local part is maxed at 64 characters
    if #localPart > 64 then
        return nil, "Local name must be less than 64 characters"
    end
    -- domains are maxed at 253 characters
    if #domainPart > 253 then
        return nil, "Domain must be less than 253 characters"
    end
    -- quotes are only allowed at the beginning of a the local name
    local quotes = localPart:find('["]')
    if type(quotes) == "number" and quotes > 1 then
        return nil, "Invalid usage of quotes"
    end
    -- no @ symbols allowed outside quotes
    if localPart:find("%@+") and quotes == nil then
        return nil, "Invalid @ symbol usage in local part"
    end
    -- no dot found in domain name
    if not domainPart:find("%.") then
        return nil, "No TLD found in domain"
    end
    -- only 1 period in succession allowed
    if domainPart:find("%.%.") then
        return nil, "Too many periods in domain"
    end
    if localPart:find("%.%.") then
        return nil, "Too many periods in local part"
    end
    -- just a general match
    if not str:match("[%w]*[%p]*%@+[%w]*[%.]?[%w]*") then
        return nil, "Email pattern test failed"
    end
    -- all our tests passed, so we are ok
    return true
end

function layoutGradientAnimation(id, t, j)
    id.setLayoutAnimation(
        LayoutAnimationController(AlphaAnimation(0, 1).setDuration(t)).setDelay(j).setOrder(
            LayoutAnimationController.ORDER_NORMAL
        )
    )
end

activity.getWindow().setAllowEnterTransitionOverlap(true)
activity.getWindow().setAllowReturnTransitionOverlap(true)

function InputColor(f)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-2",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = "自定义颜色",
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                MEditText {
                    textSize = "14sp",
                    textColor = textc,
                    HintTextColor = stextc,
                    hint = "输入一个16进制颜色值",
                    layout_width = "-1",
                    layout_height = "-2",
                    text = "#2196F3",
                    id = "color_input"
                },
                layout_marginTop = "8dp",
                layout_margin = "24dp",
                layout_marginBottom = "8dp"
            },
            {
                LinearLayout,
                orientation = "horizontal",
                layout_width = "-1",
                layout_height = "-2",
                gravity = "right|center",
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "4dp",
                    background = primaryc,
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginRight = "24dp",
                    layout_marginBottom = "24dp",
                    Elevation = "1dp",
                    onClick = function()
                        if color_input.text:match("#(.+)") == "" or color_input.text:match("#(.+)") == nil or
                            (
                            utf8.len(color_input.text:match("#(.+)")) ~= 6 and
                                utf8.len(color_input.text:match("#(.+)")) ~= 8)
                        then
                            提示("颜色格式不正确")
                        else
                            f(color_input.text)
                            关闭对话框()
                        end
                    end,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        Typeface = AppFont.特粗,
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = "确定",
                        textColor = backgroundc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
    else
    end
    an = dl.show()
    if gb == 0 then
    else
        dl.setCanceledOnTouchOutside(true)
    end
end

function ColorPickerChild(ys, ll, yw, f)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-1",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = ys .. " " .. yw,
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                GridView,
                layout_height = "-1",
                layout_width = "-1",
                NumColumns = 5,
                id = "colorgv",
                layout_marginTop = "4dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                layout_marginBottom = "24dp"
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
    else
    end
    an = dl.show()
    if gb == 0 then
    else
        dl.setCanceledOnTouchOutside(true)
    end

    local mml = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-2",
        gravity = "center",
        onClick = function()
        end,
        {
            CardView,
            radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
            layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
            layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
            layout_margin = "8dp",
            elevation = "0dp",
            {
                RelativeLayout,
                layout_width = "-1",
                layout_height = "-1",
                id = "yb",
                {
                    CardView,
                    radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
                    layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                    layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                    elevation = "0dp",
                    background = "#3f000000",
                    {
                        CardView,
                        radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
                        layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                        layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                        elevation = "0dp",
                        background = "#3fFFFFFF",
                        {
                            CardView,
                            radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3)) / 2,
                            layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3),
                            layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3),
                            layout_margin = "4dp",
                            elevation = "0dp",
                            {
                                TextView,
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "ybt"
                            }
                        }
                    }
                },
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-1",
                    id = "yc",
                    textColor = "#00000000",
                    --textSize=0;
                    onClick = function(v)
                        print(v.text)
                    end
                }
            }
        }
    }

    local coloradp = LuaAdapter(activity, mml)

    function 添加项目(nr, sz)
        local zsml = nr:match("0xFF(.+)")
        local zsll = "#" .. zsml
        coloradp.add {
            yb = { Background = ColorDrawable(tointeger(nr)) },
            ybt = { Background = ColorDrawable(tointeger(nr)) },
            yc = {
                BackgroundDrawable = 波纹2("方黑"),
                onClick = function()
                    关闭对话框()
                    f(zsll)
                end
            }
        }
    end

    if ys == "红色" then
        添加项目("0xFFFFEBEE", "50")
        添加项目("0xFFFFCDD2", "100")
        添加项目("0xFFEF9A9A", "200")
        添加项目("0xFFE57373", "300")
        添加项目("0xFFEF5350", "400")
        添加项目("0xFFF44336", "500")
        添加项目("0xFFE53935", "600")
        添加项目("0xFFD32F2F", "700")
        添加项目("0xFFC62828", "800")
        添加项目("0xFFB71C1C", "900")
        添加项目("0xFFFF8A80", "A100")
        添加项目("0xFFFF5252", "A200")
        添加项目("0xFFFF1744", "A400")
        添加项目("0xFFD50000", "A700")
    end
    if ys == "粉色" then
        添加项目("0xFFFCE4EC", "50")
        添加项目("0xFFF8BBD0", "100")
        添加项目("0xFFF48FB1", "200")
        添加项目("0xFFF06292", "300")
        添加项目("0xFFEC407A", "400")
        添加项目("0xFFE91E63", "500")
        添加项目("0xFFD81B60", "600")
        添加项目("0xFFC2185B", "700")
        添加项目("0xFFAD1457", "800")
        添加项目("0xFF880E4F", "900")
        添加项目("0xFFFF80AB", "A100")
        添加项目("0xFFFF4081", "A200")
        添加项目("0xFFF50057", "A400")
        添加项目("0xFFC51162", "A700")
    end
    if ys == "紫色" then
        添加项目("0xFFF3E5F5", "50")
        添加项目("0xFFE1BEE7", "100")
        添加项目("0xFFCE93D8", "200")
        添加项目("0xFFBA68C8", "300")
        添加项目("0xFFAB47BC", "400")
        添加项目("0xFF9C27B0", "500")
        添加项目("0xFF8E24AA", "600")
        添加项目("0xFF7B1FA2", "700")
        添加项目("0xFF6A1B9A", "800")
        添加项目("0xFF4A148C", "900")
        添加项目("0xFFEA80FC", "A100")
        添加项目("0xFFE040FB", "A200")
        添加项目("0xFFD500F9", "A400")
        添加项目("0xFFAA00FF", "A700")
    end
    if ys == "深紫" then
        添加项目("0xFFEDE7F6", "50")
        添加项目("0xFFD1C4E9", "100")
        添加项目("0xFFB39DDB", "200")
        添加项目("0xFF9575CD", "300")
        添加项目("0xFF7E57C2", "400")
        添加项目("0xFF673AB7", "500")
        添加项目("0xFF5E35B1", "600")
        添加项目("0xFF512DA8", "700")
        添加项目("0xFF4527A0", "800")
        添加项目("0xFF311B92", "900")
        添加项目("0xFFB388FF", "A100")
        添加项目("0xFF7C4DFF", "A200")
        添加项目("0xFF651FFF", "A400")
        添加项目("0xFF6200EA", "A700")
    end
    if ys == "靛蓝" then
        添加项目("0xFFE8EAF6", "50")
        添加项目("0xFFC5CAE9", "100")
        添加项目("0xFF9FA8DA", "200")
        添加项目("0xFF7986CB", "300")
        添加项目("0xFF5C6BC0", "400")
        添加项目("0xFF3F51B5", "500")
        添加项目("0xFF3949AB", "600")
        添加项目("0xFF303F9F", "700")
        添加项目("0xFF283593", "800")
        添加项目("0xFF1A237E", "900")
        添加项目("0xFF8C9EFF", "A100")
        添加项目("0xFF536DFE", "A200")
        添加项目("0xFF3D5AFE", "A400")
        添加项目("0xFF304FFE", "A700")
    end
    if ys == "蓝色" then
        添加项目("0xFFE3F2FD", "50")
        添加项目("0xFFBBDEFB", "100")
        添加项目("0xFF90CAF9", "200")
        添加项目("0xFF64B5F6", "300")
        添加项目("0xFF42A5F5", "400")
        添加项目("0xFF2196F3", "500")
        添加项目("0xFF1E88E5", "600")
        添加项目("0xFF1976D2", "700")
        添加项目("0xFF1565C0", "800")
        添加项目("0xFF0D47A1", "900")
        添加项目("0xFF82B1FF", "A100")
        添加项目("0xFF448AFF", "A200")
        添加项目("0xFF2979FF", "A400")
        添加项目("0xFF2962FF", "A700")
    end
    if ys == "亮蓝" then
        添加项目("0xFFE1F5FE", "50")
        添加项目("0xFFB3E5FC", "100")
        添加项目("0xFF81D4FA", "200")
        添加项目("0xFF4FC3F7", "300")
        添加项目("0xFF29B6F6", "400")
        添加项目("0xFF03A9F4", "500")
        添加项目("0xFF039BE5", "600")
        添加项目("0xFF0288D1", "700")
        添加项目("0xFF0277BD", "800")
        添加项目("0xFF01579B", "900")
        添加项目("0xFF80D8FF", "A100")
        添加项目("0xFF40C4FF", "A200")
        添加项目("0xFF00B0FF", "A400")
        添加项目("0xFF0091EA", "A700")
    end
    if ys == "青色" then
        添加项目("0xFFE0F7FA", "50")
        添加项目("0xFFB2EBF2", "100")
        添加项目("0xFF80DEEA", "200")
        添加项目("0xFF4DD0E1", "300")
        添加项目("0xFF26C6DA", "400")
        添加项目("0xFF00BCD4", "500")
        添加项目("0xFF00ACC1", "600")
        添加项目("0xFF0097A7", "700")
        添加项目("0xFF00838F", "800")
        添加项目("0xFF006064", "900")
        添加项目("0xFF84FFFF", "A100")
        添加项目("0xFF18FFFF", "A200")
        添加项目("0xFF00E5FF", "A400")
        添加项目("0xFF00B8D4", "A700")
    end
    if ys == "鸭绿" then
        添加项目("0xFFE0F2F1", "50")
        添加项目("0xFFB2DFDB", "100")
        添加项目("0xFF80CBC4", "200")
        添加项目("0xFF4DB6AC", "300")
        添加项目("0xFF26A69A", "400")
        添加项目("0xFF009688", "500")
        添加项目("0xFF00897B", "600")
        添加项目("0xFF00796B", "700")
        添加项目("0xFF00695C", "800")
        添加项目("0xFF004D40", "900")
        添加项目("0xFFA7FFEB", "A100")
        添加项目("0xFF64FFDA", "A200")
        添加项目("0xFF1DE9B6", "A400")
        添加项目("0xFF00BFA5", "A700")
    end
    if ys == "绿色" then
        添加项目("0xFFE8F5E9", "50")
        添加项目("0xFFC8E6C9", "100")
        添加项目("0xFFA5D6A7", "200")
        添加项目("0xFF81C784", "300")
        添加项目("0xFF66BB6A", "400")
        添加项目("0xFF4CAF50", "500")
        添加项目("0xFF43A047", "600")
        添加项目("0xFF388E3C", "700")
        添加项目("0xFF2E7D32", "800")
        添加项目("0xFF1B5E20", "900")
        添加项目("0xFFB9F6CA", "A100")
        添加项目("0xFF69F0AE", "A200")
        添加项目("0xFF00E676", "A400")
        添加项目("0xFF00C853", "A700")
    end
    if ys == "亮绿" then
        添加项目("0xFFF1F8E9", "50")
        添加项目("0xFFDCEDC8", "100")
        添加项目("0xFFC5E1A5", "200")
        添加项目("0xFFAED581", "300")
        添加项目("0xFF9CCC65", "400")
        添加项目("0xFF8BC34A", "500")
        添加项目("0xFF7CB342", "600")
        添加项目("0xFF689F38", "700")
        添加项目("0xFF558B2F", "800")
        添加项目("0xFF33691E", "900")
        添加项目("0xFFCCFF90", "A100")
        添加项目("0xFFB2FF59", "A200")
        添加项目("0xFF76FF03", "A400")
        添加项目("0xFF64DD17", "A700")
    end
    if ys == "青柠" then
        添加项目("0xFFF9FBE7", "50")
        添加项目("0xFFF0F4C3", "100")
        添加项目("0xFFE6EE9C", "200")
        添加项目("0xFFDCE775", "300")
        添加项目("0xFFD4E157", "400")
        添加项目("0xFFCDDC39", "500")
        添加项目("0xFFC0CA33", "600")
        添加项目("0xFFAFB42B", "700")
        添加项目("0xFF9E9D24", "800")
        添加项目("0xFF827717", "900")
        添加项目("0xFFF4FF81", "A100")
        添加项目("0xFFEEFF41", "A200")
        添加项目("0xFFC6FF00", "A400")
        添加项目("0xFFAEEA00", "A700")
    end
    if ys == "黄色" then
        添加项目("0xFFFFFDE7", "50")
        添加项目("0xFFFFF9C4", "100")
        添加项目("0xFFFFF59D", "200")
        添加项目("0xFFFFF176", "300")
        添加项目("0xFFFFEE58", "400")
        添加项目("0xFFFFEB3B", "500")
        添加项目("0xFFFDD835", "600")
        添加项目("0xFFFBC02D", "700")
        添加项目("0xFFF9A825", "800")
        添加项目("0xFFF57F17", "900")
        添加项目("0xFFFFFF8D", "A100")
        添加项目("0xFFFFFF00", "A200")
        添加项目("0xFFFFEA00", "A400")
        添加项目("0xFFFFD600", "A700")
    end
    if ys == "琥珀" then
        添加项目("0xFFFFF8E1", "50")
        添加项目("0xFFFFECB3", "100")
        添加项目("0xFFFFE082", "200")
        添加项目("0xFFFFD54F", "300")
        添加项目("0xFFFFCA28", "400")
        添加项目("0xFFFFC107", "500")
        添加项目("0xFFFFB300", "600")
        添加项目("0xFFFFA000", "700")
        添加项目("0xFFFF8F00", "800")
        添加项目("0xFFFF6F00", "900")
        添加项目("0xFFFFE57F", "A100")
        添加项目("0xFFFFD740", "A200")
        添加项目("0xFFFFC400", "A400")
        添加项目("0xFFFFAB00", "A700")
    end
    if ys == "橙色" then
        添加项目("0xFFFFF3E0", "50")
        添加项目("0xFFFFE0B2", "100")
        添加项目("0xFFFFCC80", "200")
        添加项目("0xFFFFB74D", "300")
        添加项目("0xFFFFA726", "400")
        添加项目("0xFFFF9800", "500")
        添加项目("0xFFFB8C00", "600")
        添加项目("0xFFF57C00", "700")
        添加项目("0xFFEF6C00", "800")
        添加项目("0xFFE65100", "900")
        添加项目("0xFFFFD180", "A100")
        添加项目("0xFFFFAB40", "A200")
        添加项目("0xFFFF9100", "A400")
        添加项目("0xFFFF6D00", "A700")
    end
    if ys == "深橙" then
        添加项目("0xFFFBE9E7", "50")
        添加项目("0xFFFFCCBC", "100")
        添加项目("0xFFFFAB91", "200")
        添加项目("0xFFFF8A65", "300")
        添加项目("0xFFFF7043", "400")
        添加项目("0xFFFF5722", "500")
        添加项目("0xFFF4511E", "600")
        添加项目("0xFFE64A19", "700")
        添加项目("0xFFD84315", "800")
        添加项目("0xFFBF360C", "900")
        添加项目("0xFFFF9E80", "A100")
        添加项目("0xFFFF6E40", "A200")
        添加项目("0xFFFF3D00", "A400")
        添加项目("0xFFDD2C00", "A700")
    end
    if ys == "棕色" then
        添加项目("0xFFEFEBE9", "50")
        添加项目("0xFFD7CCC8", "100")
        添加项目("0xFFBCAAA4", "200")
        添加项目("0xFFA1887F", "300")
        添加项目("0xFF8D6E63", "400")
        添加项目("0xFF795548", "500")
        添加项目("0xFF6D4C41", "600")
        添加项目("0xFF5D4037", "700")
        添加项目("0xFF4E342E", "800")
        添加项目("0xFF3E2723", "900")
    end
    if ys == "灰色" then
        添加项目("0xFFFAFAFA", "50")
        添加项目("0xFFF5F5F5", "100")
        添加项目("0xFFEEEEEE", "200")
        添加项目("0xFFE0E0E0", "300")
        添加项目("0xFFBDBDBD", "400")
        添加项目("0xFF9E9E9E", "500")
        添加项目("0xFF757575", "600")
        添加项目("0xFF616161", "700")
        添加项目("0xFF424242", "800")
        添加项目("0xFF212121", "900")
    end
    if ys == "蓝灰" then
        添加项目("0xFFECEFF1", "50")
        添加项目("0xFFCFD8DC", "100")
        添加项目("0xFFB0BEC5", "200")
        添加项目("0xFF90A4AE", "300")
        添加项目("0xFF78909C", "400")
        添加项目("0xFF607D8B", "500")
        添加项目("0xFF546E7A", "600")
        添加项目("0xFF455A64", "700")
        添加项目("0xFF37474F", "800")
        添加项目("0xFF263238", "900")
    end
    if ys == "白色" or ys == "黑色" then
        local zsml = ll:match("0xFF(.+)")
        local zsll = "#" .. zsml
        关闭对话框()
        f(zsll)
    end

    colorgv.Adapter = coloradp
end

function ColorPicker(f)
    local bwz
    if 全局主题值 ~= "Night" then
        bwz = 0x3f000000
    else
        bwz = 0x3fffffff
    end

    local dann = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-1",
        {
            LinearLayout,
            orientation = "vertical",
            layout_width = "-1",
            layout_height = "-1",
            id = "ztbj",
            {
                TextView,
                layout_width = "-1",
                layout_height = "-2",
                textSize = "20sp",
                layout_marginTop = "24dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                Text = "选取颜色",
                Typeface = AppFont.特粗,
                textColor = primaryc
            },
            {
                GridView,
                layout_height = "-1",
                layout_width = "-1",
                NumColumns = 5,
                id = "colorgv",
                layout_marginTop = "4dp",
                layout_marginLeft = "24dp",
                layout_marginRight = "24dp",
                layout_weight = "1"
            },
            {
                LinearLayout,
                orientation = "horizontal",
                layout_width = "-1",
                layout_height = "-2",
                gravity = "right|center",
                {
                    CardView,
                    layout_width = "-2",
                    layout_height = "-2",
                    radius = "2dp",
                    background = "#00000000",
                    layout_marginTop = "8dp",
                    layout_marginLeft = "8dp",
                    layout_marginBottom = "16dp",
                    layout_marginRight = "24dp",
                    Elevation = "0",
                    onClick = function()
                        关闭对话框()
                        InputColor(f)
                    end,
                    {
                        TextView,
                        layout_width = "-1",
                        layout_height = "-2",
                        textSize = "16sp",
                        Typeface = AppFont.特粗,
                        paddingRight = "16dp",
                        paddingLeft = "16dp",
                        paddingTop = "8dp",
                        paddingBottom = "8dp",
                        Text = "输入颜色值",
                        textColor = stextc,
                        BackgroundDrawable = activity.Resources.getDrawable(ripples).setColor(
                            ColorStateList(int[0].class { int {} }, int { bwz })
                        )
                    }
                }
            }
        }
    }

    dl = BottomDialog(activity)
    dl.setView(loadlayout(dann))
    dl.setGravity(Gravity.BOTTOM)
    dl.setHeight(WindowManager.LayoutParams.WRAP_CONTENT)
    dl.setMinHeight(0)
    dl.setWidth(WindowManager.LayoutParams.MATCH_PARENT)
    --设置圆角
    dl.setRadius(dp2px(16), 转0x(backgroundc))
    if gb == 0 then
        dl.setCancelable(false)
        dl.setCanceledOnTouchOutside(false)
    else
    end
    an = dl.show()
    if gb == 0 then
    else
        dl.setCanceledOnTouchOutside(true)
    end

    local mml = {
        LinearLayout,
        layout_width = "-1",
        layout_height = "-2",
        gravity = "center",
        onClick = function()
        end,
        {
            CardView,
            radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
            layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
            layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
            layout_margin = "8dp",
            elevation = "0dp",
            {
                RelativeLayout,
                layout_width = "-1",
                layout_height = "-1",
                id = "yb",
                {
                    CardView,
                    radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
                    layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                    layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                    elevation = "0dp",
                    background = "#3f000000",
                    {
                        CardView,
                        radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2)) / 2,
                        layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                        layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 2),
                        elevation = "0dp",
                        background = "#3fFFFFFF",
                        {
                            CardView,
                            radius = ((activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3)) / 2,
                            layout_width = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3),
                            layout_height = (activity.width - dp2px(24 * 2)) / 5 - dp2px(8 * 3),
                            layout_margin = "4dp",
                            elevation = "0dp",
                            {
                                TextView,
                                layout_width = "-1",
                                layout_height = "-1",
                                id = "ybt"
                            }
                        }
                    }
                },
                {
                    TextView,
                    layout_width = "-1",
                    layout_height = "-1",
                    id = "yc",
                    textColor = "#00000000"
                    --textSize=0;
                }
            }
        }
    }

    local coloradp = LuaAdapter(activity, mml)

    local colortable = {
        { "红色", "Red", "0xFFF44336" },
        { "粉色", "Pink", "0xFFE91E63" },
        { "紫色", "Purple", "0xFF9C27B0" },
        { "深紫", "Deep Purple", "0xFF673AB7" },
        { "靛蓝", "Indigo", "0xFF3F51B5" },
        { "蓝色", "Blue", "0xFF2196F3" },
        { "亮蓝", "Light Blue", "0xFF03A9F4" },
        { "青色", "Cyan", "0xFF00BCD4" },
        { "鸭绿", "Teal", "0xFF009688" },
        { "绿色", "Green", "0xFF4CAF50" },
        { "亮绿", "Light Green", "0xFF8BC34A" },
        { "青柠", "Lime", "0xFFCDDC39" },
        { "黄色", "Yello", "0xFFFFEB3B" },
        { "琥珀", "Amber", "0xFFFFC107" },
        { "橙色", "Orange", "0xFFFF9800" },
        { "深橙", "Deep Orange", "0xFFFF5722" },
        { "棕色", "Brown", "0xFF795548" },
        { "灰色", "Grey", "0xFF9E9E9E" },
        { "蓝灰", "Blue Grey", "0xFF607D8B" },
        { "白色", "White", "0xFFFFFFFF" },
        { "黑色", "Black", "0xFF000000" }
    }

    for i, v in ipairs(colortable) do
        coloradp.add {
            yb = { Background = ColorDrawable(tointeger(v[3])) },
            ybt = { Background = ColorDrawable(tointeger(v[3])) },
            yc = {
                BackgroundDrawable = 波纹2("方黑"),
                onClick = function()
                    关闭对话框()
                    ColorPickerChild(v[1], v[3], v[2], f)
                end
            }
        }
    end

    colorgv.Adapter = coloradp
end

function getMeasured(view)
    local height = view.measure(0, 0).height
    local width = view.measure(0, 0).width
    return width, height
end

function getLayout(v)
    return v.getLayoutParams()
end

function setLayout(v, linearParams)
    v.setLayoutParams(linearParams)
end

function onError(s, n)
    printLog("Error", "在" .. s .. "处", n)
    双按钮对话框(
        "运行出错辣(〒﹏〒)",
        "错误信息:\n" .. tostring(n),
        "发送给开发者",
        "取消",
        function()
            关闭对话框()
            复制文本(
                "*错误汇报*\n" ..
                "BRAND: " ..
                厂商 ..
                "\nMODEL: " ..
                型号 ..
                "\nSDK: " ..
                SDK版本 ..
                "\nRELEASE: " ..
                安卓版本 ..
                "\nMANUFACTURER: " ..
                ROM类型 ..
                "\nROMINFO: " ..
                ROM信息 ..
                "\nANDROID_ID: " ..
                安卓ID .. "\nISPHONE: " .. tostring(是否是手机) .. "\n-" .. s .. "-\n" .. tostring(n)
            )
            QQ("1773798610")
            提示("已复制报错")
        end,
        function()
            关闭对话框()
        end
    )
    return true
end

function onDestroy()
    pcall(
        function()
            Glide.get(activity).clearMemory()
        end
    )
    pcall(
        function()
            collectgarbage("collect")
        end
    )
    System.gc()
    if 文件是否存在(内置存储文件("Cache")) then
        删除文件(内置存储文件("Cache"))
    end
    创建文件夹(内置存储文件("Cache"))
end

function base64ToBitmap(strin)
    local bitmapArray = Base64.decode(strin, Base64.DEFAULT)
    return BitmapFactory.decodeByteArray(bitmapArray, 0, #bitmapArray)
end

function base64ToBytes(strin)
    return Base64.decode(strin, Base64.DEFAULT)
end

function bitmapToBase64(bitmap)
    local baos = ByteArrayOutputStream()
    bitmap.compress(Bitmap.CompressFormat.PNG, 100, baos)
    baos.flush()
    baos.close()
    local bitmapBytes = baos.toByteArray()
    local result = Base64.encodeToString(bitmapBytes, Base64.DEFAULT)
    return result
end

function createShortcut(str, str2, str3, str4)
    import "android.content.pm.ShortcutInfo"
    import "android.graphics.drawable.Icon"
    intent = Intent("android.intent.action.MAIN")
    intent.addCategory("android.intent.category.DEFAULT")
    intent.setClassName(activity.getPackageName(), LuaActivity.getName())
    intent.setData(Uri.parse(str))
    if (Build.VERSION.SDK_INT >= 22) then
        intent.addFlags(524288)
        intent.addFlags(0x08000000)
    end
    if (Build.VERSION.SDK_INT >= 26) then
        xpcall(
            function()
                activity.getSystemService("shortcut").requestPinShortcut(
                    ShortcutInfo.Builder(activity, str).setIcon(Icon.createWithBitmap(str3)).setShortLabel(str2).setIntent(intent)
                    .build(

                    ),
                    nil
                )
            end,
            function(e)
                print(e)
            end
        )
    else
        intent2 = Intent("com.android.launcher.action.INSTALL_SHORTCUT")
        intent2.putExtra("android.intent.extra.shortcut.NAME", str2)
        intent2.putExtra("android.intent.extra.shortcut.INTENT", intent)
        intent2.putExtra("duplicate", 0)
        intent2.putExtra("android.intent.extra.shortcut.ICON", str3)
        activity.sendBroadcast(intent2)
    end
end

function keepDecimal(num, n) --保留小数
    n = n or 2
    return string.format("%." .. n .. "f", num)
end

base64 = {}
local __CODE = {
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
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
    "z",
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
    "+",
    "/"
}
local __ASCII_CODE = {
    [65] = 0,
    [66] = 1,
    [67] = 2,
    [68] = 3,
    [69] = 4,
    [70] = 5,
    [71] = 6,
    [72] = 7,
    [73] = 8,
    [74] = 9,
    [75] = 10,
    [76] = 11,
    [77] = 12,
    [78] = 13,
    [79] = 14,
    [80] = 15,
    [81] = 16,
    [82] = 17,
    [83] = 18,
    [84] = 19,
    [85] = 20,
    [86] = 21,
    [87] = 22,
    [88] = 23,
    [89] = 24,
    [90] = 25,
    [97] = 26,
    [98] = 27,
    [99] = 28,
    [100] = 29,
    [101] = 30,
    [102] = 31,
    [103] = 32,
    [104] = 33,
    [105] = 34,
    [106] = 35,
    [107] = 36,
    [108] = 37,
    [109] = 38,
    [110] = 39,
    [111] = 40,
    [112] = 41,
    [113] = 42,
    [114] = 43,
    [115] = 44,
    [116] = 45,
    [117] = 46,
    [118] = 47,
    [119] = 48,
    [120] = 49,
    [121] = 50,
    [122] = 51,
    [48] = 52,
    [49] = 53,
    [50] = 54,
    [51] = 55,
    [52] = 56,
    [53] = 57,
    [54] = 58,
    [55] = 59,
    [56] = 60,
    [57] = 61,
    [43] = 62,
    [47] = 63
}

--encode--编码
function base64.encode(text)
    local len = string.len(text)
    local residual = len % 3
    len = len - residual
    local index = 1
    local ret = {}

    --处理正好转换的部分
    for i = 1, len, 3 do
        local t1 = string.byte(text, i)
        local t2 = string.byte(text, i + 1)
        local t3 = string.byte(text, i + 2)
        --第一个字符左移16位，第二个8位，第三个0位
        local num = t1 * 65536 + t2 * 256 + t3
        for j = 3, 0, -1 do
            --右移移18、12、6、0位
            local tmp = math.floor(num / (2 ^ (j * 6)))
            local pos = tmp % 64 + 1
            ret[index] = __CODE[pos]
            index = index + 1
        end
    end

    --处理不能正好转换的部分
    if residual == 1 then
        local num = string.byte(text, len + 1)
        --左移4位，总共占8+4=12位，编码位2个base64字符
        num = num * 16
        --右移6位
        local pos = math.floor(num / 64) % 64 + 1
        ret[index] = __CODE[pos]
        pos = num % 64 + 1
        ret[index + 1] = __CODE[pos]
        ret[index + 2] = "="
        ret[index + 3] = "="
    elseif residual == 2 then
        local num1 = string.byte(text, len + 1)
        local num2 = string.byte(text, len + 2)
        --num1左移10位，num2左移2位
        local num = num1 * 1024 + num2 * 4
        --右移12位
        local pos = math.floor(num / 4096) % 64 + 1
        ret[index] = __CODE[pos]
        --右移6位
        pos = math.floor(num / 64) % 64 + 1
        ret[index + 1] = __CODE[pos]
        pos = num % 64 + 1
        ret[index + 2] = __CODE[pos]
        ret[index + 3] = "="
    end
    return table.concat(ret)
end

--decode
function base64.decode(text)
    local len = string.len(text)
    if (len % 4 ~= 0) then
        return nil
    end

    local residual = 0
    if string.sub(text, len - 1) == "==" then
        residual = 2
        len = len - 4
    elseif string.sub(text, len) == "=" then
        residual = 1
        len = len - 4
    end
    local index = 1
    local ret = {}
    --处理正好转换的部分
    for i = 1, len, 4 do
        local t1 = __ASCII_CODE[string.byte(text, i)]
        local t2 = __ASCII_CODE[string.byte(text, i + 1)]
        local t3 = __ASCII_CODE[string.byte(text, i + 2)]
        local t4 = __ASCII_CODE[string.byte(text, i + 3)]
        local num = t1 * 262144 + t2 * 4096 + t3 * 64 + t4
        local t5 = string.char(num % 256)
        num = math.floor(num / 256)
        local t6 = string.char(num % 256)
        num = math.floor(num / 256)
        local t7 = string.char(num % 256)
        ret[index] = t7
        ret[index + 1] = t6
        ret[index + 2] = t5
        index = index + 3
    end

    --处理不能正好转换的部分
    if residual == 1 then
        local t8 = __ASCII_CODE[string.byte(text, len + 1)]
        local t9 = __ASCII_CODE[string.byte(text, len + 2)]
        local t10 = __ASCII_CODE[string.byte(text, len + 3)]
        local num = t8 * 4096 + t9 * 64 + t10
        local pos = math.floor(num / 1024) % 256
        ret[index] = string.char(pos)
        pos = math.floor(num / 4) % 256
        ret[index + 1] = string.char(pos)
    elseif residual == 2 then
        local t8 = __ASCII_CODE[string.byte(text, len + 1)]
        local t9 = __ASCII_CODE[string.byte(text, len + 2)]
        local num = t8 * 64 + t9
        local pos = math.floor(num / 16)
        ret[index] = string.char(pos)
    end
    return table.concat(ret)
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function firstToLower(str)
    return (str:gsub("^%u", string.lower))
end

function getUA()
    local web = WebView(this)
    local userAgentString = web.getSettings().getUserAgentString()
    web = nil
    return userAgentString
end

--hoyosettings
if not 文件是否存在(新内置存储文件("Settings")) then
    创建文件夹(新内置存储文件("Settings"))
end
if not 文件是否存在(新内置存储文件("Settings/device_id")) then
    创建文件(新内置存储文件("Settings/device_id"))
    写入文件(新内置存储文件("Settings/device_id"), string.lower(tostring(UUID.randomUUID())))
end
if not 文件是否存在(新内置存储文件("Settings/readme.txt")) then
    创建文件(新内置存储文件("Settings/readme.txt"))
end
写入文件(新内置存储文件("Settings/readme.txt"), [[Settings文件夹内的文件不建议改
不过为了以防万一我还是说明一下每个文件的作用

device_id:
 - 保存用于请求米游社API的设备id，可能对防止风控有效？
 - 如果你可以获取到米游社请求的device_id，可以更改该文件的内容，其他时候不建议更改
 - 删除该文件可以重置内容
]])

device_id = 读取文件(新内置存储文件("Settings/device_id"))
