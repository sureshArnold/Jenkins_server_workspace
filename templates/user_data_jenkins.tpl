# Update the system
sudo dnf update -y

# Install Java (OpenJDK 21)
sudo dnf install java-21-openjdk -y

# Verify Java installation
java -version

# Import the Jenkins repository GPG key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Add the Jenkins repository
# Add Jenkins repo
sudo dnf install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins repository key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key


sudo dnf clean all
sudo dnf install -y Jenkins

sudo systemctl enable --now Jenkins

sudo systemctl start Jenkins

sudo systemctl status Jenkins


sudo dnf install firewalld -y
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

