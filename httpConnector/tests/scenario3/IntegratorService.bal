package scenario2;

import ballerina.net.http;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:5301";
    string resourcePath = "/backend/call";

    @http:POST{}
    @http:GET {}
    @http:Path {value:"/call"}
    resource httpClientErrorResource (message m) {
        //BAL-117 to BAL-124
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.post(httpCheck, resourcePath, request);
        reply response;

    }

}