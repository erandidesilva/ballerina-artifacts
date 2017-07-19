package scenario1;

import ballerina.net.http;
import ballerina.lang.system;

service <http> EchoService {

    resource echoResource (message m) {
        reply m;
    }

    resource passThroughResource(message m){
        string method = http:getMethod(m);
        string path = "customers/customerservice/customers";
        string connectionUrl = "http://localhost:5300/jaxrs_basic/services/";
        http:ClientConnector httpConnection = create http:ClientConnector(connectionUrl);
        message response = httpConnection.execute(method, path, m);
        reply response;
    }

    @http:Path {value:"/"}
    resource passThroughSecondResource(message msg){
        system:println("a");
        string method = http:getMethod(msg);
        string path = "customers/customerservice/customers";
        string connectionUrl = "http://localhost:5300/jaxrs_basic/services/";
        http:ClientConnector httpConnection = create http:ClientConnector(connectionUrl);
        message response = httpConnection.execute(method, path, msg);
        reply response;
    }

    @http:POST {}
    @http:GET {}
    @http:PUT {}
    @http:DELETE {}
    @http:POST {}
    @http:Path {value:"/"}
    resource passThroughThirdResource(message msg){
        system:println("b");
        string method = http:getMethod(msg);
        string path = "customers/customerservice/customers";
        string connectionUrl = "http://localhost:5300/jaxrs_basic/services/";
        http:ClientConnector httpConnection = create http:ClientConnector(connectionUrl);
        message response = httpConnection.execute(method, path, msg);
        reply response;
    }

}