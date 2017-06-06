package scenario4;

import ballerina.lang.messages;
import ballerina.net.http;

@http:BasePath {value:"/persons"}
service Integrator {

    @http:POST {}
    @http:Path {value:"/addPersons"}
    resource addResource (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertPersonFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/addPersonsSqlError"}
    resource addResourceForceAbort (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertPersonSqlErrorFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

    @http:POST {}
    @http:Path {value:"/addPersonsForceAbort"}
    resource addResourceSqlError (message m) {
        json payload;
        string responseFromInsert;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromInsert = insertPersonForceAbortFunction(payload);
        messages:setStringPayload(response, responseFromInsert);
        reply response;
    }

}