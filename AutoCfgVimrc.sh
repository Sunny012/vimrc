#########################################################################
# File Name: AutoCfgVimrc.sh
# Author: wwz
# mail: wwz5251@outlook.com
# Created Time: 2018年05月11日 星期五 14时32分19秒
#########################################################################
#!/bin/bash

function Install_Vundle(){
    vim_Path=~/.vim/bundle
    if [ ! -d $vim_Path ];then
        sudo mkdir -p $vim_Path;
        echo -e "\033 41;37;5m the .vim path has been created! \033[0m";
    fi
    git clone https://github.com/VundleVim/Vundle.vim.git $vim_Path
}

function Install_Ripgrep(){
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
    sudo dpkg -i ripgrep_0.8.1_amd64.deb
    if [ $? -ne 0 ];then
        echo -e "\033 41;37;ripgrep plugin installed! \033[0m";	
    fi

}

function Config_VimrcFile(){

    if [ ! -f ~/.vimrc ];then
        cp ./vimrc ~/vimrc
    fi
    sudo mv ~/vimrc ~/.vimrc
}

##### start here#######
Install_Vundle
Config_VimrcFile
vim

