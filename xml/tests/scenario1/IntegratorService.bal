package scenario1;

import ballerina.net.http;
import ballerina.lang.messages;

service <http> PipeFilterService {

    @http:POST {}
    resource pipeFilterResource (message m) {
        message response = {};
        xml payload = messages:getXmlPayload(m);
        response = filterAndSendToBackEnd(payload);
        reply response;
    }
}