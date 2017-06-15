package scenario5;

import ballerina.net.http;
import ballerina.lang.messages;


@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getXml"}
    resource getDataResource (message m) {
        message response = {};
        xml payload = getAllEmployees();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlAlias"}
    resource getDataWithAliasResource (message m) {
        message response = {};
        xml payload = getAllEmployeesWithSameColumnNameWithAlias();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlSameColumnName"}
    resource getJsonWithSameColumnNameResource (message m) {
        message response = {};
        xml payload = getAllEmployeesWithSameColumnName();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlWithUnion"}
    resource getJsonWithUnionResource (message m) {
        message response = {};
        xml payload = getAllEmployeesUnion();
        messages:setXmlPayload(response, payload);
        reply response;
    }
}