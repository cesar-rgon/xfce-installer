var indexData = {
	imageSlider: [
		{imagePath: "../../images/image-slider/es/image-slider-01.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-02.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-03.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-04.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-05.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-06.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-07.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-08.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-09.jpg"},
		{imagePath: "../../images/image-slider/es/image-slider-10.jpg"}
	],
	introduction: "Introducción",
	presentation: "Este <a href='http://es.wikipedia.org/wiki/Script' target='_blank'>script</a> instala el escritorio <a href='http://www.xfce.org/?lang=es' target='_blank'>Xfce</a> y un conjunto de programas conforme a las necesidades del usuario partiendo del sistema base de <a href='http://es.wikipedia.org/wiki/Ubuntu' target='_blank'>Ubuntu</a> Server",
	features: "Características principales",
	featureList: [
		{feature: "Instalación desatendida del escritorio Xfce y aplicaciones seleccionadas por el usuario"},
		{feature: "<a href='http://es.wikipedia.org/wiki/Log_(registro)' target='_blank'>Log</a> de errores durante el proceso de instalación"},
		{feature: "Posibilidad de apagar, reiniciar o mostrar log de errores al finalizar el proceso de instalación"},
		{feature: "Ofrece una gran variedad de programas de diferentes tipos"},
		{feature: "Configuración automática de aplicaciones para dejarlas preparadas para su uso"},
		{feature: "Soporte multi-idioma: textos en inglés y español incluidos en el script"}
	],
	benefits: "¿Por qué usar este script frente a otras alternativas?",
	benefitList: [
		{benefit: "No es una <a href='http://es.wikipedia.org/wiki/Distribuci%C3%B3n_Linux' target='_blank'>distro</a>. Es un script. Rápido de descargar y usar"},
		{benefit: "Es válido para hogares, oficinas y servidores"},
		{benefit: "Se puede instalar en diferentes versiones de Ubuntu: 12.04 y 13.04"},
		{benefit: "Menor consumo de recursos <a href='http://es.wikipedia.org/wiki/Hardware' target='_blank'>hardware</a> del sistema"},
		{benefit: "Mayor personalización de aplicaciones a instalar"},
		{benefit: "Ubuntu Server ofrece más periodo de mantenimiento que una versión convencional de escritorio"},
		{benefit: "Ahorra tiempo de <a href='http://es.wikipedia.org/wiki/Configuraci%C3%B3n_(inform%C3%A1tica)' target='_blank'>configuración</a> después del proceso de instalación"},
		{benefit: "Más dinámico, ofrece aplicaciones de diferentes <a href='http://es.wikipedia.org/wiki/Entorno_de_escritorio' target='_blank'>escritorios</a>. No se limita sólo al escritorio Xfce"},
		{benefit: "Temas de escritorio moderno (iconos <a href='http://gnome-look.org/content/show.php/?content=128143' target='_blank'>Faenza</a> y tema <a href='http://shimmerproject.org/project/greybird/' target='_blank'>GreyBird</a>)"},
		{benefit: "Instalación automática de <a href='http://es.wikipedia.org/wiki/Repositorio' target='_blank'>repositorios</a> de terceros"}
	]
}

var indexTemplate = Handlebars.templates['index.template']; 
document.getElementById('main-content').innerHTML = indexTemplate(indexData);
