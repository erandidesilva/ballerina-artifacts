package scenario4;

import ballerina.net.http;
import ballerina.lang.messages;


@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getJson"}
    resource getDataResource (message m) {
        message response = {};
        json payload = getAllEmployees();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonAlias"}
    resource getDataWithAliasResource (message m) {
        message response = {};
        json payload = getAllEmployeesWithSameColumnNameWithAlias();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonSameColumnName"}
    resource getJsonWithSameColumnNameResource (message m) {
        message response = {};
        json payload = getAllEmployeesWithSameColumnName();
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getJsonWithUnion"}
    resource getJsonWithUnionResource (message m) {
        message response = {};
        json payload = getAllEmployeesUnion();
        messages:setJsonPayload(response, payload);
        reply response;
    }
}