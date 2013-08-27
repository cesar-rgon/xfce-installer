var installData = {
	prerequisites: "Prerequisites",
	prerequisiteList: [
		{prerequisite: "<a href='http://www.ubuntu.com/download/server' target='_blank'>Download Ubuntu Server</a> 12.04 or 13.04 from <a href='http://www.ubuntu.com/' target='_blank'>Ubuntu homepage</a>"},
		{prerequisite: "<a href='http://ubuntuserverguide.com/2012/05/how-to-install-ubuntu-server-12-04-lts-precise-pangolin-included-screenshot.html' target='_blank'>Install Ubuntu Server</a> for 32 or 64 bits (recommended without any desktop)"},
		{prerequisite: "<a href='https://help.ubuntu.com/12.04/serverguide/network-configuration.html' target='_blank'>Set up network and internet connection</a>"},
		{prerequisite: "User login on terminal to start installation steps"}
	],
	installation: "Installation",
	installationDescription: "Download script, uncompress it and run it",
	imageList: [
		{source: "../../images/installation/en/install-02.jpg", description: "Username screen"},
		{source: "../../images/installation/en/install-03.jpg", description: "Computer features"},
		{source: "../../images/installation/en/install-04.jpg", description: "Install LightDM"},
		{source: "../../images/installation/en/install-05.jpg", description: "Compressors - Uncompressors"},
		{source: "../../images/installation/en/install-06.jpg", description: "Development"},
		{source: "../../images/installation/en/install-07.jpg", description: "Downloads"},
		{source: "../../images/installation/en/install-08.jpg", description: "Desktop tools"},
		{source: "../../images/installation/en/install-09.jpg", description: "Games"},
		{source: "../../images/installation/en/install-10.jpg", description: "Multimedia"},
		{source: "../../images/installation/en/install-11.jpg", description: "Office"},
		{source: "../../images/installation/en/install-12.jpg", description: "System"},
		{source: "../../images/installation/en/install-13.jpg", description: "Internet"},
		{source: "../../images/installation/en/install-14.jpg", description: "Post-installation actions"},
		{source: "../../images/installation/en/install-15.jpg", description: "Installation summary"}	
	]
}

var installTemplate = Handlebars.templates['install.template']; 
document.getElementById('main-content').innerHTML = installTemplate(installData);
