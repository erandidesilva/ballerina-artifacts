package scenario3;

import ballerina.lang.xmls;

function getAttributeFromPayload(xml value)(string){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    return specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}line"];
}

function setAttributeToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    specificSecondLevelChild@[ns0:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithSamePrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    specificSecondLevelChild@[cre:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithDifferentNamespaceDiffPrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as ns0;
    specificSecondLevelChild@[ns0:credit] = "true";
    updatedElement = specificSecondLevelChild;
    return;
}

function setAttributeWithDifferentNamespaceSamePrefixToPayload(xml value)(xml updatedElement){
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as cre;
    specificSecondLevelChild@[cre:credit] = "true";
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

function setMultipleAttributesSameUrlSamePrefix(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[cre:credit] = "true";
    specificSecondLevelChild@[cre:exachangable] = "false";
    specificSecondLevelChild@[cre:transferrable] = "false";
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
    specificSecondLevelChild@[ns0:credit] = "true";
    specificSecondLevelChild@[ns0:exachangable] = "false";
    specificSecondLevelChild@[ns0:transferrable] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function setMultipleAttributesUsingMap(xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    map attributes = {"{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}pending": "false", reactable:"yes" ,"{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample}expireOn":"2017-12-12"};
    xmls:setAttributes(specificSecondLevelChild, attributes);
    updatedElement = specificSecondLevelChild;
    return updatedElement;
}


function updateAttributeSameURLDifferentPrefix (xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as ns0;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, ns0:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, ns0:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[ns0:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeSameURLSamePrefix (xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@[cre:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeDifferentURLDiffPrefix (xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as ns0;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    specificSecondLevelChild@["{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample/test}line"] = "false";
    specificSecondLevelChild@[ns0:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function updateAttributeDifferentURLSamePrefix (xml value)(xml updatedElement){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/sample" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL");
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, "{http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/}P_SDR_LINES_TBL_ITEM");
    specificSecondLevelChild@[cre:line] = "false";
    updatedElement = specificSecondLevelChild;
    return;
}

function getLocalNameofElement(xml value)(string elementLocalName){
    xmlns "http://xmlns.oracle.com/apps/ozf/soaprovider/plsql/ozf_sd_request_pub/create_sd_request/" as cre;
    xml firstLevelChild = xmls:children(value);
    xml specificChild = xmls:select(firstLevelChild, cre:P_SDR_LINES_TBL);
    xml childrenOfSpecificChild = xmls:children(specificChild);
    xml specificSecondLevelChild = xmls:select(childrenOfSpecificChild, cre:P_SDR_LINES_TBL_ITEM);
    elementLocalName = xmls:getElementName(specificSecondLevelChild);
    return;
}



