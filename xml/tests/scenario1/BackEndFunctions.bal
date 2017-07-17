package scenario1;

import ballerina.net.http;
import ballerina.lang.xmls;
import ballerina.lang.system;
import ballerina.lang.strings;
import ballerina.lang.messages;

const string connection = "http://localhost:5300";
const string resourcePath = "/services/SimpleStockQuoteService.SimpleStockQuoteServiceHttpSoap11Endpoint";

function filterAndSendToBackEnd (xml value) (message response){
    response = {};
    xml header = xmls:selectChildren(value, "{http://schemas.xmlsoap.org/soap/envelope/}Header");
    xml secondChildOfHeader = xmls:selectChildren(xmls:selectChildren(header, "{http://services.samples}credentials"), "{http://services.samples}id");
    string id = xmls:getTextValue(secondChildOfHeader);
    if (strings:equalsIgnoreCase(id, "001")) {
        xml body = xmls:selectChildren(value, "{http://schemas.xmlsoap.org/soap/envelope/}Body");
        xml payload = constructPayload(body);
        response = sendToBackEnd(payload);
    }
    system:println("value of id:" + id);
    return;
}

function constructPayload (xml value) (xml constructedPayload){
    string base = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://services.samples\" xmlns:xsd=\"http://services.samples/xsd\"><soapenv:Header/></soapenv:Envelope>";
    constructedPayload = xmls:parse(base);
    xml existingChildren = xmls:selectChildren(constructedPayload, "{http://schemas.xmlsoap.org/soap/envelope/}Header");
    xml children = existingChildren + value;
    xmls:setChildren(constructedPayload, children);
    system:println(constructedPayload);
    return;
}

function sendToBackEnd (xml payload) (message response){
    message request = {};
    messages:addHeader(request, "SOAPAction", "urn:getQuote");
    messages:setXmlPayload(request, payload);
    messages:setHeader(request, "Content-Type", "text/xml");
    http:ClientConnector httpConnection = create http:ClientConnector(connection);
    response = httpConnection.post (resourcePath, request);
    return;
}

