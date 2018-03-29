var KhipuAutomaton = {};

KhipuAutomaton.params = {};
KhipuAutomaton.paramsReady = false;

KhipuAutomaton.getParam = function(paramName) {
    return KhipuAutomaton.params[paramName];
};

KhipuAutomaton.setParam = function(paramName, paramValue, isInitial) {
    isInitial = typeof isInitial !== 'undefined' ? isInitial : false;
    postToObjC = true;
    if (isInitial || KhipuAutomaton.params[paramName] == paramValue){
        postToObjC = false;
    }
    
    KhipuAutomaton.params[paramName] = paramValue;
    
    if(postToObjC && typeof window.webkit.messageHandlers === 'object'){ // send to ObjC
        window.webkit.messageHandlers.setParam.postMessage({name:paramName, value: paramValue});
    }
}

KhipuAutomaton.storeCookie = function(cookieName, protocol, hostname, value){
    window.webkit.messageHandlers.storeCookie.postMessage({name: cookieName,
                                                          protocol: protocol,
                                                          hostname: hostname,
                                                          value: value});
}