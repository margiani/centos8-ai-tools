echo "==============================================="
echo "Adding required repos"
echo "==============================================="

sudo dnf install epel-release -y
sudo dnf config-manager --set-enabled powertools
sudo dnf config-manager --set-enabled PowerTools
sudo yum-config-manager --add-repo=https://negativo17.org/repos/epel-multimedia.repo
rpm -i https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.1.243-1.x86_64.rpm


echo "==============================================="
echo "Updating packages"
echo "==============================================="

yum update -y

# We need it in case core version changed, so we need to load it
echo "==============================================="
echo "Reboot"
echo "==============================================="

reboot
