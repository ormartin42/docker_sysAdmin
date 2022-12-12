<h1 align="center">
  INCEPTION
</h1>
<br>
<p align="center">
  This project aimed to broaden our knowledge of system administration by using Docker and by virtualizing several Docker images (Mariadb, Wordpress + PHP-FPM, Nginx), creating them in our own personal virtual machine.
</p>

<br>

<h2 align="center">
  Languages / Technologies / Skills
</h2>
<p align="center">
 Dockerfile, Docker-Compose, Docker-Network, Shell, Mariadb/Mysql, Wordpress, PHP-FPM, Nginx, Virtualbox <br><br>
  
 <br><br> For more information on how I coded this project, <a href="https://ormartin42.notion.site/INCEPTION-a169ce3c884043c9a32c907e704e8d6c">click here!</a>
</p>

<h3 align="center">
  How to test the program ?
</h3>
<p align="center">
  * Make sure you have docker and docker-compose installed and that you have sudo rights.<br><br>
  * If you want to access the wordpress site by a specific domain name, add it in the /etc/hosts file and link it to the IP address 127.0.0.1 and don't forget to modify the corresponding lines in the Nginx www.conf file and in the .env file localted in the srcs director<br><br>
  * Then run the following command in your terminal <br><br>
  <i>make && make up</i><br><br>
  * Then you can just go to your browser and connect to wordpress via localhost:443 or your_domain_name<br><br>
    <i>(Please keep in mind that this project was coded on an Ubuntu Virtual Machine and therefore some features may not compile if you are using another OS or don't have sudo rights to your session)</i>
</p>

<h2 align="center">
  Evaluation
</h2>
<p align="center">
  <img src="https://img.shields.io/badge/PASSED%20WITH-100%25-brightgreen" height="25"/>
</p>

<h2 align="center">
  Contact
</h2>
<p align="center">
  <a href="mailto:orianemartinpro@gmail.com">orianemartinpro@gmail.com</a>
</p>

