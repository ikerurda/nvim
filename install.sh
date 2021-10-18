#!/bin/bash

if [[ $1 = "-y" ]]; then
	dir=$HOME/.config/nvim/
	mkdir -vp ~/.config/nvim 2> /dev/null
	cp -v init.lua $dir
	cp -vR lua $dir
else
	echo "You are about to install a nvim config,"
	read -p "[!] do you wish to continue? (y/n [n]) " cont
	if [[ $cont != "y" ]]; then
		exit
	fi
	dir=$HOME/.config/nvim/
	mkdir -vp ~/.config/nvim 2> /dev/null
	cp -vi init.lua $dir
	cp -vRi lua $dir
fi

echo "Installing plugins... please wait"
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
