package scenario3;

import ballerina.net.http;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:5301";
    string resourcePath = "/backend/call";

    @http:POST{}
    @http:GET {}
    @http:Path {value:"/call"}
    resource httpClientErrorResource (message m) {
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.post(httpCheck, resourcePath, request);
        reply response;

    }

}