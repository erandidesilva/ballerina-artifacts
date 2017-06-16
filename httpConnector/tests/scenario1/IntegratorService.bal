package scenario1;

import ballerina.net.http;


@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:9793/BalRestService/rest/restService";


    @http:GET {}
    @http:Path {value:"/call/{code}"}
    resource statusCodeResource (message m, @http:PathParam {value:"code"} string codeValue) {
        //BAL-115:Verfies the functionality of recieving various status codes
        // BAL-302:Verfies the functionality of sending special headers through ballerina
        string resourcePath = "/codes/";
        resourcePath = resourcePath + codeValue;
        message request = {};
        message response = {};
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.get (httpCheck, resourcePath, request);
        reply response;

    }

    @http:GET {}
    @http:Path {value:"/call"}
    resource contentTypeResource (message m) {
        //BAL-116:Verfies the functionality of recieving various content types
        string resourcePath = "/contentType";
        message response = {};
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.get (httpCheck, resourcePath, m);
        reply response;

    }

}