sudo dnf install epel-release -y
sudo yum config-manager --set-enabled PowerTools
sudo yum-config-manager --add-repo=https://negativo17.org/repos/epel-multimedia.repo
rpm -i https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.1.243-1.x86_64.rpm



dnf groupinstall "Development Tools" -y

dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms cuda-*-10-2.x86_64 libcublas-10-2.x86_64 cuda-cudart-dev-10-1.x86_64 cuda-cudnn.x86_64  -y

packages="
python36.x86_64
python36-devel.x86_64
python36-debug.x86_64
virtualenv
ffmpeg
curl
wget 
gnupg 
git 
gcc 
glib*
gobject-introspection.x86_64
cairo-devel
gobject-introspection-devel
cairo-gobject-devel
"



pip_packages="absl-py==0.10.0
anaconda==0.0.1.1
argon2-cffi==20.1.0
astunparse==1.6.3
attrs==19.3.0
backcall==0.2.0
beautifulsoup4==4.9.1
bleach==3.1.5
blis==0.4.1
Bottleneck==1.3.2
cachetools==4.1.1
catalogue==1.0.0
catboost==0.24
certifi==2020.6.20
cffi==1.14.2
chardet==3.0.4
click==7.1.2
cycler==0.10.0
cymem==2.0.3
Cython==0.29.21
dataclasses==0.7
decorator==4.4.2
defusedxml==0.6.0
distro-info
entrypoints==0.3
fastai==1.0.51
fastprogress==0.2.6
ffmpeg==1.4
ffmpeg-python==0.1.17
freetype-py==2.2.0
future==0.18.2
gast==0.3.3
google-auth==1.20.1
google-auth-oauthlib==0.4.1
google-pasta==0.2.0
graphviz==0.14.1
grpcio==1.31.0
h5py==2.10.0
idna==2.10
imageio==2.9.0
imageio-ffmpeg==0.4.2
importlib-metadata==1.7.0
ipykernel==5.3.4
ipython==7.16.1
ipython-genutils==0.2.0
ipywidgets==7.5.1
jedi==0.17.2
Jinja2==2.11.2
joblib==0.16.0
json5==0.9.5
jsonschema==3.2.0
jupyter==1.0.0
jupyter-client==6.1.6
jupyter-console==6.1.0
jupyter-core==4.6.3
jupyterlab==2.2.5
jupyterlab-server==1.2.0
Keras==2.4.3
Keras-Preprocessing==1.1.2
kiwisolver==1.2.0
lightgbm==2.3.1
Markdown==3.2.2
MarkupSafe==1.1.1
matplotlib==3.3.1
mistune==0.8.4
moviepy==1.0.3
mpmath==1.1.0
murmurhash==1.0.2
nbconvert==5.6.1
nbformat==5.0.7
netifaces==0.10.4
networkx==2.4
nltk==3.5
nose==1.3.7
notebook==6.1.3
numexpr==2.7.1
numpy==1.18.5
nvidia-ml-py3==7.352.0
oauthlib==3.1.0
opencv-python==4.4.0.42
opt-einsum==3.3.0
packaging==20.4
pandas==1.1.0
pandocfilters==1.4.2
parso==0.7.1
pexpect==4.8.0
pickleshare==0.7.5
Pillow==7.2.0
pip
plac==1.1.3
plotly==4.9.0
preshed==3.0.2
proglog==0.1.9
prometheus-client==0.8.0
prompt-toolkit==3.0.6
protobuf==3.13.0
ptyprocess==0.6.0
pyasn1==0.4.8
pyasn1-modules==0.2.8
pycparser==2.20
Pygments==2.6.1
pygobject==3.38.0
pyparsing==2.4.7
pyrsistent==0.16.0
python-dateutil==2.7.3
pytz==2020.1
PyYAML==3.12
pyzmq==19.0.2
qtconsole==4.7.6
QtPy==1.9.0
regex==2020.7.14
requests==2.24.0
requests-oauthlib==1.3.0
retrying==1.3.3
rsa==4.6
scikit-learn==0.23.2
scipy==1.4.1
Send2Trash==1.5.0
setuptools
six
soupsieve==2.0.1
spacy==2.3.2
srsly==1.0.2
sympy==1.6.2
tensorboard==2.3.0
tensorboard-plugin-wit==1.7.0
tensorboardX==1.6
tensorflow-estimator==2.3.0
tensorflow-gpu==2.3.0
termcolor==1.1.0
terminado==0.8.3
testpath==0.4.4
thinc==7.4.1
threadpoolctl==2.1.0
torch==1.6.0
torchvision==0.7.0
tornado==6.0.4
tqdm==4.48.2
traitlets==4.3.3
transforms3d==0.3.1
typing==3.7.4.3
urllib3==1.25.10
vispy==0.6.4
wasabi==0.7.1
wcwidth==0.2.5
webencodings==0.5.1
Werkzeug==1.0.1
wheel
widgetsnbextension==3.5.1
wrapt==1.12.1
xgboost==1.1.1
youtube-dl==2020.7.28
zipp==3.1.0"

sudo dnf install $packages -y

python3 -m pip install --upgrade pip wheel setuptools six
python3 -m pip install $pip_packages



mkdir /root/.jupyter/

echo "c.NotebookApp.allow_password_change = True" > /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = 'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$n6x317Bu7lJMp47WpIBlLg\$a7EwcajGcFDxy57vyhOCmQ'" >> /root/.jupyter/jupyter_notebook_config.py
echo "# ikieg2wahmohtahF" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password_required = True" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> /root/.jupyter/jupyter_notebook_config.py



echo "[Unit]" >  /etc/systemd/system/jupyter.service
echo "Description=Jupyter Lab" >>  /etc/systemd/system/jupyter.service
echo "After=syslog.target network.target" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "[Service]" >>  /etc/systemd/system/jupyter.service
echo "User=root" >>  /etc/systemd/system/jupyter.service
echo 'Environment="PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/anaconda3/bin"' >>  /etc/systemd/system/jupyter.service
echo "ExecStart=/usr/local/bin/jupyter lab" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "Restart=on-failure" >>  /etc/systemd/system/jupyter.service
echo "RestartSec=10" >>  /etc/systemd/system/jupyter.service
echo "" >>  /etc/systemd/system/jupyter.service
echo "[Install]" >>  /etc/systemd/system/jupyter.service
echo "WantedBy=multi-user.target"  >>  /etc/systemd/system/jupyter.service

sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service
