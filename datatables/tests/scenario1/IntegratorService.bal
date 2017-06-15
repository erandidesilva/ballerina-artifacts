package scenario1;

import ballerina.net.http;
import ballerina.lang.strings;
import ballerina.lang.messages;
import ballerina.lang.errors;
import ballerina.lang.system;

@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/call/{key}"}
    resource getDataResource (message m, @http:PathParam {value:"key"} string pathValue) {
        //BAL-209:Verifies the functionality of fetching all records from database. key: employees/departments
        //BAL-213:Verifies the functionality of fetching all records from database for a large dataset
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        if (strings:equalsIgnoreCase(pathValue, "employees")) {
            noOfRows, e = getAllEmployees();
        }
        else if (strings:equalsIgnoreCase(pathValue, "departments")) {
            noOfRows, e = getAllDepartments();
        }
        else {

        }
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/missingParam"}
    resource missingParamDataResource (message m) {
        //BAL-210:[N]Verifies the functionality of fetching all records when struct is missing parameters
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAlEmployeesMissingParamsInStruct();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        system:println(noOfRows);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/moreParams"}
    resource moreParamDataResource (message m) {
        //BAL-211:[N]Verifies the functionality of fetching all records when struct is having more parameters
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAlEmployeesMoreParamsInStruct();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        system:println(noOfRows);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/orderChangeParams"}
    resource orderChangeParamDataResource (message m) {
        //BAL-256:[N]Verifies the functionality of fetching all records when struct is having wrong order in parameters
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAlEmployeesOrderChangeInStruct();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        system:println(noOfRows);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/typeChangeParams"}
    resource typeChangeParamDataResource (message m) {
       //BAL-212:[N]Verifies the functionality of fetching all records when struct is having mismatching parameters
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAlEmployeesTypeChangeInStruct();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        system:println(noOfRows);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/withAlias"}
    resource columnNameAliasResource (message m) {
        //BAL-237:Verify the functionalty of fetching records when column aliases are used
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAlEmployeesWithAlias();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        system:println(noOfRows);
        reply response;
    }
}