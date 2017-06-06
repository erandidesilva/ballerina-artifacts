package scenario4;

import ballerina.lang.jsons;
import ballerina.lang.errors;
import ballerina.lang.system;
import ballerina.data.sql;
import ballerina.lang.strings;


function insertPersonFunction(json payload)(string responsePayload){
    sql:ClientConnector oracleConnectionInstance = initOracle();
    sql:ClientConnector mssqlConnectionInstance = initMssql();

    try{
        transaction {
            system:println("inside transaction: oracle");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                sql:Parameter paraID = {sqlType:"integer", value:(int)payload.Values.persons[i].id, direction:0};
                system:println("2");
                sql:Parameter paraLastName = {sqlType:"varchar", value:(string)payload.Values.persons[i].lastname, direction:0};
                system:println("3");
                sql:Parameter paraFirstName = {sqlType:"varchar", value:(string)payload.Values.persons[i].firstname, direction:0};
                system:println("4");
                sql:Parameter paraAge = {sqlType:"varchar", value:(int)payload.Values.persons[i].age, direction:0};
                system:println("5");
                sql:Parameter[] params = [paraID, paraLastName, paraFirstName, paraAge];
                system:println("6");
                sql:ClientConnector.update(oracleConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", params);
                system:println("7");
                sql:ClientConnector.update(mssqlConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", params);
                system:println("8");
                i = i+1;
            }

        }aborted {
            system:println("inside aborted");
            responsePayload = "Data Insertion Failed";
        }
        responsePayload = "Data Insertion Successful";
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    return;
}

function insertPersonSqlErrorFunction(json payload)(string responsePayload){
    sql:ClientConnector oracleConnectionInstance = initOracle();
    sql:ClientConnector mssqlConnectionInstance = initMssql();

    try{
        transaction {
            system:println("inside transaction: oracle");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                sql:Parameter paraID = {sqlType:"integer", value:(int)payload.Values.persons[i].id, direction:0};
                system:println("2");
                sql:Parameter paraLastName = {sqlType:"varchar", value:(string)payload.Values.persons[i].lastname, direction:0};
                system:println("3");
                sql:Parameter paraFirstName = {sqlType:"varchar", value:(string)payload.Values.persons[i].firstname, direction:0};
                system:println("4");
                sql:Parameter paraAge = {sqlType:"varchar", value:(int)payload.Values.persons[i].age, direction:0};
                system:println("5");
                sql:Parameter[] params = [paraID, paraLastName, paraFirstName, paraAge];
                system:println("6");
                sql:ClientConnector.update(oracleConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", params);
                system:println("7");
                sql:ClientConnector.update(mssqlConnectionInstance, "insert into persons (personid, lastname, firstname, age) values (?, ?, ?, ?)", params);
                system:println("8");
                i = i+1;
            }

        }aborted {
            system:println("inside aborted");
            responsePayload = "Data Insertion Failed";
        }
        responsePayload = "Data Insertion Successful";
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    return;
}

function insertPersonForceAbortFunction(json payload)(string responsePayload){
    sql:ClientConnector oracleConnectionInstance = initOracle();
    sql:ClientConnector mssqlConnectionInstance = initMssql();

    try{
        transaction {
            system:println("inside transaction: oracle");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                sql:Parameter paraID = {sqlType:"integer", value:(int)payload.Values.persons[i].id, direction:0};
                system:println("2");
                sql:Parameter paraLastName = {sqlType:"varchar", value:(string)payload.Values.persons[i].lastname, direction:0};
                system:println("3");
                sql:Parameter paraFirstName = {sqlType:"varchar", value:(string)payload.Values.persons[i].firstname, direction:0};
                system:println("4");
                sql:Parameter paraAge = {sqlType:"varchar", value:(int)payload.Values.persons[i].age, direction:0};
                system:println("5");
                sql:Parameter[] params = [paraID, paraLastName, paraFirstName, paraAge];
                system:println("6");
                sql:ClientConnector.update(oracleConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", params);
                system:println("7");
                if((int)payload.Values.persons[i].age > 20){
                    sql:ClientConnector.update(mssqlConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", params);
                 }
                else{
                    abort;
                }

                system:println("8");
                i = i+1;
            }
         responsePayload = "Data Insertion Successful";
        }aborted {
            system:println("inside aborted");
            responsePayload = "Data Insertion Failed";
        }
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    return;
}