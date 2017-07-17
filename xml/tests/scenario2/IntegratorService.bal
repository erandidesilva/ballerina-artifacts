package scenario2;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.xmls;

service <http> LargePayloadTestService {

    @http:POST {}
    resource extractChildResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = extractSelectedChild(payload);
        messages:setXmlPayload(response, responseXml);
        reply response;
    }

    @http:POST {}
    resource extractChildrenResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = extractAllChildren(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           string value = "Not a singleton";
           messages:setStringPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource extractSpecficElementResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = selectElement(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<sample></sample>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource sliceElementResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = sliceElements(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<sample></sample>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource sliceElementSingletonResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = sliceElementsSingleton(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<sample></sample>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource copyAndChangeElementsResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = copyAndChangeElements(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<sample></sample>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource copyEntireXmlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = copyEntirePayload(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource stripAndRemoveCommentsXmlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = stripAndOmitComments(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource getAttributesResource (message m) {
        string responseValue;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseValue = getAttributeFromPayload(payload);
        messages:setStringPayload(response, responseValue);
        reply response;
    }

    @http:POST {}
    resource updateAttributesResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeValue(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource updateMultipleAttributesResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateMultipleAttributeValues(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource setAttributesResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeToPayload(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource setMultipleAttributesResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setMultipleAttributesToPayload(payload);
        if (xmls:isSingleton(responseXml)){
            messages:setXmlPayload(response, responseXml);
        }
        else{
           xml value = xmls:parse("<test></test>");
           xmls:setChildren(value, responseXml);
           messages:setXmlPayload(response, value);
        }
        reply response;
    }

    @http:POST {}
    resource getElementNameResource (message m) {
        message response = {};
        string value;
        xml payload = messages:getXmlPayload(m);
        value = getNameOfElement(payload);
        messages:setStringPayload(response, value);
        reply response;
    }

}