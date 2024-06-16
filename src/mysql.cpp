#include "mysql.h"
#include "util/time.h"
#include "dll_interface.h"

extern "C" {
#ifdef _WIN32
    DLL_EXPORT
#endif
        int fastweb_module_regist(void* sol2, void* lua)
    {
        sol::state* state = static_cast<sol::state*>(sol2);
        module::mysql_regist(state);
        return 0;
    }
}
module::select::select(ylib::mysql::conn *conn, bool auto_free_conn):mysql_builder(auto_free_conn)
{
    m_select = std::make_shared<ylib::select>(conn);
}

module::select::~select()
{
    if (m_auto_free_conn == false)
        m_select->m_conn = nullptr;
}

module::select& module::select::where_i32(const std::string& name, const std::string& expression, int32 value)
{
    m_select->where(name,expression,value);
    return *this;
}

module::select& module::select::where_i64(const std::string& name, const std::string& expression, int64 value)
{
    m_select->where(name, expression, value);
    return *this;
}

module::select& module::select::where_dob(const std::string& name, const std::string& expression, double value)
{
    m_select->where(name, expression, value);
    return *this;
}

module::select& module::select::where_str(const std::string& name, const std::string& expression, const std::string& value)
{
    m_select->where(name, expression, value);
    return *this;
}

module::select& module::select::where_expression(const std::string& expression)
{
    m_select->where(expression);
    return *this;
}

module::select& module::select::where_like(const std::string& name, const std::string& value)
{
    m_select->where_like(name, value);
    return *this;
}

module::select& module::select::table(const std::string& table_name)
{
    m_select->table(table_name);
    return *this;
}

module::select& module::select::field(sol::table table)
{
    std::vector<std::string> strings;
    for (auto& pair : table) {
        if (pair.second.get_type() != sol::type::string)
        {
            throw ylib::exception("module::select::field:  attempting to obtain field name that is not a string");
        }
        strings.push_back(pair.second.as<std::string>());
    }
    m_select->field(strings);
    return *this;
}

module::select& module::select::page(uint32 page, uint32 count)
{
    m_select->page(page,count);
    return *this;
}

module::select& module::select::limit(uint32 start, uint32 count)
{
    m_select->limit(start,count);
    return *this;
}

module::select& module::select::orderby(const std::string& field, int sort)
{
    m_select->orderby(field,(ylib::sort)sort);
    return *this;
}

void module::select::clear()
{
    m_select->clear();
}

std::shared_ptr<module::mysql_result> module::select::query()
{
    return std::make_shared<module::mysql_result>(m_select->query());
}

uint64 module::select::count()
{
    return m_select->count();
}

void module::select::regist(sol::state* lua)
{
    lua->new_usertype<module::select>("fw_mysql_builder_select",
        "count", &module::select::count,
        "field", &module::select::field,
        "limit", &module::select::limit,
        "orderby", &module::select::orderby,
        "page", &module::select::page,
        "table", &module::select::table,
        "where_dob", &module::select::where_dob,
        "where_expression", &module::select::where_expression,
        "where_i32", &module::select::where_i32,
        "where_i64", &module::select::where_i64,
        "where_str", &module::select::where_str,
        "query", &module::select::query,
        "clear", &module::select::clear,
        "where_like", &module::select::where_like,
        "clear", &module::select::clear
    );
}

module::update::update(ylib::mysql::conn* conn, bool auto_free_conn) :mysql_builder(auto_free_conn)
{
    m_update = std::make_shared<ylib::update>(conn);
}

module::update::~update()
{
    if (m_auto_free_conn == false)
        m_update->m_conn = nullptr;
}

module::update& module::update::table(const std::string& table_name)
{
    m_update->table(table_name);
    return *this;
}

module::update& module::update::set_i32(const std::string& name, int32 value)
{
    m_update->set(name, value);
    return *this;
}

