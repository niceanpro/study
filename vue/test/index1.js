
window.onhashchange = function() {
 //blah blah blah
 window.alert("sometext");

}

window.onhashchange = function() {
    if (window.innerDocClick) {
        window.innerDocClick = false;
    } else {
        if (window.location.hash != '#undefined') {
        	window.alert("sometext11");
            goBack();
        } else {
        	window.alert("sometext22");
            history.pushState("", document.title, window.location.pathname);
            location.reload();
        }
    }
}


window.onpopstate = function(event) {
  alert("location: " + document.location + ", state: " + JSON.stringify(event.state));
};

