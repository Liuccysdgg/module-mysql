-- mysql_builder_delete.lua
local mysql_builder_delete = {}
mysql_builder_delete.__index = mysql_builder_delete

--[[
    创建一个新的 fw_mysql_builder_delete 对象
    @return 返回一个新的 fw_mysql_builder_delete 对象
]]
function mysql_builder_delete.new(__module)
    local instance = setmetatable({}, mysql_builder_delete)
    instance.module =__module
    return instance
end

--[[
    设置要删除的表名
    @param table_name 表名
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:table(table_name)
    self.module:table(table_name)
    return self
end

--[[
    添加 int32 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:where_i32(name, expression, value)
    self.module:where_i32(name, expression, value)
    return self
end

--[[
    添加 int64 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:where_i64(name, expression, value)
    self.module:where_i64(name, expression, value)
    return self
end

--[[
    添加 double 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:where_dob(name, expression, value)
    self.module:where_dob(name, expression, value)
    return self
end

--[[
    添加字符串类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:where_str(name, expression, value)
    self.module:where_str(name, expression, value)
    return self
end

--[[
    添加自定义表达式的条件
    @param expression 条件表达式
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:where_expression(expression)
    self.module:where_expression(expression)
    return self
end

--[[
    设置分页参数
    @param page 页码
    @param count 每页记录数
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:page(page, count)
    self.module:page(page, count)
    return self
end

--[[
    设置查询限制
    @param start 起始位置
    @param count 记录数
    @return 返回 mysql_builder_delete 对象自身，以便链式调用
]]
function mysql_builder_delete:limit(start, count)
    self.module:limit(start, count)
    return self
end


--[[
    设置排序
    @param orderby 排序语句
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_delete:orderby(orderby)
    self.module:orderby(orderby)
    return self
end

--[[
    执行删除操作
    @return 返回受影响的行数
]]
function mysql_builder_delete:exec()
    return self.module:exec()
end

--[[
    清空删除条件
]]
function mysql_builder_delete:clear()
    self.module:clear()
end

return mysql_builder_delete
