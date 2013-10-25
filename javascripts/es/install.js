var installData = {
	prerequisites: "Prerrequisitos",
	prerequisiteList: [
		{prerequisite: "<a href='http://www.ubuntu.com/download/server' target='_blank'>Descargar Ubuntu Server</a> 12.04 ó 13.10 desde la <a href='http://www.ubuntu.com/' target='_blank'>web de Ubuntu</a>"},
		{prerequisite: "<a href='http://www.forat.info/2008/07/07/servidor-en-linux-ubuntu-server-vol-2-sistema-operativo/' target='_blank'>Instalar Ubuntu Server</a> de 32 ó 64 bits (recomendado sin escritorio alguno)"},
		{prerequisite: "<a href='http://www.forat.info/2008/07/10/servidor-en-linux-ubuntu-server-vol-3-configuracion-de-red/' target='_blank'>Configurar la conexión de red e internet.</a>"},
		{prerequisite: "Iniciar sesión de usuario en terminal para comenzar pasos de instalación"}
	],
	installation: "Instalación",
	installationDescription: "Descargar script, descomprimirlo y ejecutarlo",
	imageList: [
		{source: "../../images/installation/es/install-01.jpg", description: "Pantalla nombre usuario"},
		{source: "../../images/installation/es/install-02.jpg", description: "Características ordenador"},
		{source: "../../images/installation/es/install-03.jpg", description: "Perfiles de instalacion"},
		{source: "../../images/installation/es/install-04.jpg", description: "Instalar Lightdm"},
		{source: "../../images/installation/es/install-05.jpg", description: "Compresores - descompresores"},
		{source: "../../images/installation/es/install-06.jpg", description: "Desarrollo - programación"},
		{source: "../../images/installation/es/install-07.jpg", description: "Descargas"},
		{source: "../../images/installation/es/install-08.jpg", description: "Utilidades escritorio"},
		{source: "../../images/installation/es/install-09.jpg", description: "Juegos"},
		{source: "../../images/installation/es/install-10.jpg", description: "Multimedia"},
		{source: "../../images/installation/es/install-11.jpg", description: "Oficina"},
		{source: "../../images/installation/es/install-12.jpg", description: "Sistema"},
		{source: "../../images/installation/es/install-13.jpg", description: "Internet"},
		{source: "../../images/installation/es/install-14.jpg", description: "Acciones post-instalación"},
		{source: "../../images/installation/es/install-15.jpg", description: "Resumen instalación"}
	]
}

var installTemplate = Handlebars.templates['install.template']; 
document.getElementById('main-content').innerHTML = installTemplate(installData);
