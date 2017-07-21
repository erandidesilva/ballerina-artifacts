package scenario5;

import ballerina.lang.xmls;
import ballerina.lang.system;
import ballerina.lang.errors;

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
    system:println(firstLevelChildren);
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

function getAllAttributes(xml value)(map attributes){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    attributes = <map> specificChild@;
    system:println(attributes);
    return;
}

function getAllAttributesWithNamespacePrefixes(xml value)(string attributeValue, errors:TypeCastError error){
    xmlns "http://example.com/ServiceName/sample/test" as ns0;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    map attributes = <map> secondLevelSpecificChild@;
    attributeValue, error = (string)attributes[ns0:qualifier];
    system:println(attributes);
    return;
}

function getAllAttributesWithDifferentNamespaceWithUrl(xml value)(string attributeValue, errors:TypeCastError error){
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    map attributes = <map> secondLevelSpecificChild@;
    attributeValue, error = (string)attributes["{http://example.com/ServiceName/sample/test}qualifier"];
    system:println(attributeValue);
    return;
}

function addChildrenOnDefaultNamespaceToXmlWithPrefixedNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName";
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "PRODUCT_TYPE";
    string aName = "checked";
    string a2Name = "exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}

function addChildrenUsingDefaultNamespaceToXmlWithDefaultNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName/sample";
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample}SENDER");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "PRODUCT_TYPE";
    string aName = "checkaddChildrenUsingPrefixedNamespaceToXmlWithDefaultNamespaceed";
    string a2Name = "exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}


function addChildrenUsingPrefixedNamespaceToXmlWithDefaultNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName/sample/test/level1" as pre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample}SENDER");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://example.com/ServiceName/sample/test/level1}PRODUCT_TYPE";
    string aName = "{http://example.com/ServiceName/sample/test/level1}checked";
    string a2Name = "{http://example.com/ServiceName/sample/test/level1}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}

function addChildrenUsingPrefixedNamespaceAttributeOnlyToXmlWithDefaultNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName/sample/test/level1" as pre;
    xmlns "http://example.com/ServiceName/sample";
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample}SENDER");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "PRODUCT_TYPE";
    string aName = "{http://example.com/ServiceName/sample/test/level1}checked";
    string a2Name = "{http://example.com/ServiceName/sample/test/level1}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}

function addChildrenUsingEmptyNamespaceToXmlWithDefaultNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName/sample/test/level1" as pre;
    xmlns "";
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample}SENDER");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName1 = "{}PRODUCT_TYPE";
    string uName2 = "PRODUCT_NAME";
    string aName = "{}checked";
    string a2Name = "{http://example.com/ServiceName/sample/test/level1}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd1 = xml `<{{uName1}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName1}}>`;
    xml elementToAdd2 = xml `<{{uName2}}>{{text}}</{{uName2}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd1 + copyOfSpecificSecondLevelChild + elementToAdd2;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}

function addChildrenOnPrefixedNamespaceToXmlWithPrefixedNamespace(xml value)(xml updatedSequence){
    xmlns "http://example.com/ServiceName/sample/test" as cre;
    xml firstLevelChildren = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChildren, "{http://example.com/ServiceName}CNTROLAREA");
    xml secondLevelSpecificChild = xmls:selectChildren(specificChild, "{http://example.com/ServiceName/sample/test}DATETIME");
    xml allChildrenOfSpecificSecondLevelChild = xmls:children(secondLevelSpecificChild);
    system:println(firstLevelChildren);
    system:println(secondLevelSpecificChild);
    system:println("aaaaaaaaaaaaaaaaaaaaa");
    string uName = "{http://example.com/ServiceName/sample/test}PRODUCT_TYPE";
    string aName = "{http://example.com/ServiceName/sample/test}checked";
    string a2Name = "{http://example.com/ServiceName/sample/test}exchangable";
    string text = "added element";
    string attributeValue = "true";
    xml elementToAdd = xml `<{{uName}} {{aName}}="{{attributeValue}}" {{a2Name}}="{{attributeValue}}">{{text}}</{{uName}}>`;
    xml copyOfSpecificSecondLevelChild = xmls:copy(allChildrenOfSpecificSecondLevelChild);
    xml newSequence = elementToAdd + copyOfSpecificSecondLevelChild;
    xmls:setChildren(secondLevelSpecificChild, newSequence);
    updatedSequence = secondLevelSpecificChild;
    system:println(updatedSequence);
    return;
}



