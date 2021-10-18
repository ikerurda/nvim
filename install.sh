#!/bin/bash
y=0
v=0
p=0
n=0

print_usage() {
  printf "usage: install [-yvp]\n\n  y: skip confirmation\n  v: verbose\n  p: install plugins\n"
}

while getopts 'yvp' flag; do
  case $flag in
    y) y=1 ;;
    v) v=1 ;;
    p) p=1 ;;
    *) n=1 ;;
  esac
done

if [[ y && p ]]; then
	print_usage
	exit 1
fi

dir=$HOME/.config/nvim/
if [[ !p ]]; then
	if [[ n ]]; then
		printf "You are about to install a nvim config,"
		read -p "[!] do you wish to continue? (y/n [n]) " cont
		if [[ $cont != "y" ]]; then
			exit 1
		fi
	fi
	((v)) && mkdir -vp ~/.config/nvim 2> /dev/null
	((!v)) && mkdir -p ~/.config/nvim 2> /dev/null
	((v)) && cp -v init.lua $dir
	((!v)) && cp init.lua $dir
	((v)) && cp -vR lua $dir
	((!v)) && cp -R lua $dir
fi

printf "Installing plugins... please wait"
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
