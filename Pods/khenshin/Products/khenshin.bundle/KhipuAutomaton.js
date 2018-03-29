var KhipuAutomaton = {};

KhipuAutomaton.params = {};
KhipuAutomaton.paramsReady = false;
KhipuAutomaton.result = null;

KhipuAutomaton.getParam = function(paramName) {
    return KhipuAutomaton.params[paramName];
};

KhipuAutomaton.setParam = function(paramName, paramValue, isInitial) {

    postToObjC = true;

    isInitial = typeof isInitial !== 'undefined' ? isInitial : false;

    if ( typeof paramValue === 'string' || paramValue instanceof String ){

        paramValue = paramValue.replaceAll("\n", "%0A");
        paramValue = paramValue.replaceAll("\r", "%0A");
    }
    
    if (isInitial || KhipuAutomaton.params[paramName] == paramValue){
        postToObjC = false;
    }
    
    KhipuAutomaton.params[paramName] = paramValue;
    
    if(postToObjC){ // send to ObjC
        __js2oc_priority_message('setParam#'+paramName+'?'+paramValue);
    }
};


KhipuAutomaton.setResultMessage = function(result) {
    
    if ( typeof result === 'string' || result instanceof String ){
        result = result.replaceAll("\n", "%0A");
        result = result.replaceAll("\r", "%0A");
    }
    
    KhipuAutomaton.result = result;
    __js2oc_priority_message('setResult#'+result);
};

KhipuAutomaton.getResultMessage = function(){
    return KhipuAutomaton.result;
};

KhipuAutomaton.storeCookie = function(cookieName, protocol, hostname, value){
    __js2oc_priority_message('storeCookie#'+cookieName+'|'+protocol+'|'+hostname+'|'+value);
};

String.prototype.replaceAll = function(searchStr, replaceStr) {
    var str = this;
    
    // no match exists in string?
    if(str.indexOf(searchStr) === -1) {
        // return string
        return str;
    }
    
    // replace and remove first match, and do another recursirve search/replace
    return (str.replace(searchStr, replaceStr)).replaceAll(searchStr, replaceStr);
};
