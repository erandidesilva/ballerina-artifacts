package scenario4;

import ballerina.lang.errors;
import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.xmls;
import ballerina.lang.system;

service <http> XmlWithMultiplePrefixesTestService {

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
    resource getAttributeWithPrefixResource (message m) {
        message response = {};
        string value;
        xml payload = messages:getXmlPayload(m);
        value = getAttributeWithPrefixesFromPayload(payload);
        messages:setStringPayload(response, value);
        reply response;
    }

    @http:POST {}
    resource addAttributeNewPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithNewPrefixToPayload(payload);
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
    resource addAttributeWithUrlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithURLToPayload(payload);
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
    resource addAttributeWithDiffUrlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithNonExistantURLToPayload(payload);
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
    resource addAttributeWithExistingPrefixNonUsedResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithExistingNonUsedPrefixToPayload(payload);
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
    resource addAttributeWithExistingPrefixUsedResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithExistingUsedPrefixToPayload(payload);
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
    resource addAttributeWithDiffUrlDiffPrefixNonExistingResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithDiffURLDiffPrefixNonExistingToPayload(payload);
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
    resource addAttributeWithDiffUrlPrefixExistingNonUsedResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithDiffURLPrefixExistingNonUsedToPayload(payload);
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
    resource addAttributeWithDiffUrlPrefixExistingUsedResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = setAttributeWithDiffURLPrefixExistingUsedToPayload(payload);
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
        responseXml = setMultipleAttributesSameUrlSamePrefixes(payload);
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
    resource updateAttributeSameURlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeWithURLToPayload(payload);
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
    resource updateAttributeDiffURlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeWithDifferentURLToPayload(payload);
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
    resource updateAttributeNewPrefixSameUrlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeNewPrefixSameUrlToPayload(payload);
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
    resource updateAttributeNonUsedPrefixSameUrlResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = updateAttributeNonUsedPrefixSameUrlToPayload(payload);
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
    resource getAllAttributesWithDiffNamespacePrefixResource (message m) {
        message response = {};
        string attributeValue;
        errors:TypeCastError err;
        errors:StackTrace trace;
        xml payload = messages:getXmlPayload(m);
        attributeValue, err = getAllAttributesWithDifferentNamespacePrefix(payload);
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

    @http:POST {}
    resource getAllAttributesWithUnusedNamespacePrefixResource (message m) {
        message response = {};
        string attributeValue;
        errors:TypeCastError err;
        errors:StackTrace trace;
        xml payload = messages:getXmlPayload(m);
        attributeValue, err = getAllAttributesWithNotUsedNamespacePrefix(payload);
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

    @http:POST {}
    resource addNewChildElementSameNamespaceResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithSameNamespace(payload);
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
    resource addNewChildElementDifferentNamespaceForElementResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithDifferentNamespaceForElement(payload);
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
    resource addNewChildElementDifferentNamespaceForAttributeResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithDifferentNamespaceForAttribute(payload);
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
    resource addNewChildElementDifferentNamespaceResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithDifferentNamespace(payload);
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
    resource addNewChildSameNamespaceExistingPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithSameNamespaceExistingPrefix(payload);
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
    resource addNewChildDifferentNamespaceExistingPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithDifferentNamespaceWithExistingPrefix(payload);
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
    resource addNewChildSameNamespaceWithoutPrefixResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = addChildrenToXmlWithSameNamespaceWithoutPrefix(payload);
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
    resource checkDeepCopyResource (message m) {
        xml responseXml;
        message response = {};
        xml payload = messages:getXmlPayload(m);
        responseXml = checkDeepCopy(payload);
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
}
