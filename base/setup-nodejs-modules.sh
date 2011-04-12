#! /bin/sh
NPM_PKGS=(express mongodb mongoskin redis jade stylus coffee-script)

echo '************************'
echo '* install npm packages *'
echo '************************'
for pkg in ${NPM_PKGS[@]}
do
    echo '**************************'
    echo " npm update $pkg "
    echo '**************************'
    npm install -g $pkg
done
