local result = require("mysql.result")

local mysql_builder_select = {}
mysql_builder_select.__index = mysql_builder_select

--[[
    创建一个新的 fw_mysql_builder_select 对象
    @return 返回一个新的 fw_mysql_builder_select 对象
]]
function mysql_builder_select.new(__module)
    local instance = setmetatable({}, mysql_builder_select)
    instance.module = __module
    return instance
end

--[[
    添加 int32 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_i32(name, expression, value)
    self.module:where_i32(name, expression, value)
    return self
end

--[[
    添加 int64 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_i64(name, expression, value)
    self.module:where_i64(name, expression, value)
    return self
end

--[[
    添加 double 类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_dob(name, expression, value)
    self.module:where_dob(name, expression, value)
    return self
end

--[[
    添加字符串类型的条件
    @param name 字段名称
    @param expression 条件表达式
    @param value 值
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_str(name, expression, value)
    self.module:where_str(name, expression, value)
    return self
end

--[[
    添加自定义表达式的条件
    @param expression 条件表达式
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_expression(expression)
    self.module:where_expression(expression)
    return self
end

--[[
    添加 LIKE 条件
    @param name 字段名称
    @param value 值
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:where_like(name, value)
    self.module:where_like(name, value)
    return self
end

--[[
    设置查询的表名
    @param table_name 表名
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:table(table_name)
    self.module:table(table_name)
    return self
end

--[[
    设置查询的字段
    @param table 字段表
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:field(table)
    self.module:field(table)
    return self
end

--[[
    设置分页参数
    @param page 页码
    @param count 每页记录数
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:page(page, count)
    self.module:page(page, count)
    return self
end

--[[
    设置查询限制
    @param start 起始位置
    @param count 记录数
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:limit(start, count)
    self.module:limit(start, count)
    return self
end

--[[
    设置排序
    @param field 字段名称
    @param sort 排序方式（升序或降序）
    @return 返回 mysql_builder_select 对象自身，以便链式调用
]]
function mysql_builder_select:orderby(field, sort)
    self.module:orderby(field, sort)
    return self
end

--[[
    清空查询条件
]]
function mysql_builder_select:clear()
    self.module:clear()
end

--[[
    执行查询
    @return 返回 mysql_result 对象
]]
function mysql_builder_select:query()
    return result.new(self.module:query())
end

--[[
    获取查询结果的记录数
    @return 返回记录数
]]
function mysql_builder_select:count()
    return self.module:count()
end

return mysql_builder_select
