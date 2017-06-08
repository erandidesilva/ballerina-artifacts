package scenario4;

import ballerina.net.http;
import ballerina.lang.messages;


@http:BasePath {value:"/test"}
service EchoService {

    @http:Path {value:"/foo/{bar}"}
    resource echoMinusResource (message m, @http:PathParam {value:"bar"} string bar) {
        message response = {};
        string payload = "This is a test 1 ..............." + bar;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:Path {value:"/foo/{bar}/{poo}"}
    resource echoZeroResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo) {
        message response = {};
        string payload = "This is a test 2 ..............." + bar +":"+ poo;
        messages:setStringPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/foo/{bar}+{poo}"}
    resource echoOneResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo) {
        message response = {};
        string payload = "This is a test 3 ..............." + bar +":"+ poo;
        messages:setStringPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/foo/{bar}-{poo}"}
    resource echoTwoResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo) {
        message response = {};
        string payload = "This is a test 4 ..............." + bar +":"+ poo;
        messages:setStringPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/foo/{bar}.{poo}"}
    resource echoThreeResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo) {
        message response = {};
        string payload = "This is a test 5 ..............." + bar +":"+ poo;
        messages:setStringPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/foo/{bar}.{poo}/{tee}"}
    resource echoFourResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo,  @http:PathParam {value:"tee"} string tee, @http:QueryParam {value:"orderid"}string orderid) {
        message response = {};
        string payload = "This is a test 6..............." + bar +":"+ poo + ":" + tee + ":" + orderid;
        messages:setStringPayload(response, payload);
        reply response;
    }

    @http:Path {value:"/foo/{bar}.{poo}/{tee}/*"}
    resource echoFiveResource (message m, @http:PathParam {value:"bar"} string bar, @http:PathParam {value:"poo"} string poo,  @http:PathParam {value:"tee"} string tee, @http:QueryParam {value:"orderid"}string orderid) {
        message response = {};
        string payload = "This is a test 7..............." + bar +":"+ poo + ":" + tee + ":" + orderid;
        messages:setStringPayload(response, payload);
        reply response;
    }
}