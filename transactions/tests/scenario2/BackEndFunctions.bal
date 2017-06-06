package scenario2;

import scenario1;
import ballerina.lang.jsons;
import ballerina.lang.errors;
import ballerina.lang.system;
import ballerina.data.sql;
import ballerina.lang.strings;

function integrityCheckFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
            system:println("inside transaction");
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
            int j=0;
            int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
            system:println("Orders:" + strings:valueOf(length_2));
            while(j<length_2){
                system:println("inside order while loop");
                sql:Parameter paraOrderId = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                system:println("8");
                sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                system:println("9");
                sql:Parameter paraPersonId = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                system:println("10");
                sql:Parameter[] paramsOrders = [paraOrderId, paraOrderNumber, paraPersonId];
                system:println("11");
                sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrders);
                system:println("12");
                j = j+1;
            }
        }aborted {
            system:println("inside aborted");
            responsePayload = "Data Insertion Failed";
        }
        responsePayload = "Data Insertion Successful";
    }catch(errors:Error ex){
        system:println("Database insert error due to integrity violation.");
        system:println(ex.msg);
    }
    scenario1:close(connectionInstance);
    return;
}