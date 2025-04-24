local select = require("mysql.builder_select")
local update = require("mysql.builder_update")
local insert = require("mysql.builder_insert")
local delete = require("mysql.builder_delete")
local conn = require("mysql.conn")



local mysql_pool = {}
mysql_pool.__index = mysql_pool

--[[
    创建一个新的 fw_mysql_pool 对象
    @return 返回一个新的 fw_mysql_pool 对象
]]
function mysql_pool.new(pool)
    local instance = setmetatable({}, mysql_pool)
    if pool == nil then
        instance.module = fw_mysql_pool.new()
    else
        instance.module = pool
    end
    return instance
end

--[[
    启动 MySQL 连接池
    @param ipaddress IP 地址
    @param username 用户名
    @param password 密码
    @param database 数据库名称
    @param charset 字符集
    @param port 端口号
    @param size 连接池大小
    @return 是否成功启动
]]
function mysql_pool:start(ipaddress, username, password, database, charset, port, size)
    return self.module:start(ipaddress, username, password, database, charset, port, size)
end

--[[
    关闭 MySQL 连接池
]]
function mysql_pool:close()
    self.module:close()
end

--[[
    获取一个 select 对象
    @return 返回一个 select 对象
]]
function mysql_pool:select()
    return select.new(self.module:select())
end

--[[
    获取一个 insert 对象
    @return 返回一个 insert 对象
]]
function mysql_pool:insert()
    return insert.new(self.module:insert())
end

--[[
    获取一个 update 对象
    @return 返回一个 update 对象
]]
function mysql_pool:update()
    return update.new(self.module:update())
end

--[[
    获取一个 delete 对象
    @return 返回一个 delete 对象
]]
function mysql_pool:delete()
    return delete.new(self.module:delete())
end

--[[
    获取一个 mysql_conn 对象
    @return 返回一个 mysql_conn 对象
]]
function mysql_pool:get()
    return conn.new(self.module:get())
end
--[[
    取自身指针
]]
function mysql_pool:self()
    return self.module:self()
end
--[[
    强制回收连接
]]
function mysql_pool:recover(conn)
    if conn == nil then
        return
    end
    return self.module:recover(conn.module)
end


return mysql_pool
