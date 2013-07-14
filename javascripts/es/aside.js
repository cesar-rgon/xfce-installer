var asideData = {
	download: {
		title: "Descargar",
		file: " fichero tar.gz "
	},
	maintained:  " está mantenido por ",
	generated: "Esta página fué generada por ",
	theme: "usando el tema Architect de ",
	design: "Modificaciones en diseño hechas por ",
	and: " y ",
	urlFacebook: "https://www.facebook.com/XfceInstaller"
}
	
var asideTemplate = Handlebars.templates['aside.template']; 
document.getElementById('aside-template').innerHTML = asideTemplate(asideData);
