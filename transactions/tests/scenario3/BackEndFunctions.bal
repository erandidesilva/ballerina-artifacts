package scenario3;

import scenario1;
import ballerina.lang.datatables;
import ballerina.lang.jsons;
import ballerina.lang.errors;
import ballerina.lang.system;
import ballerina.data.sql;
import ballerina.lang.strings;

function insertPersonFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
            system:println("inside transaction 1");
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
                sql:Parameter[] paramsPerson = [paraID, paraLastName, paraFirstName, paraAge];
                system:println("6");
                sql:ClientConnector.update(connectionInstance, "insert into persons (id, lastname, firstname, age) values (?, ?, ?, ?)", paramsPerson);
                system:println("7");
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
    scenario1:close(connectionInstance);
    return;
}

function updatePersonFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
            system:println("inside transaction 2");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                sql:Parameter paraID = {sqlType:"integer", value:(int)payload.Values.persons[i].id, direction:0};
                system:println("2");
                sql:Parameter paraFirstName = {sqlType:"varchar", value:(string)payload.Values.persons[i].firstname, direction:0};
                system:println("3");
                sql:Parameter[] paramsPerson = [paraFirstName, paraID];
                system:println("4");
                sql:ClientConnector.update(connectionInstance, "update persons set firstname=? where id=?", paramsPerson);
                system:println("5");
                i = i+1;
            }
         }aborted {
            system:println("inside aborted");
            responsePayload = "Data Update Failed";
        }
        responsePayload = "Data Update Successful";
    }catch(errors:Error ex){
        system:println("Database update error due to database error.");
        system:println(ex.msg);
    }
    scenario1:close(connectionInstance);
    return;
}

function viewPersonDetailsFunction(string personId)(json payload){
    system:println("insdie view");
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction{
            system:println("inside transaction 3");
            sql:Parameter para = {sqlType:"integer", value:personId, direction:0};
            sql:Parameter[] params = [para];
            system:println("above select");
            datatable dt = sql:ClientConnector.select (connectionInstance, "Select * from persons where id = ?", params);
            system:println("near select");
            payload = datatables:toJson(dt);
        }aborted{
            payload = {"error":"read from database failed"};
        }

    }catch(errors:Error ex){
        system:println("Could not read from database");
        system:println(ex.msg);
    }
    //scenario1:close(connectionInstance);
    return;
}