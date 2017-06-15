package scenario2;

import connectorInit;
import ballerina.data.sql;
import ballerina.lang.datatables;
import ballerina.lang.errors;
import ballerina.lang.system;

struct Department{
    string dept_no;
}

struct Employees {
    int emp_no;
    string dept_no;
    string first_name;
    string last_name;
}

struct EmployeesWithAny {
    any emp_no;
    string dept_no;
    string first_name;
    string last_name;
}

struct EmployeesWithAlias {
    int employeeNo;
    int deptEmployeeNo;
    string dept_no;
    string first_name;
    string last_name;
}

function getAllEmployeesWhoAreManagers () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWhoAreManagersLeftOuterJoin () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees left outer join dept_manager on employees.emp_no = dept_manager.emp_no", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWhoAreManagersRightOuterJoin () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees right outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        system:println(emp.emp_no);
        system:println(emp.dept_no);
        system:println(emp.first_name);
        system:println(emp.last_name);
        system:println("...................");
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWhoAreManagersRightOuterJoinWithAny () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees right outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmployeesWithAny emp;
        emp, err = (EmployeesWithAny)para;
        system:println((int)emp.emp_no);
        system:println(emp.dept_no);
        system:println(emp.first_name);
        system:println(emp.last_name);
        system:println("...................");
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWhoAreManagersUnion () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees right outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01' union select employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees left outer join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        system:println(emp.emp_no);
        system:println(emp.dept_no);
        system:println(emp.first_name);
        system:println(emp.last_name);
        system:println("...................");
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWithSameColumnName () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no, dept_manager.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        system:println(emp.emp_no);
        system:println(emp.dept_no);
        system:println(emp.first_name);
        system:println(emp.last_name);
        system:println("...................");
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllEmployeesWithSameColumnNameWithAlias () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select employees.emp_no as employeeNo, dept_manager.emp_no as deptEmployeeNo, dept_manager.dept_no, employees.first_name, employees.last_name from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no and dept_manager.from_date > '1990-01-01'", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmployeesWithAlias emp;
        emp, err = (EmployeesWithAlias)para;
        system:println(emp.employeeNo);
        system:println(emp.deptEmployeeNo);
        system:println(emp.dept_no);
        system:println(emp.first_name);
        system:println(emp.last_name);
        system:println("...................");
        if (err == null) {
            system:println(emp.employeeNo);
            system:println(emp.deptEmployeeNo);
            system:println(emp.dept_no);
            system:println(emp.first_name);
            system:println(emp.last_name);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees with alias"};
        }

    }
    return i, err;
}