package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;

@http:BasePath {value:"/"}
service EchoService {

    resource echoResource (message m) {
        json payload = {"name":"ballerina", "age":"1"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

    resource echoSecondResource (message m, @http:QueryParam {value:"orderid"}string orderid, @http:QueryParam {value:"age"}string age) {
        json payload = {"name":"ballerinaSecond", "age":age, "orderid":orderid};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

    @http:Path {value:"/"}
     resource echoThirdResource (message m) {
        json payload = {"name":"ballerinaThird"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/"}
     resource echoForthResource (message m, @http:QueryParam {value:"order"}string order) {
        json payload = {"name":"ballerinaThird", "orderid":order};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }
}