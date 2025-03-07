-- mysql_builder_insert.lua
local mysql_builder_insert = {}
mysql_builder_insert.__index = mysql_builder_insert

--[[
    创建一个新的 fw_mysql_builder_insert 对象
    @return 返回一个新的 fw_mysql_builder_insert 对象
]]
function mysql_builder_insert.new(__module)
    local instance = setmetatable({}, mysql_builder_insert)
    instance.module = __module
    return instance
end

--[[
    设置要插入的表名
    @param table_name 表名
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:table(table_name)
    self.module:table(table_name)
    return self
end

--[[
    设置 int32 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_i32(name, value)
    self.module:set_i32(name, fw_toint(value))
    return self
end

--[[
    设置 int64 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_i64(name, value)
    self.module:set_i64(name, fw_toint(value))
    return self
end

--[[
    设置 double 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_dob(name, value)
    self.module:set_dob(name, value)
    return self
end

--[[
    设置字符串类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_str(name, value)
    self.module:set_str(name, value)
    return self
end

--[[
    设置 blob 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_blob(name, value)
    self.module:set_blob(name, value)
    return self
end

--[[
    设置不作为预处理语句的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_insert 对象自身，以便链式调用
]]
function mysql_builder_insert:set_not_ppst(name, value)
    self.module:set_not_ppst(name, value)
    return self
end

--[[
    执行插入操作
    @return 返回受影响的行数
]]
function mysql_builder_insert:exec()
    return self.module:exec()
end

--[[
    清空插入语句
]]
function mysql_builder_insert:clear()
    self.module:clear()
end

return mysql_builder_insert
