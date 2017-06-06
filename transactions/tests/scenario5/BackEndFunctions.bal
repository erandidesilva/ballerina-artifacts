package scenario5;

import scenario1;
import ballerina.lang.jsons;
import ballerina.lang.errors;
import ballerina.lang.system;
import ballerina.data.sql;
import ballerina.lang.strings;

function insertFunction(json payload)(string responsePayload){
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
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");

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
    scenario1:close(connectionInstance);
    return;
}

function insertSqlErrorChildFunction(json payload)(string responsePayload){
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
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (id, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
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
    scenario1:close(connectionInstance);
    return;
}

function insertSqlErrorParentFunction(json payload)(string responsePayload){
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
                sql:ClientConnector.update(connectionInstance, "insert into persons (personid, lastname, firstname, age) values (?, ?, ?, ?)", paramsPerson);
                system:println("7");
                i = i+1;
            }
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
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
    scenario1:close(connectionInstance);
    return;
}

function insertIntegrityFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
             system:println("inside parent transaction");
             int j=0;
             int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
             system:println("Orders:" + strings:valueOf(length_2));
             while(j<length_2){
                 sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                 sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                 sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                 sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                 sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                 j = j+1;
             }

            transaction {
               system:println("inside child transaction ");
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
            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
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
    scenario1:close(connectionInstance);
    return;
}

function insertForceAbortChildFunction(json payload)(string responsePayload){
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
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    if((int)payload.Values.orders[j].orderid < 0){
                        abort;
                    }
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
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
    scenario1:close(connectionInstance);
    return;
}

function insertForceAbortParentFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
            system:println("inside transaction 1");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                if((int)payload.Values.persons[i].age < 20){
                        abort;
                 }
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
            responsePayload = "Data Insertion Successful";
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    if((int)payload.Values.orders[j].orderid < 0){
                        abort;
                    }
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
                throw err;
            }
         }aborted {
            system:println("inside parent aborted");
            responsePayload = "Data Insertion Failed";
        }
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    scenario1:close(connectionInstance);
    return;
}

function insertForceAbortChildThrowFunction(json payload)(string responsePayload){
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
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    if((int)payload.Values.orders[j].orderid < 0){
                        errors:Error err = { msg : "Failure in child transaction, due to condition failure" };
                        throw err;
                    }
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");

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
    scenario1:close(connectionInstance);
    return;
}

function insertForceAbortParentThrowFunction(json payload)(string responsePayload){
    sql:ClientConnector connectionInstance = scenario1:init();
    try{
        transaction {
            system:println("inside transaction 1");
            int i=0;
            int length_1 = jsons:getInt(payload,"$.Values.persons.length()");
            system:println("Persons:" + strings:valueOf(length_1));
            while(i<length_1){
                system:println("1");
                if((int)payload.Values.persons[i].age < 20){
                        errors:Error err = { msg : "Failure in parent transaction, due to condition failure" };
                        throw err;
                 }
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
            responsePayload = "Data Insertion Successful";
            transaction {
                system:println("inside child transaction");
                int j=0;
                int length_2 = jsons:getInt(payload,"$.Values.orders.length()");
                system:println("Orders:" + strings:valueOf(length_2));
                while(j<length_2){
                    if((int)payload.Values.orders[j].orderid < 0){
                        abort;
                    }
                    sql:Parameter paraOrderID = {sqlType:"integer", value:(int)payload.Values.orders[j].orderid, direction:0};
                    sql:Parameter paraOrderNumber = {sqlType:"integer", value:(int)payload.Values.orders[j].ordernumber, direction:0};
                    sql:Parameter paraPersonID = {sqlType:"integer", value:(int)payload.Values.orders[j].personid, direction:0};
                    sql:Parameter[] paramsOrder = [paraOrderID, paraOrderNumber, paraPersonID];
                    sql:ClientConnector.update(connectionInstance, "insert into orders (orderid, ordernumber, personid) values (?, ?, ?)", paramsOrder);
                    j = j+1;
                }

            }aborted{
                system:println("Inside child aborted");
                errors:Error err = { msg : "Failure in child transaction" };
                throw err;
            }
         }aborted {
            system:println("inside parent aborted");
            responsePayload = "Data Insertion Failed";
        }
    }catch(errors:Error ex){
        system:println("Database insert error due to database error.");
        system:println(ex.msg);
    }
    scenario1:close(connectionInstance);
    return;
}