BASE_DIR=/opt/setupserver
pacman -Sy --needed --noconfirm git
if [ -d $BASE_DIR ]
then
    cd $BASE_DIR
    git pull
else
    git clone git://github.com/guileen/config.git $BASE_DIR
fi
$BASE_DIR/arch/setup.sh
