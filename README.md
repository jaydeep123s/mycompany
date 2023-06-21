vi docker.sh file install

sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 


IT-Company-Website

## Overview

The project “IT Company Website” is a responsive website made using HTML, CSS, Bootstrap and JavaScript. As it is responsive, it works well on all devices. The website includes modules like About, Services, Portfolio, Team, Career, Contact and FAQ. Whenever anyone submits the contact form or career form, an email is sent on company’s email id so that they get notified about it and can communicate with that person soon. The website contains all the modules that meet the project requirement and is doing all the work accurately.

## Website Link

Go check this website!!
https://priyansh42.github.io/IT-Company-Website/

##

__NOTE: PHP Mailer won't work on this deployed website. For that you need to download this whole project and run it locally on your PC.__
