#!/usr/bin/env bash

# Configure environment
mkdir -p /mnt/kai/work/tool
mkdir -p /mnt/kai/work/code
cd /mnt/kai/work/tool
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
source ~/.bashrc
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
bash cuda_10.1.243_418.87.00_linux.run
wget -O cudnn-10.1-linux-x64-v7.6.3.30.tgz https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/7.6.4.38/Production/10.1_20190923/cudnn-10.1-linux-x64-v7.6.4.38.tgz?n2Sp_q9oX45_KOYWtVwW9VFyf3hwnfEnjS0I8oJgJx2MGE1_FDAh2ABvrHUkkVZTQbHpmD5qiLpLjPEpyhZAXI1ZPexsjq3oM2B45tKiXvMjzU-Ec1_9njxzfhSVTbxOW36DxwzO4JzMr21awj_Xd3E3_Rk03TVHxyIHp1SfZWIeBeiZE9waBRdF2nDYAwrfqyESJsrQxtpBKEV8_oaMvEUyJX66ih-sJQ
tar xvf cudnn-10.1-linux-x64-v7.6.3.30.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# Clone code
cd /mnt/kai/work/code
git clone --recursive https://github.com/calmevtime/dctCls

# Install Pytorch
conda install pytorch torchvision cudatoolkit=10.1 -c pytorch

# Install required packages
cd dctCls
pip install -r requirements.txt

#Install libjpeg-turbo
bash install_libjpegturbo.sh

ln -s /mnt/dataset/ILSVRC2012 /ILSVRC2012