package scenario5;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.system;


@http:BasePath {value:"/test"}
service EchoService {

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/customers/{orderid}/orders"}
    resource echoMinusResource (message m, @http:PathParam {value:"orderid"} string orderid) {
        message response = {};
        string payload = "This is a test 1 ..............." + orderid;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/customers/{orderid}/orders/{suborder}/lineitem/1"}
    resource echoZeroResource (message m, @http:PathParam {value:"orderid"} string orderid, @http:PathParam {value:"suborder"} string subOrder, @http:QueryParam {value:"name"} string name, @http:QueryParam {value:"age"} string age) {
        message response = {};
        string payload = "This is a test 2 ..............." + orderid + ":" + subOrder + ":" + name + ":" + age;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/api/v1/magazines.json"}
    resource echoTwoResource (message m, @http:QueryParam {value:"name"} string name, @http:QueryParam {value:"age"} string age) {
        message response = {};
        system:println("Printing age:" + age);
        string payload = "This is a test 4 ..............." + name + ":" + age;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/api/v1/magazines/{magname}.json"}
    resource echoThreeResource (message m, @http:PathParam {value:"magname"} string magname) {
        message response = {};
        string payload = "This is a test 5 ..............." + magname;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:GET {}
    @http:POST {}
    @http:Path {value:"/api/v1/magazines/{magname}/articles.json"}
    resource echoFourResource (message m, @http:PathParam {value:"magname"} string magname) {
        message response = {};
        string payload = "This is a test 6 ..............." + magname;
        messages:setStringPayload(response, payload);
        reply response;
    }
}