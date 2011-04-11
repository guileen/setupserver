#! /bin/sh
REPO_PKGS="base-devel git vim zsh mongodb"
# tigervnc gtk-vnc impressive
AUR_LIBS=""
AUR_PKGS=($AUR_LIBS nodejs-git redis-git nodejs-npm)
NPM_PKGS=(express mongoskin redis jade less stylus coffeescript)
# virtualbox_bin ttf-ms-fonts
TARGET_DIR=/tmp/abs
BASE_DIR=/tmp/setupserver
ABS_DIR=$BASE_DIR/abs
F_ARG="-f"
PAC_F_ARG="--noconfirm"
#PAC_F_ARG=""
COWER="`which cower`"
PAC="`which pacman`"

echo '********************'
echo '*  packages *'
echo '********************'
sudo $PAC -Syu $PAC_F_ARG
echo '********************'
echo '* install packages *'
echo '********************'
sudo $PAC -Sy --needed $PAC_F_ARG $REPO_PKGS
echo '********************'
echo '* check packages *'
echo '********************'
sudo $PAC -Sy --needed $PAC_F_ARG $REPO_PKGS

echo '********************'
echo '*  clone  configs  *'
echo '********************'
if [ -d $BASE_DIR ]
then
    cd $BASE_DIR
    git pull
else
    git clone git://github.com/guileen/config.git $BASE_DIR
fi

sh $BASE_DIR/base/setup.sh

if [ ! -f "`which cower`" ] 
then
echo '*****************'
echo '* install cower *'
echo '*****************'
    mkdir -p $TARGET_DIR/cower-git
    cd $TARGET_DIR/cower-git
    wget http://aur.archlinux.org/packages/cower-git/PKGBUILD
    makepkg -ics $PAC_F_ARG
    COWER=/usr/bin/cower
fi

echo "cower is <$COWER>"

echo '************************'
echo '* install aur packages *'
echo '************************'

# download aur packages
function cowerSy {
    pkg=$1
    echo '******************************'
    echo "   install $pkg"
    echo '******************************'
    if [ -d $ABS_DIR/$pkg ]
    then
        cd $ABS_DIR/$pkg
    else
        $COWER -d $F_ARG -t $TARGET_DIR $pkg
        cd $TARGET_DIR/$pkg
    fi
    makepkg -is $PAC_F_ARG
}

for pkg in ${AUR_PKGS[@]}
do
    cowerSy $pkg
done

echo '************************'
echo '* install npm packages *'
echo '************************'
for pkg in ${NPM_PKGS[@]}
do
    echo '**************************'
    echo " npm install $pkg "
    echo '**************************'
    sudo npm install -g $pkg
done

echo '**********************************'
echo '* create symbol link for configs *'
echo '**********************************'
mkdir ~/.config
# cower
ln -s $BASE_DIR/cower ~/.config/cower
