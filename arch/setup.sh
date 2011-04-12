#! /bin/sh
REPO_PKGS="base-devel vim zsh tmux openssh mongodb"
# tigervnc gtk-vnc impressive
AUR_LIBS=""
AUR_PKGS=($AUR_LIBS nodejs-git redis-git nodejs-npm)

# virtualbox_bin ttf-ms-fonts
TARGET_DIR=/opt/abs
BASE_DIR=/opt/setupserver
ABS_DIR=$BASE_DIR/arch/abs
F_ARG="-f"
PAC_F_ARG="--noconfirm"
#PAC_F_ARG=""
COWER="`which cower`"
PAC="`which pacman`"

echo '********************'
echo '*  packages *'
echo '********************'
$PAC -Syu $PAC_F_ARG
echo '********************'
echo '* install packages *'
echo '********************'
$PAC -Sy --needed $PAC_F_ARG $REPO_PKGS
echo '********************'
echo '* check packages *'
echo '********************'
$PAC -Sy --needed $PAC_F_ARG $REPO_PKGS

echo '********************'
echo '*  clone  configs  *'
echo '********************'
if [ -d $BASE_DIR ]
then
    cd $BASE_DIR
    git pull
else
    git clone git://github.com/guileen/setupserver.git $BASE_DIR
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
    makepkg -is --asroot $PAC_F_ARG
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
    makepkg -is --asroot $PAC_F_ARG
}

for pkg in ${AUR_PKGS[@]}
do
    cowerSy $pkg
done

sh $BASE_DIR/base/setup-nodejs-modules.sh
