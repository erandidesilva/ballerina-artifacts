package scenario4;

import ballerina.lang.xmls;
import ballerina.lang.errors;
import ballerina.lang.system;

function getAttributeFromPayload(xml value)(string){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    return specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}tested"];
}

function getAttributeWithPrefixesFromPayload(xml value)(string){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    return specificSecondLevelChild@[cre:tested];
}

function setAttributeWithNewPrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    specificSecondLevelChild@[ns0:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithURLToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}credit"] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithNonExistantURLToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}credit"] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithExistingNonUsedPrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    specificSecondLevelChild@[cre:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithExistingUsedPrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as pre;
    specificSecondLevelChild@[pre:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithDiffURLDiffPrefixNonExistingToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as ns0;
    specificSecondLevelChild@[ns0:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithDiffURLPrefixExistingNonUsedToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as cre;
    specificSecondLevelChild@[cre:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithDiffURLPrefixExistingUsedToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as ore;
    specificSecondLevelChild@[ore:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setMultipleAttributesSameUrlDifferentPrefix(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, ns0:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, ns0:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[ns0:credit] = "true";
    specificSecondLevelChild@[ns0:exachangable] = "false";
    specificSecondLevelChild@[ns0:transferrable] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function setMultipleAttributesSameUrlSamePrefixes(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ore;
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as pre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[cre:credit] = "true";
    specificSecondLevelChild@[pre:exachangable] = "false";
    specificSecondLevelChild@[ore:transferrable] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function setMultipleAttributesDiffUrlDiffPrefix(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as ns0;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[cre:credit] = "true";
    specificSecondLevelChild@[ns0:exachangable] = "false";
    specificSecondLevelChild@[ns0:transferrable] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function setMultipleAttributesUsingMap(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as pre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, pre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, pre:P_SDR_LINES_TBL_ITEM);
    map attributes = {"{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}pending": "false", reactable:"yes" ,"{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}expireOn":"2017-12-12"};
    xmls:setAttributes(specificSecondLevelChild, attributes);
    updatedElement = specificSecondLevelChild;
    return updatedElement;
}

function updateAttributeWithURLToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}line"] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeWithDifferentURLToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}line"] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeNewPrefixSameUrlToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    specificSecondLevelChild@[ns0:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeNonUsedPrefixSameUrlToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    specificSecondLevelChild@[cre:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function getAllAttributesWithDifferentNamespacePrefix(xml value)(string attributeValue, errors:TypeCastError error){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, ns0:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, ns0:P_SDR_LINES_TBL_ITEM);
    map attributes = <map> specificSecondLevelChild@;
    attributeValue, error = (string)attributes[ns0:tested];
    system:println(attributes);
    return;
}

function getAllAttributesWithNotUsedNamespacePrefix(xml value)(string attributeValue, errors:TypeCastError error){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    map attributes = <map> specificSecondLevelChild@;
    attributeValue, error = (string)attributes[cre:tested];
    system:println(attributes);
    return;
}

function addChildrenToXmlWithSameNamespace(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function addChildrenToXmlWithDifferentNamespaceForElement(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}


function addChildrenToXmlWithDifferentNamespaceForAttribute(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function addChildrenToXmlWithDifferentNamespace(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}checked";
    string a2Name = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function addChildrenToXmlWithSameNamespaceExistingPrefix(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ore;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, ore:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, ore:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function addChildrenToXmlWithDifferentNamespaceWithExistingPrefix(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as pre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}checked";
    string a2Name = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function addChildrenToXmlWithSameNamespaceWithoutPrefix(xml value)(xml updatedSequence){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as pre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(specificSecondLevelChild, newSequence);
    updatedSequence = specificSecondLevelChild;
    system:println(updatedSequence);
    return;
}

function checkDeepCopy(xml value)(xml updatedXml){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as pre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(specificSecondLevelChild);
    system:println(allChildrenOfSpecificSecondLevelChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}PRODUCT_TYPE";
    string aName = "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}checked";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    sequence1 = newSequence;
    elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}">{{text}}</{{uName}}><test>this is a test</test>`;
    sequence2 = newSequence;
    updatedXml = sequence1 + sequence2;
    return;
}

