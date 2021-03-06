require "Cocos2d"
-- cclog
cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
end

local function main()
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

	require "init"
	init.init()
	
	require "login/login"
	login.login()
end

xpcall(main, __G__TRACKBACK__)
