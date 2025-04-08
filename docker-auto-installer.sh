

#!/bin/bash
 
# Function to display a banner
display_banner() {
  echo "---------------------------------------------------"
  echo "        Docker Troubleshooting and Reinstallation"
  echo "---------------------------------------------------"
  echo
}
 
# Function to uninstall Docker
uninstall_docker() {
  echo "Uninstalling Docker..."
  sudo apt-get purge docker-ce docker-ce-cli containerd.io
  sudo rm -rf /var/lib/docker
  echo "Docker has been uninstalled."
  echo
}
 
# Function to install Docker
install_docker() {
  echo "Installing Docker..."
  sudo apt-get update
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo usermod -aG docker $USER
  echo "Docker has been installed."
  chmod 777 /var/run/docker.sock
  echo
}
 
# Function to install Docker Compose
install_docker_compose() {
  echo "Installing Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "Docker Compose has been installed."
  echo
}
 
# Main script execution
display_banner
 
uninstall_docker
 
install_docker
 
install_docker_compose
 
docker-compose --version
