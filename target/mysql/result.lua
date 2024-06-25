-- mysql_result.lua
local mysql_result = {}
mysql_result.__index = mysql_result

--[[
    创建一个新的 fw_mysql_result 对象
    @return 返回一个新的 fw_mysql_result 对象
]]
function mysql_result.new(__module)
    local instance = setmetatable({}, mysql_result)
    instance.module = __module
    return instance
end

--[[
    获取字段数
    @return 返回字段数
]]
function mysql_result:field_count()
    return self.module:field_count()
end

--[[
    获取字段类型
    @param obj 字段对象
    @return 返回字段类型字符串
]]
function mysql_result:field_type(obj)
    return self.module:field_type(obj)
end

--[[
    获取字段名称
    @param index 字段索引
    @return 返回字段名称字符串
]]
function mysql_result:field_name(index)
    return self.module:field_name(index)
end

--[[
    获取结果行数
    @return 返回结果行数
]]
function mysql_result:row_count()
    return self.module:row_count()
end

--[[
    移动到下一行
    @return 是否成功移动到下一行
]]
function mysql_result:next()
    return self.module:next()
end

--[[
    获取数据
    @param obj 数据对象
    @return 返回数据对象
]]
function mysql_result:get(obj)
    return self.module:get(obj)
end

--[[
    获取结果集到表
    @return 返回结果集表
]]
function mysql_result:table()
    return self.module:table()
end

return mysql_result
