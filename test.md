##### Índice
> 1. [Características](#1-características)
> 2. [Instalando este proyecto](#2-instalando-este-proyecto)  
>   - [Método 1. Clonar este repositorio](#21-método-1-clonar-este-repositorio)  
>   - [Método 2. Descargar y extraer ficheros](#22-método-2-descargar-y-extraer-ficheros)
> 3. [Executing a script](#3-executing-a-script)  
>   - [Main script](#31-main-script)  
>   - [Application script](#32-application-script)
> 4. [Execution's lifecycle](#4-executions-lifecycle)
> 5. [Extend functionality and customize applications to install](#5-extend-functionality-and-customize-applications-to-install)  
>   - [Understanding project structure](#51-understanding-project-structure)  
>   - [Add new application to a category. Modify or delete an existing one](#52-add-new-application-to-a-category-modify-or-delete-an-existing-one)  
>   - [Add new subscript to install an application](#53-add-new-subscript-to-install-an-application)  
>   - [Add new subscript to add a third-party repository](#54-add-new-subscript-to-add-third-party-repository)  
>   - [Add new subscript to prepare the installation of an application](#55-add-new-subscript-to-prepare-the-installation-of-an-application)
>   - [Add new subscript to install a non-repository application](#56-add-new-subscript-to-install-a-non-repository-application)  
>   - [Add new subscript to setup an application](#57-add-new-subscript-to-setup-an-application)  
>   - [Add new subscript to setup EULA support](#58-add-new-subscript-to-setup-eula-support)
> 6. [Add new translation file](#6-add-new-translation-file)

### 1. Características
* One main script that shows a menu of aplications wich can be selected for installation.
* Alternatively, there is one separate script for each application, so it can be installed by just executing the appropriate script.
* Install official repository applications.
* Add third-party repositories and install related applications when needed.
* Download, extract and install non-repository applications through custom subscripts that extend the main script functionality. It includes several subscripts by default.
* Set up applications after they are installed through custom subscripts.
* Customize your own application list to install and third party repositories to add by just editing some config files (no need to edit main script at all for this purpose).
* EULA support. Install applications automatically with no need of user interaction to accept legal terms of the application.
* The script runs with an interface adapted to the detected enviroment: Dialog for terminal. Zenity for desktop or terminal emulator.
* Installation log file that shows installation steps and errors if they have occurred.
* Multilingual support. Easy to add new translations. For the time being English and Spanish languages are included. The script detects system language and it use the appropiate translation.  
