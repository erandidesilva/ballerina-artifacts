package scenario6;

import ballerina.net.http;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://localhost:5301";
    string httpMethod;

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeOptions"}
    resource httpOptionsResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "options";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeTrace"}
    resource httpTraceResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "TRACE";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeHead"}
    resource httpHeadResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "head";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executePatch"}
    resource httpPatchResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "patch";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeDelete"}
    resource httpDeleteResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "delete";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executePut"}
    resource httpPutResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "put";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executePost"}
    resource httpPostResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "post";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeGet"}
    resource httpGetResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "get";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeEmpty"}
    resource httpEmptyResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeNull"}
    resource httpNullResource (message m) {
        string resourcePath = "/abc";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:Path {value:"/executeWrong"}
    resource httpWrongResource (message m) {
        string resourcePath = "/abc";
        httpMethod = "erandi";
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.execute(httpCheck, httpMethod, resourcePath, request);
        reply response;
    }


}