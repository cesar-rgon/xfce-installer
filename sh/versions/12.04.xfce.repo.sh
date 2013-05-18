# Instrucciones a ejecutar para agregar repositorios de Terceros para esta versión.
# Cada instrucción debe finalizar por punto y coma ";"
add-apt-repository -y ppa:xubuntu-dev/xfce-4.10 2>&1;
sed -i 's/ main/ main #Repositorio del escritorio Xfce 4.10/g' /etc/apt/sources.list.d/xubuntu-dev-xfce-4_10-precise.list 2>>log.txt;
add-apt-repository -y ppa:geany-dev/ppa 2>&1; 
sed -i 's/ main/ main #Repositorio del editor de texto Geany/g' /etc/apt/sources.list.d/geany-dev-ppa-precise.list 2>>log.txt;
add-apt-repository -y ppa:shimmerproject/ppa 2>&1;
sed -i 's/ main/ main #Repositorio del tema de escritorio Greybird/g' /etc/apt/sources.list.d/shimmerproject-ppa-precise.list 2>>log.txt;
