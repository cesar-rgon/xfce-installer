var headerData = {
	subtitle: "Install Xfce on Ubuntu for home, office or server",
	selectedEnglish: "selected",
	githubProyect: "View project in ",
	optionsMenu: [
		{url: "index.html", title: "Start", target: "_self"},
		{url: "install.html", title: "Installation", target: "_self"},
		{url: "applications.html", title: "Applications", target: "_self"},
		{url: "https://github.com/cesar-rgon/xfce-installer/wiki/_pages", title: "Wiki", target: "_blank"},
		{url: "https://github.com/cesar-rgon/xfce-installer/issues", title: "Issues", target: "_blank"}
	]
}
	
var headerTemplate = Handlebars.templates['header.template']; 
document.getElementById('header-template').innerHTML = headerTemplate(headerData);