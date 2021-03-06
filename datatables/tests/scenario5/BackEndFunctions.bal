package scenario5;

import connectorInit;
import ballerina.data.sql;
import ballerina.lang.errors;

function getAllEmployees () (xml){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    xml results;
    try {
        df = sql:ClientConnector.select (connectorInstance, "select * from employees", parameters);
        results = < xml > df;
    } catch (errors:TypeConversionError ex) {
        ex = {msg:"Converting to xml failed."};
        throw ex;
    }
    return results;
}

function getAllEmployeesWithSameColumnNameWithAlias () (xml){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    xml results;
    try {
        df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no as employeeNo, dept_manager.emp_no as deptEmployeeNo, dept_manager.dept_no, employees.first_name, employees.last_name from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
        results = < xml > df;
    } catch (errors:TypeConversionError ex) {
        ex = {msg:"Converting to xml failed with alias."};
        throw ex;
    }
    return results;
}

function getAllEmployeesWithSameColumnName () (xml){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    xml results;
    try {
        df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
        results = < xml > df;
    } catch (errors:TypeConversionError ex) {
        ex = {msg:"Converting to xml failed with same column name."};
        throw ex;
    }
    return results;
}

function getAllEmployeesUnion () (xml){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    xml results;
    try {
        df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees right outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01' union select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees left outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
        results = < xml > df;
    } catch (errors:TypeConversionError ex) {
        ex = {msg:"Converting to json failed while retrieving data from a union."};
        throw ex;
    }
    return results;
}
