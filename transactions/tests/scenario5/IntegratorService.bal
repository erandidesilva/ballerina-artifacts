package scenario5;

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
        responseFromInsert = insertFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataIntegrityCheck"}
    resource insertDataIntegrityCheckResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertIntegrityFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataSqlErrorChild"}
    resource insertDataSqlErrorResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertSqlErrorChildFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataSqlErrorParent"}
    resource insertDataSqlErrorParentResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertSqlErrorParentFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataForceAbortChild"}
    resource insertDataForceAbortChildResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertForceAbortChildFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataForceAbortParent"}
    resource insertDataForceAbortParentResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertForceAbortParentFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/insertDataForceAbortChildThrow"}
    resource insertDataForceAbortChildThrowResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertForceAbortChildThrowFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }


    @http:POST {}
    @http:Path {value:"/insertDataForceAbortParentThrow"}
    resource insertDataForceAbortParentThrowResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertForceAbortParentThrowFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

}