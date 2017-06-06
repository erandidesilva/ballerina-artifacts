package scenario6;

import ballerina.lang.messages;
import ballerina.net.http;

@http:BasePath {value:"/manager"}
service Integrator {

    @http:POST {}
    @http:Path {value:"/insertData"}
    resource insertDataResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNested(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataParentSqlError"}
    resource insertDataParentSqlErrorResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNestedParentSqlError(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataFirstChildSqlError"}
    resource insertDataFirstChildSqlErrorResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNestedFirstChildSqlError(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataSecondChildSqlError"}
    resource insertDataSecondChildSqlErrorResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNestedSecondChildSqlError(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataParentForceAbort"}
    resource insertDataParentForceAbortResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNestedParentForceAbort(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataFirstChildForceAbort"}
    resource insertDataFirstChildForceAbortResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertNestedFirstChildForceAbort(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }
}