package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.errors;

@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getEmpManagers"}
    resource getEmployeeManagersResource (message m) {
        // BAL-215:Verifies the functionality of fetching matching records on INNER JOIN from database
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
        // BAL-218:Verifies the functionality of fetching matching records on LEFT OUTER JOIN from database
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
        //BAL-219:Verifies the functionality of fetching matching records on RIGHT OUTER JOIN from database
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
        //BAL-257:Verify the functionalty of fetching records when type any is used within struct
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
        //BAL-220:Verifies the functionality of fetching matching records on FULL OUTER JOIN or UNION from database
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
        //BAL-234:Verifies the functionality of fetching record through JOIN when same column name exist
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
        //BAL-258:Verifies the functionality of fetching record through JOIN same column name, different alias
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
