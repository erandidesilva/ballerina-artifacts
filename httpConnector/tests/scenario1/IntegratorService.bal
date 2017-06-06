package scenario1;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.strings;
import ballerina.lang.system;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://www.mocky.io/v2/593554c6100000a3123eea55";
    string resourcePath = "";

    @http:POST{}
    @http:Path {value:"/call/{header}"}
    resource httpResource (message m, @http:PathParam {value:"header"}string headerKey) {
        string headerValue;
        system:println("Header Key" + headerKey);
        message response;
        message request = m;
        system:println("1");
        headerValue = messages:getStringPayload(request);
        json j = {value:"myValue"};
        system:println("2");
        messages:setJsonPayload(request, j);
        system:println("3");
        if(!strings:equalsIgnoreCase(headerKey, "noValue") && !strings:equalsIgnoreCase(headerValue, "")){
            system:println("Header Value" + headerValue);
            messages:setHeader(request, headerKey, headerValue);
            system:println("4");
        }
        system:println("5");
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        system:println("6");
        response = http:ClientConnector.post(httpCheck, resourcePath, request);
        system:println("7");
        reply response;

    }

    @http:POST{}
    @http:GET {}
    @http:Path {value:"/call"}
    resource httpClientErrorResource (message m) {
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.post(httpCheck, resourcePath, request);
        system:println(messages:getHeader(response, "Connection"));
        reply response;

    }
}