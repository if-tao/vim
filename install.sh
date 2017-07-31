#!/bin/bash

echo "start Installing......"


# install git vim zsh curl
if which yum >/dev/null; then
    sudo yum install -y git vim zsh curl >/dev/null
elif which apt-get >/dev/null; then
    sudo apt-get install -y git vim zsh curl >/dev/null
fi


if [ -d "~/vim" ]; then
    mv ~/vim ~/vim_old
fi
git clone https://github.com/if-tao/vim.git ~/vim
if [ -d "~/.vim" ]; then
    tar -zcPf ~/.vim_old.tar.gz ~/.vim
fi
if [ -e "~/.vimrc" ]; then
    mv -f ~/.vimrc ~/.vimrc_old
fi
mv -f ~/vim ~/.vim
cp -f ~/.vim/.vimrc ~/.vimrc


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "正在配置vim插件..." > if-tao
echo "请耐心等待..." >> if-tao
vim if-tao -c "PluginInstall" -c "q" -c "q"
rm if-tao


cd ~/.vim/vimcdoc/
tar -zxPf ./vimcdoc-1.9.0.tar.gz
cd ./vimcdoc-1.9.0/
bash ./vimcdoc.sh -i >>/dev/null
rm -rf ~/.vim/vimcdoc/vimcdoc-1.9.0/
cd ~/

# oh_my_zsh
echo "正在配置oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "Install success !!"