module::update& module::update::set_i64(const std::string& name, int64 value)
{
    m_update->set(name, value);
    return *this;
}

module::update& module::update::set_dob(const std::string& name, double value)
{
    m_update->set(name, value);
    return *this;
}

module::update& module::update::set_blob(const std::string& name, const std::string_view& value)
{
    std::vector<uchar> byte_vct;
    byte_vct.resize(value.length());

    for (size_t i = 0; i < value.size(); i++)
        byte_vct[i] = (uchar)value[i];

    m_update->set(name,byte_vct);
    return *this;
}

module::update& module::update::set_str(const std::string& name, const std::string& value)
{
    m_update->set(name, value);
    return *this;
}

module::update& module::update::set(const std::string& expression)
{
    m_update->set(expression);
    return *this;
}

module::update& module::update::where_i32(const std::string& name, const std::string& expression, int32 value)
{
    m_update->where(name,expression,value);
    return *this;
}

module::update& module::update::where_i64(const std::string& name, const std::string& expression, int64 value)
{
    m_update->where(name, expression, value);
    return *this;
}

module::update& module::update::where_dob(const std::string& name, const std::string& expression, double value)
{
    m_update->where(name, expression, value);
    return *this;
}

module::update& module::update::where_str(const std::string& name, const std::string& expression, const std::string& value)
{
    m_update->where(name, expression, value);
    return *this;
}

module::update& module::update::where_expression(const std::string& expression)
{
    m_update->where(expression);
    return *this;
}

module::update& module::update::page(uint32 page, uint32 count)
{
    m_update->page(page,count);
    return *this;
}

module::update& module::update::limit(uint32 start, uint32 count)
{
    m_update->limit(start, count);
    return *this;
}

module::update& module::update::orderby(const std::string& field, int sort)
{
    m_update->orderby(field,(ylib::sort)sort);
    return *this;
}

uint64 module::update::exec()
{
    return m_update->exec();
}

void module::update::clear()
{
    m_update->clear();
}

void module::update::regist(sol::state* lua)
{
    lua->new_usertype<module::update>("fw_mysql_builder_update",
        "exec", &module::update::exec,
        "limit", &module::update::limit,
        "orderby", &module::update::orderby,
        "page", &module::update::page,
        "table", &module::update::table,
        "where_dob", &module::update::where_dob,
        "where_expression", &module::update::where_expression,
        "where_i32", &module::update::where_i32,
        "where_i64", &module::update::where_i64,
        "where_str", &module::update::where_str,
        "set", &module::update::set,
        "set_dob", &module::update::set_dob,
        "set_i32", &module::update::set_i32,
        "set_i64", &module::update::set_i64,
        "set_str", &module::update::set_str,
        "set_blob", &module::update::set_blob,
        "clear", &module::update::clear
    );
}

module::insert::insert(ylib::mysql::conn* conn, bool auto_free_conn) :mysql_builder(auto_free_conn)
{
    m_insert = std::make_shared<ylib::insert>(conn);
}

module::insert::~insert()
{
    if (m_auto_free_conn == false)
        m_insert->m_conn = nullptr;
}

module::insert& module::insert::table(const std::string& table_name)
{
    m_insert->table(table_name);
    return *this;
}

module::insert& module::insert::set_i32(const std::string& name, int32 value)
{
    m_insert->set(name, value);
    return *this;
}

module::insert& module::insert::set_i64(const std::string& name, int64 value)
{
    m_insert->set(name, value);
    return *this;
}

module::insert& module::insert::set_dob(const std::string& name, double value)
{
    m_insert->set(name, value);
    return *this;
}

module::insert& module::insert::set_str(const std::string& name, const std::string& value)
{
    m_insert->set(name, value);
    return *this;
}

