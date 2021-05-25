#!/usr/bin/env bash

echo "Installing custom packages..."

alias python='/usr/bin/python3'

wget https://github.com/shenwei356/seqkit/releases/download/v0.15.0/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz
sudo cp seqkit /usr/local/bin/

sudo apt-get -y update

git clone https://github.com/samtools/htslib.git
cd htslib/
git submodule update --init --recursive
autoreconf -i
./configure
make
sudo make install

cd ..
wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2
tar -xvjf samtools-1.12.tar.bz2 
cd samtools-1.12/
./configure #--prefix=/usr/local/bin/
make
sudo make install
samtools

git clone https://github.com/lh3/bwa.git
cd bwa; make
sudo cp bwa /usr/local/bin/
bwa

#cd /usr/local
#wget https://github.com/ldc-developers/ldc/releases/download/v$ver/ldc2-1.7.0-linux-x86_64.tar.xz
#tar xvJf ldc2-1.7.0-linux-x86_64.tar.xz
#export PATH=/usr/local/ldc2-1.7.0-linux-x86_64/bin:$PATH
#export LIBRARY_PATH=/usr/local/ldc2-1.7.0-linux-x86_64/lib
#cd

#apt-get install -y curl
#curl -fsS https://dlang.org/install.sh | bash -s ldc

#git clone --recursive https://github.com/biod/sambamba.git
#cd sambamba
#make
wget https://github.com/biod/sambamba/releases/download/v0.8.0/sambamba-0.8.0-linux-amd64-static.gz
gunzip sambamba-0.8.0-linux-amd64-static.gz
chmod u+x  sambamba-0.8.0-linux-amd64-static
sudo cp sambamba-0.8.0-linux-amd64-static /usr/local/bin/
sudo chmod +x /usr/local/bin/sambamba-0.8.0-linux-amd64-static
#sudo apt install -y sambamba
sambamba-0.8.0-linux-amd64-static

sudo apt-get -y update

echo "finished custom installation."
