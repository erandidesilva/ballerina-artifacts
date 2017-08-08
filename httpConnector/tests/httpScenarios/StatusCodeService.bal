package httpScenarios;

import ballerina.net.http;
import ballerina.lang.system;

@http:configuration {
    basePath:"/statusCodeService"
}
service <http> StatusCodeService {

    @http:GET {}
    @http:Path {value:"/call/{code}"}
    resource statusCodeResource (message m, @http:PathParam {value:"code"} string codeValue) {
        string resourcePath = "/statusCodeService/codes/";
        message response = {};
        string method = http:getMethod(m);
        string connection = system:getEnv("TOMCAT_HOST");

        resourcePath = resourcePath + codeValue;
        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = httpCheck.execute(method, resourcePath, m);

        reply response;
    }
}


