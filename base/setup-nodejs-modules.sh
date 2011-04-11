#! /bin/sh
NPM_PKGS=(express mongoskin redis jade less stylus coffeescript)

echo '************************'
echo '* install npm packages *'
echo '************************'
for pkg in ${NPM_PKGS[@]}
do
    echo '**************************'
    echo " npm install $pkg "
    echo '**************************'
    npm install -g $pkg
done


