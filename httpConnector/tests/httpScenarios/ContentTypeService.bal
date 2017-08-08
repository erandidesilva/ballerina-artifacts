package httpScenarios;

import ballerina.net.http;
import ballerina.lang.system;

@http:configuration {
    basePath:"/contentTypeService"
}
service <http> ContentTypeService {

    @http:POST {}
    @http:Path {value:"/call"}
    resource contentTypeResource (message m) {
        string resourcePath = "/contentTypeService/contentType/";
        message response = {};
        string method = http:getMethod(m);
        string connection = system:getEnv("TOMCAT_HOST");

        http:ClientConnector httpCheck = create http:ClientConnector(connection);
        response = httpCheck.execute(method, resourcePath, m);

        reply response;
    }
}