module::insert& module::insert::set_blob(const std::string& name, const std::string_view& value)
{
    std::vector<uchar> byte_vct;
    byte_vct.resize(value.length());

    for (size_t i = 0; i < value.size(); i++)
        byte_vct[i] = (uchar)value[i];

    m_insert->set(name, byte_vct);
    return *this;
}

module::insert& module::insert::set_not_ppst(const std::string& name, const std::string& value)
{
    m_insert->set_not_pret(name, value);
    return *this;
}

uint64 module::insert::exec()
{
    return m_insert->exec();
}

void module::insert::clear()
{
    m_insert->clear();
}

void module::insert::regist(sol::state* lua)
{
    lua->new_usertype<module::insert>("fw_mysql_builder_insert",
        "exec", &module::insert::exec,
        "table", &module::insert::table,
        "set_not_ppst", &module::insert::set_not_ppst,
        "set_dob", &module::insert::set_dob,
        "set_i32", &module::insert::set_i32,
        "set_i64", &module::insert::set_i64,
        "set_str", &module::insert::set_str,
        "set_blob", &module::insert::set_blob,
        "clear", &module::insert::clear
    );
}



module::delete_::delete_(ylib::mysql::conn* conn, bool auto_free_conn) :mysql_builder(auto_free_conn)
{
    m_delete = std::make_shared<ylib::delete_>(conn);
}

module::delete_::~delete_()
{
    if (m_auto_free_conn == false)
        m_delete->m_conn = nullptr;
}

module::delete_& module::delete_::table(const std::string& table_name)
{
    m_delete->table(table_name);
    return *this;
}
module::delete_& module::delete_::where_i32(const std::string& name, const std::string& expression, int32 value)
{
    m_delete->where(name, expression, value);
    return *this;
}

module::delete_& module::delete_::where_i64(const std::string& name, const std::string& expression, int64 value)
{
    m_delete->where(name, expression, value);
    return *this;
}

module::delete_& module::delete_::where_dob(const std::string& name, const std::string& expression, double value)
{
    m_delete->where(name, expression, value);
    return *this;
}

module::delete_& module::delete_::where_str(const std::string& name, const std::string& expression, const std::string& value)
{
    m_delete->where(name, expression, value);
    return *this;
}

module::delete_& module::delete_::where_expression(const std::string& expression)
{
    m_delete->where(expression);
    return *this;
}

module::delete_& module::delete_::page(uint32 page, uint32 count)
{
    m_delete->page(page, count);
    return *this;
}

module::delete_& module::delete_::limit(uint32 start, uint32 count)
{
    m_delete->limit(start, count);
    return *this;
}

module::delete_& module::delete_::orderby(const std::string& field, int sort)
{
    m_delete->orderby(field, (ylib::sort)sort);
    return *this;
}

uint64 module::delete_::exec()
{
    return m_delete->exec();
}

void module::delete_::clear()
{
    m_delete->clear();
}

void module::delete_::regist(sol::state* lua)
{
    lua->new_usertype<module::delete_>("fw_mysql_builder_delete",
        "exec", &module::delete_::exec,
        "limit", &module::delete_::limit,
        "orderby", &module::delete_::orderby,
        "page", &module::delete_::page,
        "table", &module::delete_::table,
        "where_dob", &module::delete_::where_dob,
        "where_expression", &module::delete_::where_expression,
        "where_i32", &module::delete_::where_i32,
        "where_i64", &module::delete_::where_i64,
        "where_str", &module::delete_::where_str,
        "clear", &module::delete_::clear
    );
}

