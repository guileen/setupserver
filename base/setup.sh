#! /bin/sh
echo '*********************'
echo '* copy base configs *'
echo '*********************'
BASE_DIR=/tmp/setupserver/
# sh rc
cp -f $BASE_DIR/bashrc ~/.bashrc
cp -f $BASE_DIR/zshrc ~/.zshrc

# version control
cp -f $BASE_DIR/gitconfig ~/.gitconfig
cp -f $BASE_DIR/gitignore ~/.gitignore

# vim
cp -f $BASE_DIR/vimrc ~/.vimrc
#ln -s $BASE_DIR/vim ~/.vim
#mkdir $BASE_DIR/vim/autoload
#ln -s $BASE_DIR/tools/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
