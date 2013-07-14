window.onload = function () {
	// Google Analytics
	if (getParameter("ga") != "off") {
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-41047542-1', 'cesar-rgon.github.io');
		ga('send', 'pageview');
	}
};

// Evita errores de consola en exploradores que no las tiene.
(function() {
	var method;
	var noop = function () {};
	var methods = [
		'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
		'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
		'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
		'timeStamp', 'trace', 'warn'
	];
	var length = methods.length;
	var console = (window.console = window.console || {});

	while (length--) {
		method = methods[length];

		if (!console[method]) {
			console[method] = noop;
		}
	}
}());

// Visit www.menucool.com for source code, other menu scripts and web UI controls. Please keep this notice intact. Thank you.
var sse2=function(){var c=20;var b,a;return{buildMenu:function(){var d=document.getElementById("sses2");if(!d){return}var j=d.getElementsByTagName("ul")[0];d.style.width=j.offsetWidth+1+"px";var f=d.getElementsByTagName("li");var e=d.getElementsByTagName("a");b=document.createElement("li");b.className="highlight";j.appendChild(b);var g=document.location.href.toLowerCase();a=-1;var k=-1;for(var h=0;h<e.length;h++){if(g.indexOf(e[h].href.toLowerCase())!=-1&&e[h].href.length>k){a=h;k=e[h].href.length}}if(a==-1&&/:\/\/(?:www\.)?[^.\/]+?\.[^.\/]+\/?$/.test){for(var h=0;h<e.length;h++){if(e[h].getAttribute("maptopuredomain")=="true"){a=h;break}}if(a==-1&&e[0].getAttribute("maptopuredomain")!="false"){a=0}}if(a>-1){b.style.width=f[a].offsetWidth+"px";sse2.move(f[a])}else{b.style.visibility="hidden"}for(var h=0;h<f.length-1;h++){f[h].onmouseover=function(){if(a==-1){b.style.visibility="visible"}if(this.offsetLeft!=b.offsetLeft){sse2.move(this)}}}d.onmouseover=function(){if(b.t2){b.t2=clearTimeout(b.t2)}};d.onmouseout=function(){if(a>-1&&f[a].offsetLeft!=b.offsetLeft){b.t2=setTimeout(function(){sse2.move(f[a])},50)}if(a==-1){b.t2=setTimeout(function(){b.style.visibility="hidden"},50)}}},move:function(e){clearInterval(b.timer);var d=(b.offsetLeft<e.offsetLeft)?1:-1;b.timer=setInterval(function(){sse2.mv(e,d)},15)},mv:function(e,d){if(d==1){if(b.offsetLeft-c<e.offsetLeft){this.changePosition(e,1)}else{clearInterval(b.timer);b.timer=setInterval(function(){sse2.recoil(e,1)},15)}}else{if(b.offsetLeft+c>e.offsetLeft){this.changePosition(e,-1)}else{clearInterval(b.timer);b.timer=setInterval(function(){sse2.recoil(e,-1)},15)}}this.changeWidth(e)},recoil:function(e,d){if(d==-1){if(b.offsetLeft>e.offsetLeft){b.style.left=e.offsetLeft+"px";clearInterval(b.timer)}else{b.style.left=b.offsetLeft+2+"px"}}else{if(b.offsetLeft<e.offsetLeft){b.style.left=e.offsetLeft+"px";clearInterval(b.timer)}else{b.style.left=b.offsetLeft-2+"px"}}},changePosition:function(e,d){if(d==1){b.style.left=b.offsetLeft+Math.ceil(Math.abs(e.offsetLeft-b.offsetLeft+c)/10)+1+"px"}else{b.style.left=b.offsetLeft-Math.ceil(Math.abs(b.offsetLeft-e.offsetLeft+c)/10)-1+"px"}},changeWidth:function(e){if(b.offsetWidth!=e.offsetWidth){var d=b.offsetWidth-e.offsetWidth;if(Math.abs(d)<4){b.style.width=e.offsetWidth+"px"}else{b.style.width=b.offsetWidth-Math.round(d/3)+"px"}}}}}();if(window.addEventListener){window.addEventListener("load",sse2.buildMenu,false)}else{if(window.attachEvent){window.attachEvent("onload",sse2.buildMenu)}else{window.onload=sse2.buildMenu}};

// Devuelve el primer parametro pasado en la URL de la aplicacion
function getParameter(variable) {
  var query = window.location.search.substring(1);
  var vars = query.split("&");
  for (var i=0;i<vars.length;i++) {
    var pair = vars[i].split("=");
    if (pair[0] == variable) {
      return pair[1];
    }
  } 
}

// Devuelve la URL con el idioma especificado por parámetro y con Google Analytics desactivado
function changeLanguage(parameter) {
	var url = location.protocol + '//' + location.host + location.pathname;
	var filename = url.substring(url.lastIndexOf('/')+1);
	window.location.href = url.substring(0, url.lastIndexOf("/")) + "/../" + parameter + "/" + filename + "?ga=off";
	//window.location.href = location.protocol + '//' + location.host + location.pathname + "?lang=" + parameter + "&ga=off";
}
