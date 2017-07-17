package scenario2;

import ballerina.lang.xmls;
import ballerina.lang.system;

function extractSelectedChild(xml value)(xml selectedChildren){
    selectedChildren = xmls:selectChildren(value, "test0");
    return;
}

function extractAllChildren(xml value)(xml selectedChildren){
    selectedChildren = xmls:children(value);
    system:println(selectedChildren);
    return;
}

function selectElement(xml value)(xml selectedElement){
    xml child = xmls:selectChildren(value, "test0");
    xml childrenOfParent = xmls:children(child);
    xml selectedElement1 = xmls:select(childrenOfParent, "owner");
    xml selectedElement2 = xmls:select(childrenOfParent, "full_name");
    xml selectedElement3 = xmls:select(childrenOfParent, "keys_url");
    xml selectedElement4 = xmls:select(childrenOfParent, "private");
    selectedElement = selectedElement1 + selectedElement2 + selectedElement3 + selectedElement4;
    return;
}

function sliceElements(xml value)(xml selectedElement){
    xml child = xmls:selectChildren(value, "test0");
    xml childrenOfParent = xmls:children(child);
    system:println(childrenOfParent);
    selectedElement = xmls:slice(childrenOfParent, 2, 5);
    system:println(selectedElement);
    return;
}

function sliceElementsSingleton(xml value)(xml selectedElement){
    xml child = xmls:selectChildren(value, "test0");
    selectedElement = xmls:slice(child, -1, -1);
    system:println(selectedElement);
    return;
}

function copyAndChangeElements(xml value)(xml copiedElement){
    xml child = xmls:selectChildren(value, "test0");
    xml childrenOfParent = xmls:children(child);
    xml selectedElement1 = xmls:select(childrenOfParent, "owner");
    xml selectedElement2 = xmls:select(childrenOfParent, "full_name");
    xml selectedElement3 = xmls:select(childrenOfParent, "keys_url");
    xml selectedElement4 = xmls:select(childrenOfParent, "private");
    xml originalElement = selectedElement1 + selectedElement2 + selectedElement3 + selectedElement4;
    copiedElement = xmls:copy(originalElement);
    return;
}

function copyEntirePayload(xml value)(xml copiedElement){
    copiedElement = xmls:copy(value);
    return;
}

function stripAndOmitComments(xml value)(xml changedElement){
    changedElement = xmls:strip(value);
    changedElement = xmls:elements(changedElement);
    return;
}

function getAttributeFromPayload(xml value)(string){
    xml firstLevelChild = xmls:children(value);
    xml childrenOfFirstLevelChild = xmls:children(firstLevelChild);
    xml specificSecondLevelChild = xmls:select(childrenOfFirstLevelChild, "private");
    return specificSecondLevelChild@["local"];
}

function updateAttributeValue(xml value)(xml updatedElement){
    xml firstLevelChildren = xmls:children(value);
    xml specificChildFromFirstLevelChildren = xmls:select(firstLevelChildren, "test51");
    xml allChilren = xmls:children(specificChildFromFirstLevelChildren);
    xml specificSecondLevelChild = xmls:select(allChilren, "private");
    specificSecondLevelChild@["local"] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateMultipleAttributeValues(xml value)(xml updatedElement){
    xml firstLevelChildren = xmls:children(value);
    xml specificChildFromFirstLevelChildren = xmls:select(firstLevelChildren, "test51");
    xml allChilren = xmls:children(specificChildFromFirstLevelChildren);
    xml specificSecondLevelChild = xmls:select(allChilren, "private");
    specificSecondLevelChild@["local"] = "false";
    specificSecondLevelChild@["valid"] = "false";
    specificSecondLevelChild@["date"] = "2011-09-08";
    specificSecondLevelChild@["chargable"] = "true";
    updatedElement = specificSecondLevelChild;
    return updatedElement;
}

function setAttributeToPayload(xml value)(xml updatedElement){
    xml firstLevelChildren = xmls:children(value);
    xml specificChildFromFirstLevelChildren = xmls:select(firstLevelChildren, "test51");
    xml allChilren = xmls:children(specificChildFromFirstLevelChildren);
    xml specificSecondLevelChild = xmls:select(allChilren, "private");
    specificSecondLevelChild@["exchangable"] = "true";
    updatedElement = specificSecondLevelChild;
    return updatedElement;
}

function setMultipleAttributesToPayload(xml value)(xml updatedElement){
    xml firstLevelChildren = xmls:children(value);
    xml specificChildFromFirstLevelChildren = xmls:select(firstLevelChildren, "test51");
    xml allChilren = xmls:children(specificChildFromFirstLevelChildren);
    xml specificSecondLevelChild = xmls:select(allChilren, "teams_url");
    map attributes = {pending: "false", reactable:"yes" ,expireOn:"2017-12-12"};
    xmls:setAttributes(specificSecondLevelChild, attributes);
    updatedElement = specificSecondLevelChild;
    return updatedElement;
}

function getNameOfElement(xml value)(string elementName){
    xml firstLevelChildren = xmls:children(value);
    xml specificChildFromFirstLevelChildren = xmls:select(firstLevelChildren, "test51");
    xml allChilren = xmls:children(specificChildFromFirstLevelChildren);
    xml specificSecondLevelChild = xmls:select(allChilren, "teams_url");
    elementName = xmls:getElementName(specificSecondLevelChild);
    return;
}
