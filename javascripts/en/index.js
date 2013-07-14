var indexData = {
	imageSlider: [
		{imagePath: "../../images/image-slider/en/image-slider-01.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-02.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-03.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-04.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-05.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-06.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-07.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-08.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-09.jpg"},
		{imagePath: "../../images/image-slider/en/image-slider-10.jpg"}
	],
	introduction: "Introduction",
	presentation: "This <a href='https://en.wikipedia.org/wiki/Script_(computing)' target='_blank'>script</a> installs <a href='http://www.xfce.org/?lang=en' target='_blank'>Xfce</a> desktop and a set of programs according to user needs starting from an <a href='http://en.wikipedia.org/wiki/Ubuntu_(operating_system)' target='_blank'>Ubuntu</a> Server base system",
	features: "Main features",
	featureList: [
		{feature: "Unattended installation of the Xfce desktop and selected applications by user"},
		{feature: "Error <a href='http://en.wikipedia.org/wiki/Computer_data_logging' target='_blank'>Log</a> during the installation process"},
		{feature: "Ability to shutdown, restart or show error log at the end of the installation process"},
		{feature: "It offers a great variety of programs of different types"},
		{feature: "Automatic configuration of applications to be ready to use them"},
		{feature: "Multi-lingual support: english and spanish texts included in script"}
	],
	benefits: "Why use this script over other alternatives?",
	benefitList: [
		{benefit: "Not a <a href='http://en.wikipedia.org/wiki/Linux_distribution' target='_blank'>distro</a>. It's a script. Quick to download it and use it"},
		{benefit: "It's valid for homes, offices and servers"},
		{benefit: "It can be installed on different versions of Ubuntu: 12.04 and 13.04"},
		{benefit: "Lower consumption of system <a href='http://en.wikipedia.org/wiki/Personal_computer_hardware' target='_blank'>hardware</a> resources"},
		{benefit: "Greater customization of applications to install"},
		{benefit: "Ubuntu Server offers more maintenance period than a conventional Ubuntu desktop version"},
		{benefit: "Save <a href='http://en.wikipedia.org/wiki/Computer_configuration' target='_blank'>configuration</a> time after the installation proccess"},
		{benefit: "More dynamic, it offers applications from different <a href='http://en.wikipedia.org/wiki/Desktop_environment' target='_blank'>desktops</a>. Not limited only to Xfce desktop"},
		{benefit: "Modern desktop themes (<a href='http://gnome-look.org/content/show.php/?content=128143' target='_blank'>Faenza</a> icons and <a href='http://shimmerproject.org/project/greybird/' target='_blank'>GreyBird</a> theme)"},
		{benefit: "Automatic installation of third-party <a href='http://en.wikipedia.org/wiki/Software_repository' target='_blank'>repositories</a>"}
	]
}

var indexTemplate = Handlebars.templates['index.template']; 
document.getElementById('main-content').innerHTML = indexTemplate(indexData);
