var headerData = {
	subtitle: "Instalar Xfce en Ubuntu para hogar, oficina o servidor",
	selectedSpanish: "selected",
	githubProyect: "Ver proyecto en ",
	optionsMenu: [
		{url: "index.html", title: "Inicio", target: "_self"},
		{url: "install.html", title: "Instalación", target: "_self"},
		{url: "applications.html", title: "Aplicaciones", target: "_self"},
		{url: "https://github.com/cesar-rgon/xfce-installer/wiki/_pages", title: "Wiki", target: "_blank"},
		{url: "https://github.com/cesar-rgon/xfce-installer/issues", title: "Publicaciones", target: "_blank"}
	]
}
	
var headerTemplate = Handlebars.templates['header.template']; 
document.getElementById('header-template').innerHTML = headerTemplate(headerData);
