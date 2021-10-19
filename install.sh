#!/bin/bash
print_usage() {
	printf "usage: install [-yvpu]\n\n  y: skip confirmation\n  v: verbose\n  p: only install plugins\n  u: uninstall configs\n"
}

while getopts 'yvpu' flag; do
	case $flag in
		y) y=1 ;;
		v) v=1 ;;
		p) p=1 ;;
		u) u=1 ;;
		*) [[ $@ != "" ]] && print_usage && exit 1
	esac
done

if [[ -n $p && -n $u ]]; then
	print_usage
	exit 1
elif [[ -n $u ]]; then
	if [[ -z $y ]]; then
		echo "You are about to uninstall nvim configs,"
		read -p "[!] do you wish to continue? (y/n [n]) " cont
		if [[ $cont != "y" ]]; then
			exit 1
		fi
	fi
	if [[ -n $v ]]; then
		rm -vrf ~/.cache/nvim
		rm -vrf ~/.local/share/nvim
		rm -vrf ~/.config/nvim
	else
		rm -rf ~/.cache/nvim
		rm -rf ~/.local/share/nvim
		rm -rf ~/.config/nvim
	fi
	exit 0
fi

if [[ -z $p ]]; then
	if [[ -z $y ]]; then
		echo "You are about to install a nvim config,"
		read -p "[!] do you wish to continue? (y/n [n]) " cont
		if [[ $cont != "y" ]]; then
			exit 1
		fi
	fi
	if [[ -n $v ]]; then
		mkdir -vp ~/.config/nvim 2> /dev/null
		cp -v init.lua ~/.config/nvim/
		cp -vR lua ~/.config/nvim/
	else
		mkdir -p ~/.config/nvim 2> /dev/null
		cp init.lua ~/.config/nvim/
		cp -R lua ~/.config/nvim/
	fi
fi

nvim -c 'PackerSync'
