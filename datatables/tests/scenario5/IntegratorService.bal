package scenario5;

import ballerina.net.http;
import ballerina.lang.messages;


@http:BasePath {value:"/sqltest"}
service routingService {

    @http:GET {}
    @http:Path {value:"/getXml"}
    resource getDataResource (message m) {
        //BAL-228:Verify mapping the result set to a xml
        //BAL-229:Verify mapping the large result set to a xml
        message response = {};
        xml payload = getAllEmployees();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlAlias"}
    resource getDataWithAliasResource (message m) {
        //BAL-242:Verify the functionality of mapping records to xml when column aliases are used
        message response = {};
        xml payload = getAllEmployeesWithSameColumnNameWithAlias();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlSameColumnName"}
    resource getJsonWithSameColumnNameResource (message m) {
        //BAL-236:Verifies the functionality of xml mapping records through JOIN when same column name exist
        message response = {};
        xml payload = getAllEmployeesWithSameColumnName();
        messages:setXmlPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/getXmlWithUnion"}
    resource getJsonWithUnionResource (message m) {
        //BAL-233:Verify mapping the result set to a xml when an OUTER JOIN is used
        message response = {};
        xml payload = getAllEmployeesUnion();
        messages:setXmlPayload(response, payload);
        reply response;
    }
}