local select = require("mysql.builder_select")
local update = require("mysql.builder_update")
local insert = require("mysql.builder_insert")
local delete = require("mysql.builder_delete")
local ppst = require("mysql.prepare_statement")


local mysql_conn = {}
mysql_conn.__index = mysql_conn

--[[
    创建一个新的 fw_mysql_conn 对象
    @return 返回一个新的 fw_mysql_conn 对象
]]
function mysql_conn.new(__module)
    local instance = setmetatable({}, mysql_conn)
    if __module == nil then
        instance.module = fw_mysql_conn.new()
    else
        instance.module = __module    
    end
    
    return instance
end
--[[
    连接到 MySQL 数据库
    @param ipaddress IP 地址
    @param username 用户名
    @param password 密码
    @param database 数据库名称
    @param charset 字符集
    @param port 端口号
    @return 返回连接状态码
]]
function mysql_conn:connect(ipaddress, username, password, database, charset, port)
    return self.module:connect(ipaddress, username, password, database, charset, port)
end

--[[
    清空连接
]]
function mysql_conn:clear()
    self.module:clear()
end

--[[
    设置 SQL 语句
    @param sql SQL 语句
    @return 返回 mysql_prepare_statement 对象
]]
function mysql_conn:setsql(sql)
    return ppst.new(self.module:setsql(sql))
end

--[[
    获取上一次插入操作的 ID
    @return 返回上一次插入操作的 ID
]]
function mysql_conn:insert_id()
    return self.module:insert_id()
end

--[[
    开始事务
    @param autocommit 是否自动提交
]]
function mysql_conn:begin(autocommit)
    self.module:begin(autocommit or false)
end

--[[
    提交事务
]]
function mysql_conn:commit()
    self.module:commit()
end

--[[
    回滚事务
]]
function mysql_conn:rollback()
    self.module:rollback()
end

--[[
    设置数据库名称
    @param name 数据库名称
]]
function mysql_conn:setDatabase(name)
    self.module:setDatabase(name)
end

--[[
    获取最后的错误信息
    @return 返回错误信息字符串
]]
function mysql_conn:last_error()
    return self.module:last_error()
end

--[[
    获取一个 select 对象
    @return 返回一个 select 对象
]]
function mysql_conn:select()
    return select.new(self.module:select())
end

--[[
    获取一个 insert 对象
    @return 返回一个 insert 对象
]]
function mysql_conn:insert()
    return insert.new(self.module:insert())
end

--[[
    获取一个 update 对象
    @return 返回一个 update 对象
]]
function mysql_conn:update()
    return update.new(self.module:update())
end

--[[
    获取一个 delete 对象
    @return 返回一个 delete 对象
]]
function mysql_conn:delete()
    return delete.new(self.module:delete())
end

return mysql_conn
