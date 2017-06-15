package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.errors;

@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getEmpManagers"}
    resource getEmployeeManagersResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWhoAreManagers();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersLeftOuterJoin"}
    resource getEmployeeManagersLeftOuterJoinResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWhoAreManagersLeftOuterJoin();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersRightOuterJoin"}
    resource getEmployeeManagersRightOuterJoinResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWhoAreManagersRightOuterJoin();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersRightOuterJoinWithAny"}
    resource getEmployeeManagersRightOuterJoinWithAnyResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWhoAreManagersRightOuterJoinWithAny();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersUnion"}
    resource getEmployeeManagersUnionResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWhoAreManagersUnion();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersSameColumnName"}
    resource getEmployeeManagersSameColumnResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWithSameColumnName();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getEmpManagersWithAlias"}
    resource getEmployeeManagersSameColumnWithAliasResource (message m) {
        message response = {};
        errors:TypeCastError e;
        int noOfRows;
        noOfRows, e = getAllEmployeesWithSameColumnNameWithAlias();
        if (e == null) {
            messages:setStringPayload(response, "No of rows retrieved:" + noOfRows);
        }
        else {
            messages:setStringPayload(response, e.msg);
        }
        reply response;
    }
}
