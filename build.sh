echo ""
echo "qvimrc: quick vim configuration"
echo "Author: Fatih Kadir Akın (@fkadev)"
echo ""
echo "Do you want to backup your VIM configuration files? [Y/n]"
read vimbackup
if [ "$vimbackup" = "y" ] ; then
    rm -f ~/.vimrc.bak
    rm -rf ~/.vim.bak
    echo "Moving ~/.vimrc to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
    echo "Moving ~/.vim/ to ~/.vim.bak/"
    cp -R ~/.vim ~/.vim.bak
    rm -rf ~/.vim
    echo "Your current settings are safe now."
else
    echo "Do you want to delete your current settings then? [Y/n]"
    read vimdelete
    if [ "$vimdelete" = "y" ] ; then
        rm -rf ~/.vim*
        echo "Deleted ~/.vimrc and ~/.vim"
    fi
fi
echo "Installing VIM settings..."
echo "Installing Vundle: the vim bundle manager..."
git clone -q https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle > /dev/null
echo "Configuring vimrc..."
curl -k https://raw.github.com/fkadeveloper/qvimrc/master/vimrc 2>/dev/null > ~/.vimrc
echo "Are you a vim geek? (wrtie 'n' to make vim easier.) [y/N]"
read installmswinvim
if [ "$installmswinvim" != "y" ]; then
    echo "Making your VIM easier for you :)"
    echo '' >> ~/.vimrc
    echo "Bundle 'fkadeveloper/mswin.vim'" >> ~/.vimrc
fi
echo "Installing required font: Inconsolata..."
mkdir -p ~/.fonts
curl -k https://raw.github.com/fkadeveloper/qvimrc/master/deps/Inconsolata-dz-Powerline.otf 2>/dev/null > ~/.fonts/Inconsolata-dz-Powerline.otf
echo "Installing required bundles with Vundle."
touch /tmp/qvimrc-readme
echo "Installing QVimrc Bundles." > /tmp/qvimrc-readme
echo "Please wait while we are making your vim beautiful..." >> /tmp/qvimrc-readme
echo "..." >> /tmp/qvimrc-readme
echo "After installation ends, this window will be closed. Be patient please." >> /tmp/qvimrc-readme
vim /tmp/qvimrc-readme +"colorscheme desert" +"setfiletype text" +BundleInstall +qall
echo "Installation complete, now changing color scheme to the Molokai..."
echo '' >> ~/.vimrc
echo 'colorscheme molokai' >> ~/.vimrc
echo "Do you want to edit .vimrc? [Y/n]"
rm /tmp/qvimrc-readme /tmp/build.sh
read vimstart
if [ "$vimstart" != "n" ] ; then
     vim ~/.vimrc
fi
