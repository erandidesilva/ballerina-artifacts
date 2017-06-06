package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.system;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://www.mocky.io/v2/593578e61000003f183eeaec";
    string resourcePath = "";

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