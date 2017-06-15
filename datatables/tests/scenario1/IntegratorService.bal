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