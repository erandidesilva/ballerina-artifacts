package scenario3;

import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.system;

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
    @http:Path {value:"/updatePersons"}
    resource updateResource (message m) {
        json payload;
        string responseFromUpdate;
        message response = {};
        payload = messages:getJsonPayload(m);
        responseFromUpdate = updatePersonFunction(payload);
        messages:setStringPayload(response, responseFromUpdate);
        reply response;
    }

    @http:GET {}
    @http:Path {value:"/selectPersons/{personid}"}
    resource updateResource (message m, @http:PathParam {value:"personid"}string personid) {
        system:println("inside select resource");
        json payload;
        json responseFromSelect;
        message response = {};
        responseFromSelect = viewPersonDetailsFunction(personid);
        messages:setJsonPayload(response, responseFromSelect);
        reply response;
    }
}