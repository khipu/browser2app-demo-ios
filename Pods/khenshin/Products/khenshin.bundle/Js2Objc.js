var __ioscalls = [];
var __iosPrioritycalls = [];

function __js2oc(m) {
	__ioscalls.push(m);
}

function __js2oc_priority_message(m){
    __iosPrioritycalls.push(m);
}

function __js2oc_is_priority_empty_obj()
{
    return __iosPrioritycalls.length == 0;
}

function __js2oc_is_priority_empty()
{
    return __iosPrioritycalls.length == 0;
}

function createMessenger(message) {
    
    var iframe = document.createElement("IFRAME");
    iframe.setAttribute("src", "http://ioscall.khipu.com/" + message);
    document.documentElement.appendChild(iframe);
    iframe.parentNode.removeChild(iframe);
    iframe = null;
}

setInterval(function() {
    if (__iosPrioritycalls.length > 0) {
            
            createMessenger(__iosPrioritycalls.shift());
    }else if (__ioscalls.length > 0) {
            
            createMessenger(__ioscalls.shift());
    }
} , 300);
