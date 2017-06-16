package scenario2;

import ballerina.net.http;
import ballerina.lang.system;
import ballerina.lang.messages;

@http:BasePath {value:"/backend"}
service sampleBackEnd {

    @http:POST{}
    @http:GET {}
    @http:Path {value:"/call"}
    resource httpClientErrorResource (message m) {
        system:println(messages:getHeader(m, "Content-Type"));
        //string value = "This is a test";
        //messages:setStringPayload(m, value);
        reply m;

    }

}