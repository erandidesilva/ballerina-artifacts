package scenario5;

import ballerina.lang.xmls;
import ballerina.lang.system;

function getSpecificChildWithNamespaceUrl(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    extractedValue = specificChild;
    return;
}

function getSpecificChildWithPrefix(xml value)(xml extractedValue){
    xmlns "http://example.com/ServiceName" as cre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, cre:CNTROLAREA);
    extractedValue = specificChild;
    return;
}

function getSpecificChildWithDifferentNamespace(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample}SENDER");
    extractedValue = secondLevelSpecificChild;
    return;
}

function getSpecificChildWithoutNamespaceParentConsistOfNamespace(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    system:println(secondLevelSpecificChild);
    extractedValue = xmls:selectChildren(secondLevelSpecificChild, "{http://example.com/ServiceName}MONTH");
    return;
}

function getSpecificChildWithNamespacePrefixParentConsistOfNamespace(xml value)(xml extractedValue){
    xmlns "http://example.com/ServiceName" as cre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    system:println(secondLevelSpecificChild);
    extractedValue = xmls:selectChildren(secondLevelSpecificChild, cre:MONTH);
    return;
}

function getSpecificChildWithDiffNamespaceParentConsistOfNamespace(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    system:println(secondLevelSpecificChild);
    extractedValue = xmls:selectChildren(secondLevelSpecificChild, "{http://example.com/MyService}DAY");
    return;
}

function getSpecificChildWithEmptyNamespace(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/}DATAAREA");
    system:println(specificChild);
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/}PROCESS_PO");
    xml thirdLevelSpecificChild = xmls:selectChildren(secondLevelSpecificChild, "POORDERHDR");
    system:println(thirdLevelSpecificChild);
    extractedValue = thirdLevelSpecificChild;
    return;
}

function getSpecificChildWithNamespacePrefix(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    extractedValue = secondLevelSpecificChild;
    return;
}

function getAttributeUsingUrlFromPayload(xml value)(string){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    return specificChild@["fixed"];
}

function addAttributeForDefaultNamespaceElementPayload(xml value)(xml extractedValue){
    xmlns "http://example.com/ServiceName" as cre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    specificChild@["exchangable"] = "true";
    extractedValue = specificChild;
    return;
}

function addAttributeWithNamespacePrefixForElementWithDefaultNamespace(xml value)(xml extractedValue){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xmlns "http://example.com/TestService" as pre;
    specificChild@[pre:exchangable] = "true";
    extractedValue = specificChild;
    return;
}

function addAttributeWithEmptyNamespace(xml value)(xml extractedValue){
    xmlns "http://example.com/ServiceName" as cre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    specificChild@["{}exchangable"] = "true";
    extractedValue = specificChild;
    return;
}