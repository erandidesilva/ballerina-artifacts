package connectorInit;
import ballerina.data.sql;
import ballerina.lang.system;

function init () (sql:ClientConnector connection) {
    string jdbcUrl = system:getEnv("JDBC_URL");
    string jdbcUsername = system:getEnv("JDBC_USERNAME");
    string jdbcPassword = system:getEnv("JDBC_PASSWORD");
    map dbProperties1 = {"jdbcUrl":jdbcUrl,"username":jdbcUsername,"password":jdbcPassword};
    connection = create sql:ClientConnector (dbProperties1);
    return;
    
}
