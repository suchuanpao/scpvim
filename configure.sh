#!/bin/bash
#if which apt-get > /dev/null; then
#	sudo apt-get install -y vim
#elif which yum > /dev/null; then
#	sudo yum install -y vim
#fi

if [ "$SUCHP_HOME" = "" ]; then
	SUCHP_HOME=~/suchp_familly
fi
SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github
SCP_YUM=$SCP_PREFIX/yum
SCP_YUM_ENV=$SCP_YUM/env
VIMRUNTIMEDIR=/usr/local/share/vim/vim80
SCP_YUM_ENV_VIM=$SCP_YUM_ENV/vim
SCP_UPDATE_VIM() {
	#command -v git
	#if [ $? -ne 0]; then
	#	echo "excute: sudo apt-get install git"
	#	sudo apt-get install git
	#	if [ $? -ne 0 ]; then
	#		exit 1
	#	fi
	#fi

	sudo apt-get install git
	SCP_VIMGITHUB=$SCP_GITHUB/vim
	if [ -d $SCP_VIMGITHUB ];then
		cd $SCP_VIMGITHUB
		git pull
	else
		git clone https://github.com/vim/vim.git $SCP_VIMGITHUB
	fi
}
SCP_INSTALL_VIM(){
	sudo apt-get autoremove vim

	SCP_UPDATE_VIM

	SCP_UPDATE_BUNDLE

	./configure \
	   --enable-perlinterp \
	   --enable-python3interp \
	   --enable-pythoninterp \
	   --enable-rubyinterp \
	   --enable-cscope \
	   --enable-gui=auto \
	   --enable-gtk2-check \
	   --with-features=huge \
	   --enable-multibyte \
	   --with-x \
	   --with-compiledby="asd" \
	   --with-python3 \
	   --with-python2 \
	   --prefix=/usr

	make VIMRUNTIMEDIR=$VIMRUNTIMEDIR
	sudo make install
}

SCP_UPDATE_BUNDLE()
{
	if [ -d ~/.vim/bundle/Vundle ];then
		cd ~/.vim/bundle/Vundle
		git pull
	else
		git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle
	fi
	vim -c "BundleInstall" -c "qall"
}

SCP_INSTALL_PLUGIN_YOUCOMPLETE()
{
	sudo apt-get install clang
	sudo apt-get install libboost-all-dev
}

SCP_CONFIG_VIM(){
	PATH_VIMRC=~/
	rm -f $PATH_VIMRC/.vimrc
	echo "#### ln -s $SCP_YUM_ENV/vim/vimrc ~/.vimrc"
	ln -s $SCP_YUM_ENV_VIM/vimrc $PATH_VIMRC/.vimrc

	#VIMRUNTIMEDIR= $(`vim --version | grep '\$VIM' | awk 'NR==2' |cut -d '"' -f 2`)
	FILE_SOLARIZED_VIM=$VIMRUNTIMEDIR/colors/solarized.vim
	sudo rm -rf $FILE_SOLARIZED_VIM
	echo "sudo ln -s $SCP_YUM_ENV_VIM/solarized.vim $FILE_SOLARIZED_VIM"
	sudo ln -s $SCP_YUM_ENV_VIM/solarized.vim $FILE_SOLARIZED_VIM
}
SCP_CONFIG_VIM
