package scenario5;

import ballerina.net.http;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:5301";


    @http:POST {}
    @http:GET {}
    @http:Path {value:"/callPatch"}
    resource httpPatchResource (message m) {
        string resourcePath = "/abc";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.patch(httpCheck, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/callHead"}
    resource httpHeadResource (message m) {
        string resourcePath = "/abc";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.head(httpCheck, resourcePath, request);
        reply response;
    }


}
