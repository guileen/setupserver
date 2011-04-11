#! /bin/sh
echo '*********************'
echo '* copy base configs *'
echo '*********************'
BASE_DIR=/tmp/setupserver
# sh rc
cp -f $BASE_DIR/base/bashrc ~/.bashrc
cp -f $BASE_DIR/base/zshrc ~/.zshrc
cp -f $BASE_DIR/base/alias ~/.alias
cp -f $BASE_DIR/base/tmux.conf ~/.tmux.conf

# version control
cp -f $BASE_DIR/base/gitconfig ~/.gitconfig
cp -f $BASE_DIR/base/gitignore ~/.gitignore

# vim
cp -f $BASE_DIR/base/vimrc ~/.vimrc
#ln -s $BASE_DIR/base/vim ~/.vim
#mkdir $BASE_DIR/base/vim/autoload
#ln -s $BASE_DIR/base/tools/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
