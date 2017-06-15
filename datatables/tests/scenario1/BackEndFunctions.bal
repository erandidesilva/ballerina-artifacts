package scenario1;

import connectorInit;
import ballerina.data.sql;
import ballerina.lang.datatables;
import ballerina.lang.errors;
import ballerina.lang.system;

struct Employees {
    int emp_no;
    string birth_date;
    string first_name;
    string last_name;
    string gender;
    string hire_date;
}

struct Department{
    string dept_no;
    string dept_name;
}

struct EmpMissingParams{
    int emp_no;
    string birth_date;
    string first_name;
    string last_name;
    string gender;
}

struct EmployeesOrderChanged {
    string birth_date;
    string first_name;
    string last_name;
    string gender;
    string hire_date;
    int emp_no;
}

struct EmployeesTypeChanged {
    string emp_no;
    string birth_date;
    string first_name;
    string last_name;
    string gender;
    string hire_date;
}

struct EmployeeWithAlias{
    int employeeNo;
    string dateOfBirth;
    string firstName;
}

function getAllEmployees () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select * from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.birth_date);
            system:println(emp.first_name);
            system:println(emp.last_name);
            system:println(emp.gender);
            system:println(emp.hire_date);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from employees"};
        }

    }
    return i, err;
}

function getAllDepartments () (int, errors:TypeCastError){
    int i = 0;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select * from departments", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Department dep;
        dep, err = (Department)para;
        if (err == null) {
            system:println(dep.dept_no + dep.dept_name);
            system:println(".................");
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data from departments"};
        }

    }
    return i, err;
}

function getAlEmployeesMissingParamsInStruct () (int, errors:TypeCastError){
    int i = 0;
    errors:Error ex;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select * from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmpMissingParams empM;
        empM, err = (EmpMissingParams)para;
        if (err == null) {
            system:println(empM.emp_no);
            system:println(empM.birth_date);
            system:println(empM.first_name);
            system:println(empM.last_name);
            system:println(empM.gender);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data: Less parameters than fetched"};
        }

    }
    return i, err;
}

function getAlEmployeesMoreParamsInStruct () (int, errors:TypeCastError){
    int i = 0;
    errors:Error ex;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select emp_no, birth_date, first_name from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        Employees emp;
        emp, err = (Employees)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.birth_date);
            system:println(emp.first_name);
            system:println(emp.last_name);
            system:println(emp.gender);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data: More parameters are defined than fetched"};
        }

    }
    return i, err;
}

function getAlEmployeesOrderChangeInStruct () (int, errors:TypeCastError){
    int i = 0;
    errors:Error ex;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select * from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmployeesOrderChanged emp;
        emp, err = (EmployeesOrderChanged)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.birth_date);
            system:println(emp.first_name);
            system:println(emp.last_name);
            system:println(emp.gender);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data: Difference on order at cast"};
        }

    }
    return i, err;
}

function getAlEmployeesTypeChangeInStruct () (int, errors:TypeCastError){
    int i = 0;
    errors:Error ex;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select * from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmployeesTypeChanged emp;
        emp, err = (EmployeesTypeChanged)para;
        if (err == null) {
            system:println(emp.emp_no);
            system:println(emp.birth_date);
            system:println(emp.first_name);
            system:println(emp.last_name);
            system:println(emp.gender);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data: Difference of types at cast"};
        }

    }
    return i, err;
}

function getAlEmployeesWithAlias () (int, errors:TypeCastError){
    int i = 0;
    errors:Error ex;
    sql:Parameter[] parameters = [];
    datatable df;
    errors:TypeCastError err;
    sql:ClientConnector connectorInstance = connectorInit:init();
    df = sql:ClientConnector.select (connectorInstance, "select emp_no as employeeNo, birth_date as dateOfBirth, first_name as firstName from employees", parameters);
    while (datatables:hasNext(df)) {
        any para = datatables:next(df);
        EmployeeWithAlias emp;
        emp, err = (EmployeeWithAlias)para;
        system:println(emp.employeeNo);
        system:println(emp.dateOfBirth);
        system:println(emp.firstName);
        system:println(".......................................");
        if (err == null) {
            system:println(emp.employeeNo);
            system:println(emp.dateOfBirth);
            system:println(emp.firstName);
            i = i + 1;
        }
        else {
            errors:getStackTrace((errors:Error)err);
            err = {msg:"Error in retrieving data: Problem in retrieving with alias"};
        }

    }
    return i, err;
}
