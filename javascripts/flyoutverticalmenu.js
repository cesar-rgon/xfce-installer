window.onscroll = function (oEvent) {
	var top = window.pageYOffset || document.documentElement.scrollTop;
	if ((top > 170) &&
	    ( document.getElementById("menuwrapper").className.match(/(?:^|\s)absolutePosition(?!\S)/))) {
		// Turns absolute position to fixed position for application menu
		document.getElementById("menuwrapper").className = document.getElementById("menuwrapper").className.replace( /(?:^|\s)absolutePosition(?!\S)/g , 'fixedPosition' );
	} else {
		if ((top < 170) &&
		    (document.getElementById("menuwrapper").className.match(/(?:^|\s)fixedPosition(?!\S)/))) {
			// Turns fixed position to absolute position for application menu
			document.getElementById("menuwrapper").className = document.getElementById("menuwrapper").className.replace( /(?:^|\s)fixedPosition(?!\S)/g , 'absolutePosition' );
		}
	}
}
