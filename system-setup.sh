# To update the system packages
sudo apt update
sudo apt upgrade -y


# To install git, docker, & docker-compose
sudo apt install git docker.io docker-compose-v2 -y


# To start & enable docker service
sudo systemctl start docker
sudo systemctl enable docker


# To add the logged in user to docker group (run docker without sudo)
sudo usermod -aG docker $USER
# newgrp docker (run this manually once bash script completes)


# To add jenkins repository to the system for installation
# important: To check if the key for installation has changed visit --> https://pkg.jenkins.io/debian/
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null


# To install java (jdk v21)
sudo apt-get update
sudo apt-get install fontconfig openjdk-21-jre -y


# To install Jenkins
sudo apt install jenkins -y


# To start & enable the jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Testing Jenkins automatic build/deploy