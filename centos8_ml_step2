echo "==============================================="
echo "Installing kernel packages"
echo "==============================================="

dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms -y


echo "==============================================="
echo "Installing CUDA packages"
echo "==============================================="

dnf install cuda-*-10-2.x86_64 libcublas-10-2.x86_64 cuda-cudart-dev-10-1.x86_64 cuda-cudnn-7.*  -y
dkms auitoinstall

echo "==============================================="
echo "Installing Python packages"
echo "==============================================="

dnf install python36.x86_64 python36-devel.x86_64 python36-debug.x86_64 virtualenv -y
python3 -m pip install --upgrade pip wheel setuptools six

echo "==============================================="
echo "Installing Media and support packages"
echo "==============================================="

sudo dnf config-manager --set-enabled powertools
sudo dnf config-manager --set-enabled PowerTools
yum install curl wget gnupg ffmpeg git gcc gobject-introspection.x86_64 cairo-devel gobject-introspection-devel cairo-gobject-devel --nobest -y


echo "==============================================="
echo "Installing JL"
echo "==============================================="

python3 -m pip install jupyter jupyter-client jupyter-console jupyter-core jupyterlab jupyterlab-server notebook

echo "==============================================="
echo "Configuring JL"
echo "==============================================="

useradd -m jupyter

echo "c.NotebookApp.allow_password_change = True" > /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_remote_access = True" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_root = True" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = 'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$n6x317Bu7lJMp47WpIBlLg\$a7EwcajGcFDxy57vyhOCmQ'" >> /home/jupyter/jupyter_notebook_config.py
echo "# ikieg2wahmohtahF" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password_required = True" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8080" >> /home/jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.notebook_dir = '/home/jupyter/'" >> /home/jupyter/jupyter_notebook_config.py

echo "[Unit]" >  /etc/systemd/system/jupyter.service
echo "Description=Jupyter Lab" >>  /etc/systemd/system/jupyter.service
echo "After=syslog.target network.target" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "[Service]" >>  /etc/systemd/system/jupyter.service
echo "User=jupyter" >>  /etc/systemd/system/jupyter.service
echo 'Environment="PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/anaconda3/bin"' >>  /etc/systemd/system/jupyter.service
echo "ExecStart=/usr/local/bin/jupyter lab --config=/home/jupyter/jupyter_notebook_config.py" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "Restart=on-failure" >>  /etc/systemd/system/jupyter.service
echo "RestartSec=10" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "[Install]" >>  /etc/systemd/system/jupyter.service
echo "WantedBy=multi-user.target"  >>  /etc/systemd/system/jupyter.service

chown jupyter:jupyter /home/jupyter/jupyter_notebook_config.py

sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service

echo "==============================================="
echo "Installing Python ML modules"
echo "==============================================="

python3 -m pip install catboost \
Cython \
fastai \
ipykernel \
ipython \
ipython-genutils \
ipywidgets \
Keras \
Keras-Preprocessing \
matplotlib \
nltk \
numpy \
nvidia-ml-py3 \
srsly \
sympy \
opencv-python \
pandas \
scipy \
scikit-learn \
tensorboard \
tensorboard-plugin-wit \
tensorboardX \
tensorflow-estimator \
tensorflow-gpu==2.3 \
scipy \
torch \
torchvision \
lightgbm \
xgboost

echo "==============================================="
echo "Installing Prometheus exporters"
echo "==============================================="

mkdir -p /opt/node_exporter
mkdir -p /opt/gpu_exporter
yum install go -y

curl -LO "https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz"
tar -xvzf ~/node_exporter-1.0.1.linux-amd64.tar.gz && cp ~/node_exporter-1.0.1.linux-amd64/node_exporter /opt/node_exporter


go get github.com/mindprince/nvidia_gpu_prometheus_exporter
cp ~/go/bin/nvidia_gpu_prometheus_exporter /opt/gpu_exporter/nvidia_gpu_prometheus_exporter

echo "[Unit]" > /etc/systemd/system/node_exporter.service
echo "Description=Node Exporter" >> /etc/systemd/system/node_exporter.service
echo "[Service]" >> /etc/systemd/system/node_exporter.service
echo "ExecStart=/opt/node_exporter/node_exporter" >> /etc/systemd/system/node_exporter.service
echo "[Install]" >> /etc/systemd/system/node_exporter.service
echo "WantedBy=default.target" >> /etc/systemd/system/node_exporter.service

echo "[Unit]" > /etc/systemd/system/gpu_exporter.service
echo "Description=Node Exporter" >> /etc/systemd/system/gpu_exporter.service
echo "[Service]" >> /etc/systemd/system/gpu_exporter.service
echo "ExecStart=/opt/gpu_exporter/nvidia_gpu_prometheus_exporter" >> /etc/systemd/system/gpu_exporter.service
echo "[Install]" >> /etc/systemd/system/gpu_exporter.service
echo "WantedBy=default.target" >> /etc/systemd/system/gpu_exporter.service

sudo systemctl daemon-reload
sudo systemctl enable node_exporter.service
sudo systemctl enable gpu_exporter.service
sudo systemctl start node_exporter.service
sudo systemctl start gpu_exporter.service
