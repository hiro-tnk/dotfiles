#if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#fi

export TESSDATA_PREFIX="/usr/local/Cellar/tesseract/3.02.02/share"
export PYTHONPATH="$HOME/py_module:$PYTHONPATH"
# added by Anaconda 2.3.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

### Virtualenvwrapper
if [ -f $HOME/anaconda/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	source $HOME/anaconda/bin/virtualenvwrapper.sh
fi

# for coloring ls results
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# echo "＼(うぇるかむようこそプロファイル)／"
