package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;

@http:config {
    basePath:"/"
}
service <http> EchoService {

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

     @http:PUT {}
     @http:Path {value:"/"}
     resource echoForthResource (message m, @http:QueryParam {value:"order"}string order) {
        json payload = {"name":"ballerinaFourth", "orderid":order};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

     @http:Path {value:"*"}
     resource echoFourthResource (message m) {
        json payload = {"name":"ballerinaFourth"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }
}


@http:config {
    basePath:"/test",
    host:"is.wso2.com"
}
service <http> EchoServiceTwo {

    resource echoResource (message m) {
        json payload = {"name":"ballerinaSecondService_1", "age":"1"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

     @http:Path {value:"/"}
     resource echoSecondResource (message m) {
        json payload = {"name":"ballerinaSecondService_Second"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

     @http:Path {value:"*"}
     resource echoThirdResource (message m) {
        json payload = {"name":"ballerinaSecondService_Third"};
        message response = {};
        messages:setJsonPayload(response, payload);
        reply response;
    }

}

