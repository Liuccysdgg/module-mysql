-- mysql_builder_update.lua
local mysql_builder_update = {}
mysql_builder_update.__index = mysql_builder_update

--[[
    创建一个新的 fw_mysql_builder_update 对象
    @return 返回一个新的 fw_mysql_builder_update 对象
]]
function mysql_builder_update.new(__module)
    local instance = setmetatable({}, mysql_builder_update)
    instance.module = __module
    return instance
end

--[[
    设置要更新的表名
    @param table_name 表名
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:table(table_name)
    self.module:table(table_name)
    return self
end

--[[
    设置 int32 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set_i32(name, value)
    self.module:set_i32(name, fw_toint(value))
    return self
end

--[[
    设置 int64 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set_i64(name, value)
    self.module:set_i64(name, fw_toint(value))
    return self
end

--[[
    设置 double 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set_dob(name, value)
    self.module:set_dob(name, value)
    return self
end

--[[
    设置字符串类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set_str(name, value)
    self.module:set_str(name, value)
    return self
end

--[[
    设置 blob 类型的字段
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set_blob(name, value)
    self.module:set_blob(name, value)
    return self
end

--[[
    设置自定义表达式的字段
    @param expression 自定义表达式
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:set(expression)
    self.module:set(expression)
    return self
end

--[[
    添加 int32 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:where_i32(name, expression, value)
    self.module:where_i32(name, expression, fw_toint(value))
    return self
end

--[[
    添加 int64 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:where_i64(name, expression, value)
    self.module:where_i64(name, expression, fw_toint(value))
    return self
end

--[[
    添加 double 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:where_dob(name, expression, value)
    self.module:where_dob(name, expression, value)
    return self
end

--[[
    添加字符串类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:where_str(name, expression, value)
    self.module:where_str(name, expression, value)
    return self
end

--[[
    添加自定义表达式的条件
    @param expression 条件表达式
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:where_expression(expression)
    self.module:where_expression(expression)
    return self
end

--[[
    设置分页参数
    @param page 页码
    @param count 每页记录数
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:page(page, count)
    self.module:page(fw_toint(page), fw_toint(count))
    return self
end

--[[
    设置查询限制
    @param start 起始位置
    @param count 记录数
    @return 返回 mysql_builder_update 对象自身，以便链式调用
]]
function mysql_builder_update:limit(start, count)
    self.module:limit(fw_toint(start), fw_toint(count))
    return self
end

--[[
    设置排序
    @param orderby 排序语句
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_update:orderby(orderby)
    self.module:orderby(orderby)
    return self
end
--[[
    执行更新操作
    @return 返回受影响的行数
]]
function mysql_builder_update:exec()
    return self.module:exec()
end

--[[
    清空查询条件
]]
function mysql_builder_update:clear()
    self.module:clear()
end

return mysql_builder_update
