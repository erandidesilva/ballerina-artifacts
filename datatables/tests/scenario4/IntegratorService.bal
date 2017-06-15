package scenario4;

import ballerina.net.http;
import ballerina.lang.messages;


@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getJson"}
    resource getDataResource (message m) {
        //BAL-224:Verfiy mapping the result set to a json array
        //BAL-225:Verfiy mapping the large result set to a json array
        message response = {};
        json payload = getAllEmployees();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonAlias"}
    resource getDataWithAliasResource (message m) {
        //BAL-241:Verify the functionalty of mapping records to json when column aliases are used
        message response = {};
        json payload = getAllEmployeesWithSameColumnNameWithAlias();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonSameColumnName"}
    resource getJsonWithSameColumnNameResource (message m) {
        //BAL-235:Verifies the functionality of json mapping records through JOIN when same column name exist
        message response = {};
        json payload = getAllEmployeesWithSameColumnName();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonWithUnion"}
    resource getJsonWithUnionResource (message m) {
        //BAL-232:Verfiy mapping the result set to a json array when an OUTER JOIN is used
        message response = {};
        json payload = getAllEmployeesUnion();
        messages:setJsonPayload(response, payload);
        reply response;
    }
}