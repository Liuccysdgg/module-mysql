local result = require("mysql.result")

local mysql_prepare_statement = {}
mysql_prepare_statement.__index = mysql_prepare_statement

--[[
    创建一个新的 fw_mysql_prepare_statement 对象
    @return 返回一个新的 fw_mysql_prepare_statement 对象
]]
function mysql_prepare_statement.new(__module)
    local instance = setmetatable({}, mysql_prepare_statement)
    instance.module =__module
    return instance
end

--[[
    设置 bigint 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_bigint(index, value)
    self.module:set_bigint(index, fw_toint(value))
end

--[[
    设置 boolean 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_boolean(index, value)
    self.module:set_boolean(index, value)
end

--[[
    设置 datetime 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_datetime(index, value)
    self.module:set_datetime(index, value)
end

--[[
    设置 double 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_dob(index, value)
    self.module:set_dob(index, value)
end

--[[
    设置 int32 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_i32(index, value)
    self.module:set_i32(index, fw_toint(value))
end

--[[
    设置 int64 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_i64(index, value)
    self.module:set_i64(index, fw_toint(value))
end

--[[
    设置 null 类型的参数
    @param index 参数索引
]]
function mysql_prepare_statement:set_null(index)
    self.module:set_null(index)
end

--[[
    设置字符串类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_str(index, value)
    self.module:set_str(index, value)
end

--[[
    设置 blob 类型的参数
    @param index 参数索引
    @param value 参数值
]]
function mysql_prepare_statement:set_blob(index, value)
    self.module:set_blob(index, value)
end

--[[
    清空所有参数
]]
function mysql_prepare_statement:clear()
    self.module:clear()
end

--[[
    执行 update 操作
    @return 返回受影响的行数
]]
function mysql_prepare_statement:update()
    return self.module:update()
end

--[[
    执行 query 操作
    @return 返回 mysql_result 对象
]]
function mysql_prepare_statement:query()
    return result.new(self.module:query())
end

return mysql_prepare_statement
