import ballerina.net.http;
import ballerina.lang.messages;

@http:config{basePath:"/echo1"}
service<http> echo {
    
    @http:Path{value:"/2"}
    resource echo1 (message m) {
        string method = http:getMethod(m);
        http:ClientConnector endPoint = create http:ClientConnector("http://localhost:9090");
        message response = http:ClientConnector.execute(endPoint, method, "/echo/3", m);
        reply response;
    }


    @http:Path{value:"/1"}
    resource echo2 (message m) {        
        messages:setStringPayload(m,"no...");
        reply m;
    }


    @http:POST{}
    @http:Path{value:"/1"}
    resource echo3 (message m) {        
        messages:setStringPayload(m,"Post");
        reply m;
    }

    @http:GET{}
    @http:Path{value:"/1"}
    resource echo4 (message m) {        
        messages:setStringPayload(m,"GET");
        reply m;
    }

    

    
}