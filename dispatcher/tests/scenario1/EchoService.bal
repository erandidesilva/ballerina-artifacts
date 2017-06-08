package scenario1;

service EchoService {

    resource echoResource (message m) {
        reply m;
    }


}