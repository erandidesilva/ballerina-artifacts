package scenario5;

import ballerina.net.http;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:5301";


    @http:POST {}
    @http:GET {}
    @http:Path {value:"/callPatch"}
    resource httpPatchResource (message m) {
        // BAL-131:Verifies the functionality of using PATCH of http client connector
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
        //BAL-130:Verifies the functionality of using HEAD of http client connector
        string resourcePath = "/abc";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.head(httpCheck, resourcePath, request);
        reply response;
    }


}
