package scenario4;

import ballerina.data.sql;
import ballerina.lang.system;


function initOracle () (sql:ClientConnector connection){
    string jdbcUrl = system:getEnv("ORACLE_URL");
    string jdbcUsername = system:getEnv("ORACLE_USERNAME");
    string jdbcPassword = system:getEnv("ORACLE_PASSWORD");

    map dbProperties1 = {"jdbcUrl":jdbcUrl, "username":jdbcUsername, "password":jdbcPassword};
    connection = create sql:ClientConnector (dbProperties1);
    return;
}

function initMssql () (sql:ClientConnector connection){
    string jdbcUrl = system:getEnv("MSSQL_URL");
    string jdbcUsername = system:getEnv("MSSQL_USERNAME");
    string jdbcPassword = system:getEnv("MSSQL_PASSWORD");

    map dbProperties1 = {"jdbcUrl":jdbcUrl, "username":jdbcUsername, "password":jdbcPassword};
    connection = create sql:ClientConnector (dbProperties1);
    return;
}

function close(sql:ClientConnector connection){
    sql:ClientConnector.close(connection);
}