overrideAlerts = function(w){
    if(w.self === w.top) {
            w.alert = function() {
                    Khipu.lastAlert = arguments;
                    console.log('alert = ' + Khipu.lastAlert[0]);
            }
    } else {
            w.alert = w.parent.alert;
    }
    for(var i=0; i< w.frames.length ; i++) {
            overrideAlerts(w.frames[i]);
    }
}
overrideAlerts(window);
