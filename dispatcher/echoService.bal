import ballerina.net.http;
import ballerina.lang.messages;

@http:config{basePath:"/echo"}
service<http> echo {
    
	@http:GET{} 
    @http:Path{value:"/3"}
	resource sayHello(message m) {
		message response = {};
		messages:setStringPayload(response, "Get...");
		reply response;
		
	}

	@http:POST{} 
    @http:Path{value:"/3"}
	resource sayPost(message m) {
		message response = {};
		messages:setStringPayload(response, "Post...");
		reply response;
		
	}
}