void module::mysql_regist(sol::state* lua)
{
    (*lua)["DESC"] = ylib::sort::DESC;
    (*lua)["ASC"] = ylib::sort::ASC;
    
    //lua->new_usertype<ylib::mysql::conn>("mysql_conn",
    //    "clear", &ylib::mysql::conn::clear,
    //    "close", &ylib::mysql::conn::close,
    //    "commit", &ylib::mysql::conn::commit,
    //    "insert_id", &ylib::mysql::conn::insert_id,
    //    "last_error", &ylib::mysql::conn::last_error,
    //    "recover", &ylib::mysql::conn::recover,
    //    "rollback", &ylib::mysql::conn::rollback,
    //    "setsql", &ylib::mysql::conn::setsql
    //);
    lua->new_usertype<module::mysql>("fw_mysql_pool",
        "new", sol::constructors<module::mysql()>(),
        "start", &module::mysql::start,
        "close", &module::mysql::close,
        "self", &module::mysql::self,
        "select", &module::mysql::select,
        "update", &module::mysql::update,
        "insert", &module::mysql::insert,
        "delete", &module::mysql::delete_,
        "get", &module::mysql::get
    );
    module::mysql_result::regist(lua);

    module::select::regist(lua);
    module::update::regist(lua);
    module::delete_::regist(lua);
    module::insert::regist(lua);
    module::mysql_conn::regist(lua);
    module::mysql_prepare_statement::regist(lua);

}

module::mysql::mysql()
{
}

module::mysql::~mysql()
{
    close();
}

bool module::mysql::start(const std::string& ipaddress, const std::string& username, const std::string& password, const std::string& database, const std::string& charset, ushort port, int32 size)
{
    close();
    m_pool = std::make_shared<ylib::mysql::pool>();
    ylib::mysql::mysql_conn_info info;
    info.ipaddress = ipaddress;
    info.username = username;
    info.password = password;
    info.charset = charset;
    info.port = port;
    info.database = database;
    return m_pool->start(info, size);
}

void module::mysql::close()
{

}

std::shared_ptr<module::select> module::mysql::select()
{
    return std::make_shared<module::select>(m_pool->get(), true);
}

std::shared_ptr<module::insert> module::mysql::insert()
{
    return std::make_shared<module::insert>(m_pool->get(),true);
}

std::shared_ptr<module::update> module::mysql::update()
{
    return std::make_shared<module::update>(m_pool->get(), true);
}

std::shared_ptr<module::delete_> module::mysql::delete_()
{
    return std::make_shared<module::delete_>(m_pool->get(), true);
}

std::shared_ptr<module::mysql_conn> module::mysql::get()
{
    return std::make_shared<module::mysql_conn>(m_pool->get());
}

void module::mysql::regist_global(const char* name, sol::state* lua)
{
    lua->registry()[name] = this;
    (*lua)[name] = this;
}
module::mysql_result::mysql_result(ylib::mysql::result* result):m_result(result)
{

}

module::mysql_result::~mysql_result()
{

}
uint32 module::mysql_result::field_count()
{
    return m_result->field_count();
}

std::string module::mysql_result::field_type(sol::object obj)
{
    if (obj.is<int>() || obj.is<double>()) {
        m_result->field_type((uint32)obj.as<int>());
    }
    else if (obj.is<std::string>()) {
        m_result->field_type((std::string)obj.as<std::string>());
    }
    return "";
}
std::string module::mysql_result::field_name(uint32 index)
{
    return m_result->field_name(index);
}

size_t module::mysql_result::row_count()
{
    return m_result->row_count();
}

bool module::mysql_result::next()
{
    return m_result->next();
}

