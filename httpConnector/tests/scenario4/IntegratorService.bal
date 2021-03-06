package scenario4;

import ballerina.net.http;
import ballerina.lang.system;

@http:BasePath {value:"/http"}
service contentBasedRouting {
    string connection = "http://10.100.5.63:5301/jaxrs_starbucks_service/services/Starbucks_Outlet_Service";


    @http:POST{}
    @http:GET {}
    @http:Path {value:"/callPost"}
    resource httpPostResource (message m) {
        // BAL-127:Verifies the functionality of using POST of http client connector
        string resourcePath = "/orders";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.post(httpCheck, resourcePath, request);
        reply response;

    }


    @http:GET {}
    @http:Path {value:"/callGet"}
    resource httpGetResource (message m) {
        //BAL-126:Verifies the functionality of using GET of http client connector
        string resourcePath = "/orders/123";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.get(httpCheck, resourcePath, request);
        reply response;

    }

    @http:POST{}
    @http:Path {value:"/callPut"}
    resource httpPutResource (message m) {
        //BAL-128:Verifies the functionality of using PUT of http client connector
        string resourcePath = "/orders";
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.put(httpCheck, resourcePath, request);
        reply response;

    }

    @http:GET {}
    @http:Path {value:"/callDelete"}
    resource httpDeleteResource (message m, @http:QueryParam {value:"orderid"}string orderid) {
        //BAL-129:Verifies the functionality of using DELETE of http client connector
        system:println(orderid);
        string resourcePath = "/orders/" + orderid;
        system:println(resourcePath);
        string headerValue;
        message response;
        message request = m;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = http:ClientConnector.delete(httpCheck, resourcePath, request);
        reply response;

    }





}