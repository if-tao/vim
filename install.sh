#!/bin/bash

echo "start Installing......"

# install git vim zsh curl
if which yum >/dev/null; then
    sudo yum install -y git vim zsh curl >/dev/null
elif which apt-get >/dev/null; then
    sudo apt-get install -y git vim zsh curl >/dev/null
fi

if [ -d "~/vim" ]; then
    mv -f ~/vim ~/vim_old
fi
cd ~/ && git clone https://github.com/if-tao/vim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "正在配置vim插件..." > if-tao
echo "请耐心等待..." >> if-tao
vim if-tao -c "PluginInstall" -c "q" -c "q"
rm if-tao

cd ~/.vim/
if [ -d "~/.vim/vimcdoc/vimcdoc-1.9.0/" ]; then
    mkdir ~/.vim/vimcdoc/vimcdoc-1.9.0
tar -zxPf ~/.vim/vimcdoc/vimcdoc-1.9.0.tar.gz ~/.vim/vimcdoc/vimcdoc-1.9.0/
bash ~/.vim/vimcdoc/vimcdoc-1.9.0/vimcdoc.sh
rm -rf ~/.vim/vimcdoc/vimcdoc-1.9.0/

# oh_my_zsh
echo "正在配置oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Install success !!"
