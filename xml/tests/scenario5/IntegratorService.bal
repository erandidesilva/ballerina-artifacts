package scenario5;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.xmls;
import ballerina.lang.errors;
import ballerina.lang.system;

service <http> XmlWithDefaultNamespaceTestService {

    @http:POST {}
    resource extractSpecificChildWithUrlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithNamespaceUrl(payload);
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
    resource extractSpecificChildWithPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithPrefix(payload);
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
    resource extractSpecificChildWithDiffNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithDifferentNamespace(payload);
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
    resource extractSpecificChildWithoutNamespaceParentHavingNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithoutNamespaceParentConsistOfNamespace(payload);
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
    resource extractSpecificChildWithNamespacePrefixParentHavingNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithNamespacePrefixParentConsistOfNamespace(payload);
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
    resource extractSpecificChildWithDiffNamespaceParentHavingNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithDiffNamespaceParentConsistOfNamespace(payload);
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
    resource extractSpecificChildWithEmptyNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithEmptyNamespace(payload);
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
    resource extractSpecificChildWithNamespacePrefixResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = getSpecificChildWithNamespacePrefix(payload);
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
    resource getAttributeResource (message m) {
        message response = {};
        string value;
        xml payload = messages:getXmlPayload(m);
        value = getAttributeUsingUrlFromPayload(payload);
        messages:setStringPayload(response, value);
        reply response;
    }

    @http:POST {}
    resource addAttributeForElementWithDefaultNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addAttributeForDefaultNamespaceElementPayload(payload);
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
    resource addAttributeWithPrefixForElementWithDefaultNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addAttributeWithNamespacePrefixForElementWithDefaultNamespace(payload);
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
    resource addAttributeWithEmptyNamespaceResource(message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addAttributeWithEmptyNamespace(payload);
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
    resource getAllAttributesWithoutNamespacesResource (message m) {
        message response = {};
        map value;
        string attributeValue;
        errors:TypeCastError err;
        xml payload = messages:getXmlPayload(m);
        value = getAllAttributes(payload);
        attributeValue, err = (string)value["checked"];
        if (err == null){
            messages:setStringPayload(response, attributeValue);
        }
        reply response;
    }

    @http:POST {}
    resource getAllAttributesWithNamespacePrefixResource (message m) {
        message response = {};
        string attributeValue;
        errors:TypeCastError err;
        errors:StackTrace trace;
        xml payload = messages:getXmlPayload(m);
        attributeValue, err = getAllAttributesWithNamespacePrefixes(payload);
        if (err == null){
            messages:setStringPayload(response, attributeValue);
        }
        else{
             messages:setStringPayload(response, "Something has gone wrong.Please try again");
        }
        reply response;
    }

    @http:POST {}
    resource getAllAttributesWithNamespaceUrlResource (message m) {
        message response = {};
        string attributeValue;
        errors:TypeCastError err;
        errors:StackTrace trace;
        xml payload = messages:getXmlPayload(m);
        attributeValue, err = getAllAttributesWithDifferentNamespaceWithUrl(payload);
        system:println(attributeValue);
        system:println(err);
        if (err == null){
            messages:setStringPayload(response, attributeValue);
        }
        else{
             messages:setStringPayload(response, "Something has gone wrong.Please try again");
        }
        reply response;
    }


}