sol::object module::mysql_result::get(sol::object obj, sol::this_state s)
{
    std::string type;
    if (obj.get_type() == sol::type::string)
        type = m_result->field_type(obj.as<std::string>());
    else if (obj.get_type() == sol::type::number)
        type = m_result->field_type(obj.as<int>());
     
#define GET_VALUE(FUNCTION)                                                                                             \
    if (obj.get_type() == sol::type::string)                                                                                    \
        return sol::make_object(s, m_result->FUNCTION(obj.as<std::string>()));                          \
    else if (obj.get_type() == sol::type::number)                                                                           \
        return sol::make_object(s, m_result->FUNCTION(obj.as<uint32>()))

    if (type == "int" || type == "tinyint")
    {
        GET_VALUE(get_int32);
    }
      
    else if (type == "varchar" || type == "char" || type == "text" || type == "datetime")
    {
        GET_VALUE(get_string);
    }
    else if (type == "int unsigned")
    {
        GET_VALUE(get_uint32);
    }
    else if (type == "bigint")
    {
        GET_VALUE(get_int64);
    }
    else if (type == "decimal")
    {
        GET_VALUE(get_double);
    }
    else if (type == "blob" || type == "binary")
    {
        std::vector<char> rd;
        ylib::buffer rb;
        if (obj.get_type() == sol::type::string)
        {
            rb = m_result->get_blob(obj.as<std::string>());
        }
        else if (obj.get_type() == sol::type::number)
        {
            rb = m_result->get_blob(obj.as<uint32>());
        }
        rd.resize(rb.size());
        for (size_t i = 0; i < rb.size(); i++)
            rd[i] = rb[i];
        return sol::make_object(s,rd);
    }
    return sol::make_object(s, sol::nil); 
    
}

sol::table module::mysql_result::table(sol::this_state s)
{
    sol::state_view lua(s);
    sol::table result_table = lua.create_table();
    int row_num = 1;

    while (next()) {
        sol::table row = lua.create_table();
        for (uint32_t i = 0; i < field_count(); ++i) {
            row[field_name(i+1)] = get(sol::make_object(s, i+1), s);
        }
        result_table[row_num++] = row;
    }
    return result_table;
}

void module::mysql_result::regist(sol::state* lua)
{
    lua->new_usertype<module::mysql_result>("fw_mysql_result",
        "field_name", &module::mysql_result::field_name,
        "get", &module::mysql_result::get,
        "next", &module::mysql_result::next,
        "row_count", &module::mysql_result::row_count,
        "table", &module::mysql_result::table,
        "field_count", &module::mysql_result::field_count,
        "field_type", &module::mysql_result::field_type
    );
}

module::mysql_conn::mysql_conn()
{
    m_conn = new ylib::mysql::conn();
}

module::mysql_conn::mysql_conn(ylib::mysql::conn* conn)
{
    m_conn = conn;
}

module::mysql_conn::~mysql_conn()
{
    if (m_conn != nullptr)
    {
        if (m_conn->pool() != nullptr)
            m_conn->pool()->recover(m_conn);
        else
            delete m_conn;
        m_conn = nullptr;
    }
}

int module::mysql_conn::connect(const std::string& ipaddress, const std::string& username, const std::string& password, const std::string& database, const std::string& charset, ushort port)
{
    ylib::mysql::mysql_conn_info info;
    info.ipaddress = ipaddress;
    info.username = username;
    info.password = password;
    info.charset = charset;
    info.port = port;
    info.database = database;
    return m_conn->start(info);
}

void module::mysql_conn::clear()
{
    m_conn->clear();
}

std::shared_ptr<module::mysql_prepare_statement> module::mysql_conn::setsql(const std::string& sql)
{
    return std::make_shared<module::mysql_prepare_statement>(m_conn->setsql(sql));
}

uint64 module::mysql_conn::insert_id()
{
    return m_conn->insert_id();
}

void module::mysql_conn::begin(bool autocommit)
{
    m_conn->begin(autocommit);
}

void module::mysql_conn::commit()
{
    m_conn->commit();
}

void module::mysql_conn::rollback()
{
    m_conn->rollback();
}

void module::mysql_conn::setDatabase(const std::string& name)
{
    m_conn->setDatabase(name);
}

std::string module::mysql_conn::last_error()
{
    return m_conn->last_error();
}
std::shared_ptr<module::select> module::mysql_conn::select()
{
    return std::make_shared<module::select>(m_conn, false);
}

std::shared_ptr<module::insert> module::mysql_conn::insert()
{
    return std::make_shared<module::insert>(m_conn, false);
}

