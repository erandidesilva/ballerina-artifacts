package scenario3;

import ballerina.net.http;
import ballerina.lang.messages;


@http:config {
    basePath:"/test"
}
service <http> EchoService {

    @http:Path {value:"/call"}
    resource echoResource (message m) {
        message response = {};
        string payload = "This is a test 1 ...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

    @http:Path {value:"/foo"}
     resource echoFooResource (message m) {
        message response = {};
        string payload = "This is a test 3...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/boo"}
     resource echoBooResource (message m) {
        message response = {};
        string payload = "This is a test 4...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/foo/bar"}
     resource echoFooBarResource (message m) {
        message response = {};
        string payload = "This is a test 6...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/boo/bar"}
     resource echoBooBarResource (message m) {
        message response = {};
        string payload = "This is a test 7...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/boo/*"}
     resource echoBooStarResource (message m) {
        message response = {};
        string payload = "This is a test 9...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

    @http:Path {value:"/foo/bar/poo"}
     resource echoFooBarPooResource (message m) {
        message response = {};
        string payload = "This is a test 11...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/foo/bar/poo/tee"}
     resource echoFooBarPooTeeResource (message m) {
        message response = {};
        string payload = "This is a test 12...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/foo/bar/*"}
     resource echoFooBarStarResource (message m) {
        message response = {};
        string payload = "This is a test 13...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

     @http:Path {value:"/foo/bar/poo/*"}
     resource echoFooBarPooStarResource (message m) {
        message response = {};
        string payload = "This is a test 14...............";
        messages:setStringPayload(response,payload);
        reply response;
    }

}