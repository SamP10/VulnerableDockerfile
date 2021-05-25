# Vulnerable Dockerfile
A vulnerable Dockerfile for containerizing a university business.<br>
This Dockerfile consists of Docker XML files for ease of use, readily deployable on your own environment. 
Hosting an FTP server, a vulnerable SSH service and an insecure website.
<br>
<u>Vulnerabilities include:</u>
<ul>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-1000300/">https://www.cvedetails.com/cve/CVE-2018-1000300/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-17456/">https://www.cvedetails.com/cve/CVE-2018-17456/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2018-15473/">https://www.cvedetails.com/cve/CVE-2018-15473/</a></li>
<li><a href="https://www.cvedetails.com/cve/CVE-2019-9851/">https://www.cvedetails.com/cve/CVE-2019-9851/</a></li>
</ul>

## DISCLAIMER
This is an insecure Docker container which should only be used for local environments.<br>
This application is for academic and educational purposes.<br>

## Video Setup

https://user-images.githubusercontent.com/72082567/118373171-55e56a00-b5ad-11eb-8eb9-df3612b140e0.mp4



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To configure your own environment will require a virtual machine or a local environment.

### Installing

A step-by-step series of examples to recreate on your own env.

### Install Docker
Update your system packages:
```
sudo apt-get update && upgrade
```
For most downloads follow to the docker download page [DOCKER](https://docs.docker.com/engine/install/).
To download Docker via the command line, run:
```
sudo apt-get install docker
```
Check whether it is installed:
```
sudo systemctl status docker
```
Add your default user to the Docker group to execute Docker commands without sudo.
```
sudo usermod -aG docker ${USER}
```
This Dockerfile requires the addition of Docker Compose, a separate package which needs to be pulled using the curl tool.
````
sudo apt-get install curl
````
Download Docker Compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
Change file permission to be executable:
```
sudo chmod +x /usr/local/bin/docker-compose
```

### Installation and deployment of the Dockerfile
In order to run the Dockerfile, first pull the repository from GitHub using Git:

```
sudo apt-get install git
```

Use Git to pull the repository:
```
git clone https://github.com/SamP10/VulnerableDockerfile.git
```
When the download has completed, change directory to that of vulnContainer within VulnerableDockerfile.
<br>The directory consists of userfiles, dockerfiles, sql script and a docker compose file.
```
cd VulnerableDockerfile/vulnContainer
```
<br>In order to install the insecure website, you will need to pull the UniVulnerableWebsite repository using git:
```
git clone https://github.com/SamP10/UniVulnerableWebsite.git
```
### Using Docker Compose
Docker Compose creates all networks and images just through one file. Use the docker-compose command to build the environment as follows:
```
docker-compose up -d
```
This will create 3 images: httpd apache server, mariadb server and the vulnerable container.
<br>It will copy the sql file into the tmp. In order to import the database for the webserver, you must interact with the live container with the following command:

```
docker exec -it container_id /bin/bash
```

Once interacting with the container, simply running the next few commands should import the SQL database which the website uses.

```
user@container:>mysql -u root -p
mysql> CREATE DATABASE university;
mysql> exit;
user@container:>cd /tmp
user@container:/tmp>mysql -u root -p university<uni.sql
```
This will preserve in a volume created and only needs setting up once.
To power down the containers, use:
```
docker compose down
```
Navigate to *ipaddress:8080/login.php*<br>
Voila! Installation of working environment completed.


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors
* **Sam Plant** - *Code work* - [Sam Plant](https://github.com/SamP10)

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* Hat tip to anyone whose code was used.
