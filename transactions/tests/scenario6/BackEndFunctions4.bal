package scenario6;

import scenario4;
import ballerina.lang.jsons;
import ballerina.lang.errors;
import ballerina.lang.system;
import ballerina.data.sql;
import ballerina.lang.strings;

function insertNestedSecondChildSqlError(json payload)(string responsePayload){
    sql:ClientConnector oracleConnectionInstance = scenario4:initOracle();
    sql:ClientConnector mssqlConnectionInstance = scenario4:initMssql();

    try{
        transaction {
            system:println("inside parent transaction");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Parent Persons:" + strings:valueOf(length_1));
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
                sql:Parameter[] paramsPerson = [paraID, paraLastName, paraFirstName, paraAge];
                system:println("6");
                sql:ClientConnector.update(oracleConnectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", paramsPerson);
                system:println("7");
                i = i+1;
            }
            transaction {
                system:println("inside child transaction1");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Child 1 Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(oracleConnectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child 1 aborted");
                errors:Error err = { msg : "Failure in child transaction1" };
                throw err;
            }
            transaction {
                system:println("Inside child 2 transaction");
                int x=0;
                int length_3 = jsons:getInt(payload,"$.Values.persons.length()");
                system:println("Child 2 Persons:" + strings:valueOf(length_3));
                while(x<length_3){
                    system:println("x1");
                    sql:Parameter paraID = {sqlType:"integer", value:(int)payload.Values.persons[x].id, direction:0};
                    system:println("x2");
                    sql:Parameter paraLastName = {sqlType:"varchar", value:(string)payload.Values.persons[x].lastname, direction:0};
                    system:println("x3");
                    sql:Parameter paraFirstName = {sqlType:"varchar", value:(string)payload.Values.persons[x].firstname, direction:0};
                    system:println("x4");
                    sql:Parameter[] paramsPerson = [paraID, paraLastName, paraFirstName];
                    system:println("x5");
                    sql:ClientConnector.update(mssqlConnectionInstance, "Insert into personsinlanka(id,firstname,lastname) values (?,?,?)", paramsPerson);
                    system:println("x6");
                    x = x+1;
                }

            }aborted{
                system:println("Inside child 2 aborted");
                errors:Error err = { msg : "Failure in child transaction2" };
                throw err;
            }

        }aborted {
            system:println("inside parent aborted");
            responsePayload = "Data Insertion Failed";
        }
        responsePayload = "Data Insertion Successful";
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    return;
}