package scenario3;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.xmls;

service <http> XmlWithNamespaceTestService {

    @http:POST {}
    resource getAttributeResource (message m) {
        message response = {};
        string value;
        xml payload = messages:getXmlPayload(m);
        value = getAttributeFromPayload(payload);
        messages:setStringPayload(response, value);
        reply response;
    }

    @http:POST {}
    resource addAttributeResource (message m) {
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
    resource addAttributeWithSamePrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithSamePrefixToPayload(payload);
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
    resource addAttributeWithDiffNamespaceDiffPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithDifferentNamespaceDiffPrefixToPayload(payload);
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
    resource addAttributeWithDiffNamespaceSamePrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithDifferentNamespaceSamePrefixToPayload(payload);
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
    resource addMultipleAttributeWithSameUrlDiffPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setMultipleAttributesSameUrlDifferentPrefix(payload);
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
    resource addMultipleAttributeWithSameUrlSamePrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setMultipleAttributesSameUrlSamePrefix(payload);
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
    resource addMultipleAttributeWithDiffUrlDiffPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setMultipleAttributesDiffUrlDiffPrefix(payload);
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
    resource addMultipleAttributeWithMapResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setMultipleAttributesUsingMap(payload);
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
    resource updateAttributeSameURlDifferentPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeSameURLDifferentPrefix(payload);
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
    resource updateAttributeSameURlSamePrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeSameURLSamePrefix(payload);
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
    resource updateAttributeDiffURlDiffPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeDifferentURLDiffPrefix(payload);
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
    resource updateAttributeDiffURlSamePrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeDifferentURLSamePrefix(payload);
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
        value = getLocalNameofElement(payload);
        messages:setStringPayload(response, value);
        reply response;
    }
}