std::shared_ptr<module::update> module::mysql_conn::update()
{
    return std::make_shared<module::update>(m_conn, false);
}

std::shared_ptr<module::delete_> module::mysql_conn::delete_()
{
    return std::make_shared<module::delete_>(m_conn, false);
}


void module::mysql_conn::regist(sol::state* lua)
{
    lua->new_usertype<module::mysql_conn>("fw_mysql_conn",
        "new", sol::constructors<module::mysql_conn(), module::mysql_conn(ylib::mysql::conn*)>(),
        "begin", &module::mysql_conn::begin,
        "clear", &module::mysql_conn::clear,
        "commit", &module::mysql_conn::commit, 
        "insert_id", &module::mysql_conn::insert_id,
        "rollback", &module::mysql_conn::rollback,
        "setDatabase", &module::mysql_conn::setDatabase,
        "setsql", &module::mysql_conn::setsql,
        "connect", &module::mysql_conn::connect,
        "last_error", &module::mysql_conn::last_error,
        "select", &module::mysql_conn::select,
        "update", &module::mysql_conn::update,
        "insert", &module::mysql_conn::insert,
        "delete", &module::mysql_conn::delete_
    );
} 

module::mysql_prepare_statement::mysql_prepare_statement(ylib::mysql::prepare_statement* pstt):m_pstt(pstt)
{
}

module::mysql_prepare_statement::~mysql_prepare_statement()
{
}

void module::mysql_prepare_statement::set_bigint(uint32 index, const std::string& value)
{
    m_pstt->set_bigint(index, value);
}

void module::mysql_prepare_statement::set_boolean(uint32 index, bool value)
{
    m_pstt->set_boolean(index, value);
}

void module::mysql_prepare_statement::set_datetime(uint32 index, const std::string& value)
{
    m_pstt->set_datetime(index, value);
}

void module::mysql_prepare_statement::set_dob(uint32 index, double value)
{
    m_pstt->set_double(index, value);
}

void module::mysql_prepare_statement::set_i32(uint32 index, int32 value)
{
    m_pstt->set_int32(index, value);
}

void module::mysql_prepare_statement::set_i64(uint32 index, int64 value)
{
    m_pstt->set_int64(index, value);
}

void module::mysql_prepare_statement::set_null(uint32 index)
{
    m_pstt->set_null(index);
}

void module::mysql_prepare_statement::set_str(uint32 index, const std::string_view& value)
{
    m_pstt->set_string(index, (char*)value.data(), value.size());
}
void module::mysql_prepare_statement::set_blob(uint32 index,const std::string_view& value) 
{
    m_pstt->set_blob(index,value.data(),value.length());
}
void module::mysql_prepare_statement::clear()
{
    m_pstt->clear();
}

uint64 module::mysql_prepare_statement::update()
{
    return m_pstt->update();
}

std::shared_ptr<module::mysql_result> module::mysql_prepare_statement::query()
{
    return std::make_shared<module::mysql_result>(m_pstt->query());
}

void module::mysql_prepare_statement::regist(sol::state* lua)
{
    lua->new_usertype<module::mysql_prepare_statement>("fw_mysql_prepare_statement",
        "update", &module::mysql_prepare_statement::update,
        "clear", &module::mysql_prepare_statement::clear,
        "query", &module::mysql_prepare_statement::query,
        "set_bigint", &module::mysql_prepare_statement::set_bigint,
        "set_blob", &module::mysql_prepare_statement::set_blob,
        "set_boolean", &module::mysql_prepare_statement::set_boolean,
        "set_datetime", &module::mysql_prepare_statement::set_datetime,
        "set_dob", &module::mysql_prepare_statement::set_dob,
        "set_i32", &module::mysql_prepare_statement::set_i32,
        "set_i64", &module::mysql_prepare_statement::set_i64,
        "set_str", &module::mysql_prepare_statement::set_str
    );
}
