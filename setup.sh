#!/bin/bash

set -xe

home_dir="~"
if [ -n "$1" ]
then
    home_dir=$1
    echo "home dir is ${home_dir}"
else
    echo "using ${home_dir} (default) as the home directory"
fi

sudo install -y zsh
chsh -s $(which zsh)

tar -xvzf d_powerlevel10k.tar.gz 
mv powerlevel10k ${home_dir}

tar -xvzf d_dot_oh-my-zsh.tar.gz
mv .oh-my-zsh ${home_dir}

cp .zshrc ${home_dir}
cp .p10k.zsh ${home_dir}

mkdir ${home_dir}/.fonts
unzip -d Hack Hack.zip
cp Hack/*.ttf ${home_dir}/.fonts
sudo fc-cache -fv
rm -rf Hack

source ${home_dir}/.zshrc

