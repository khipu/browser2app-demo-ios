// Debug
console = new Object();
console.log = function(log) {
    var messageToPost = {body: log}
	window.webkit.messageHandlers.console.postMessage(messageToPost);
}
console.debug = console.log;
console.info = console.log;
console.warn = console.log;
console.error = console.log;
