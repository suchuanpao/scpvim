#!/bin/bash
#if which apt-get > /dev/null; then
#	sudo apt-get install -y vim
#elif which yum > /dev/null; then
#	sudo yum install -y vim
#fi

SCP_CREATE_DIR(){
	DIR=$1
	if [ "$DIR" == "" ];then
		exit 1
	fi  
	mkdir -p $DIR
}

if [ "$SUCHP_HOME" = "" ]; then
	SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_CREATE_DIR $SCP_PREFIX
SCP_YUM=$SCP_PREFIX/yum
SCP_CREATE_DIR $SCP_YUM
SCP_YUM_ENV=$SCP_YUM/env
SCP_CREATE_DIR $SCP_YUM_ENV
SCP_YUM_SCRIPTS=$SCP_YUM/scripts
SCP_CREATE_DIR $SCP_YUM_SCRIPTS
SCP_YUM_CODE=$SCP_YUM/code
SCP_CREATE_DIR $SCP_YUM_CODE
SCP_GITHUB=$SCP_PREFIX/github
SCP_CREATE_DIR $SCP_GITHUB
SCP_TOOLS=$SCP_PREFIX/tools
SCP_CREATE_DIR $SCP_TOOLS

VIMRUNTIMEDIR=/usr/share/vim/vim80
SCP_YUM_ENV_VIM=$SCP_YUM_ENV/vim
SCP_PLUGIN=~/.vim/bundle
PATH_GITHUB_VIM=$SCP_GITHUB/vim

SCP_UPDATE_VIM_SOURCE_CODE() {
	sudo apt-get install git
	if [ -d $PATH_GITHUB_VIM ];then
		cd $PATH_GITHUB_VIM
		git pull
	else
		git clone https://github.com/vim/vim.git $PATH_GITHUB_VIM
	fi
}

SCP_INSTALL_VIM(){

	sudo apt-get autoremove vim

	#SCP_UPDATE_VIM_SOURCE_CODE
	# dependon libncurses5-dev
	sudo apt-get install libncurses5-dev
	# clip_board dependon libgtk2.0-dev, libgnome2-dev, libxt-dev, libx11-dev
	sudo apt-get install libgtk2.0-dev libgnome2-dev libxt-dev libx11-dev
	# mkdir by self
	cd $PATH_GITHUB_VIM

	# 只能有一个
	#--enable-pythoninterp \
	#--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	#--enable-python3interp \
	#--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	./configure \
	   --with-features=huge \
	   --enable-multibyte \
	   --enable-perlinterp \
	   --enable-pythoninterp=yes \
	   --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	   --enable-python3interp \
	   --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	   --enable-rubyinterp \
	   --enable-luainterp \
	   --enable-cscope \
	   --enable-gui=auto=gtk \
	   --enable-gtk2-check=yes \
	   --with-features=huge \
	   --with-x \
	   --enable-multibyte \
	   --with-compiledby="asd" \
	   --prefix=/usr
	echo "make clean;make VIMRUNTIMEDIR=$VIMRUNTIMEDIR"
	make clean;make VIMRUNTIMEDIR=$VIMRUNTIMEDIR
	sudo make install
}

SCP_INSTALL_BUNDLE()
{
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "vim -c \"PluginInstall\" -c \"qall\""
	vim -c "PluginInstall" -c "qall"
}

SCP_CONFIG_VIM(){
	PATH_VIMRC=~/
	echo "#### ln -sf $SCP_YUM_ENV_VIM/vimrc ~/.vimrc"
	ln -sf $SCP_YUM_ENV_VIM/vimrc $PATH_VIMRC/.vimrc

	#VIMRUNTIMEDIR= $(`vim --version | grep '\$VIM' | awk 'NR==2' |cut -d '"' -f 2`)
	FILE_SOLARIZED_VIM=$VIMRUNTIMEDIR/colors/solarized.vim
	echo "sudo ln -s $SCP_YUM_ENV_VIM/solarized.vim $FILE_SOLARIZED_VIM"
	sudo ln -sf $SCP_YUM_ENV_VIM/solarized.vim $FILE_SOLARIZED_VIM
}
SCP_INSTALL_VIM
SCP_INSTALL_BUNDLE
SCP_CONFIG_VIM
