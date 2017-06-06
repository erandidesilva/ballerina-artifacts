package scenario2;

import ballerina.lang.messages;
import ballerina.net.http;

@http:BasePath {value:"/orderplace"}
service Integrator {

    @http:POST {}
    @http:Path {value:"/insert"}
    resource integrityResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = integrityCheckFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }
}