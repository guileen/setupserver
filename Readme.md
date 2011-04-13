to setup a base server environment. Arch only. Node only.
Install
========
run as root

    wget https://github.com/guileen/setupserver/raw/master/arch/boot.sh --no-check-certificate && sh boot.sh

Software
========

base
--------
* **zsh**  with vi style
* **git**  with ignores and colors
* **vim**
* **tmux**  run `tmux` and `Ctrl+a` + `c` to open new session
* **cower** to download AUR packages(Arch only)

services
--------
* **mongodb**
* **redis-git** (AUR)
* **gitosis-git** (AUR)

Runtime
========

nodejs
--------
* **nodejs-git** (ABS)
* **nodejs-npm-git** (AUR)
    * **express**
    * **coffeescript**
    * **mongoskin**
    * **redis**
    * **jade**
    * **less**
    * **stylus**
    * **forever**

python
--------
* **python2**
* **python2-distribute**
