# VulnerableDockerfile
A Vulnerable dockerfile for containerizing a university business.<br>
This docker file consists of docker xml files for ease of use, readily deployable on your own environment. 
Hosting a ftp server a vulnerable ssh service and insecure website.
<br>
<u>Vulnerabilities include:</u>
<ul>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-1000300/">https://www.cvedetails.com/cve/CVE-2018-1000300/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-17456/">https://www.cvedetails.com/cve/CVE-2018-17456/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-15473/">https://www.cvedetails.com/cve/CVE-2018-15473/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2019-9851/">https://www.cvedetails.com/cve/CVE-2019-9851/</a></li>
</ul>

## DISCLAIMER
This is an insecure docker container which should only be used for local environments.<br>
This application is for academic and educational purposes.<br>
However, the system can be used as an example penetration testing techniques.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To configure your own environment will require a virtual machine or a local environment.

Video tutorial of setup:





### Installing

A step by step series of examples to recreate on your own env.

### Install Docker
Update your system packages:
```
sudo apt-get update && upgrade
```
For most downloads follow to the docker download page [DOCKER](https://docs.docker.com/engine/install/).
download via command line run:
```
sudo apt-get install docker
```
Check whether it is installed:
```
sudo systemctl status docker
```
Add your default user to the docker group to execute docker commands without sudo.
```
sudo usermod -aG docker ${USER}
```
For this dockerfile to work requires the addition of docker compose, this is a separate package needing to be pulled using the curl tool.
````
sudo apt-get install curl
````
Download docker-compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
Change file permission to be executable:
```
sudo chmod +x /usr/local/bin/docker-compose
```

### Installation and deployment of the docker file
In order to run the dockerfile first need to pull the repository from github using git

```
sudo apt-get install git
```

Using git to pull the repository:
```
git clone https://github.com/SamP10/VulnerableDockerfile.git
```
When the download has completed change directory to that of vulnContainer within VulnerableDockerfile.
The directory consists of userfiles, dockerfiles, sql script and a docker compose file.
In order to install the insecure website you will need to pull the UniVulnerableWebsite repository using git:
```
user@docker:/directory_path/vulnContainer> git clone https://github.com/SamP10/UniVulnerableWebsite.git
```
###Using docker compose
Docker compose creates all networks and images just through one file. Using the docker-compose command to build the environment follows:
```
user@docker:/directory_path/vulnContainer> docker-compose up -d
```

This will install tools to help communicate to SQL server.
You are then required to indicate to apache to use index.php first, doing so by changing the order in the dir.conf.

```
sudo nano /etc/apache2/mods-enabled/dir.conf
```
Restart apache2 server

```
sudo systemctl restart apache2
```
Look at any packages you wish to install.

```
sudo apt-get install php-cli
```
Voila! Installation of working environment completed

## Running the tests

To check php is running create a file within /var/www/html/ named info.php

```
sudo nano /var/www/html/info.php
<?php
phpinfo();
?>
```
Navigate to the ip address to display the php infomation


## Adding this website

First we need to install GIT to pull the repository

```
sudo apt-get install git
```

Change working directory too /var/www/html/ then git clone the repository to deploy it.

```
sudo git clone https://github.com/SamP10/LaravelBet.git
```

Recommended: installing phpmyadmin to modify data within the database
Follow these guides to get up and running * [phpMyAdmin](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04)
Within a console and travelling to the cloned LaravelBet directory can begin a setup of personal environment.

```
C:\user\> cd destination/LaravelBet
C:\user\destination\LaravelBet> composer create-project
```
After running the above, changing the .env file to match the details of your database, following the .env.example for default purposes should suffice.
Establishing a connection to the database server will allow migration and seeding of the database. The database server must be running to populate the database.
```
C:\user\destination\LaravelBet> php artisan migrate:fresh --seed
```
This will populate the table desired within the .env file.

```
C:user\destination\LaravelBet> php artisan serve
```
Above will start a local server which hosts the website. Simply navigating to the provided IP address will pull up the homepage.
```
C:\user\destination\LaravelBet>php artisan serve
Starting Laravel development server: http://127.0.0.1:8000
[Fri Apr 30 18:01:42 2021] PHP 7.4.8 Development Server (http://127.0.0.1:8000) started
```
## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors
* **Sam Plant** - *Code work* - [Sam Plant](https://github.com/SamP10)

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
