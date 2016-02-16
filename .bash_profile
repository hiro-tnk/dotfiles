#if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#fi

if [ -f ~/.indiv_var ]; then
    . ~/.indiv_var
else
    export ANACONDA_ROOT="$HOME"
fi

export TESSDATA_PREFIX="/usr/local/Cellar/tesseract/3.02.02/share"
export PYTHONPATH="$ANACONDA_ROOT/py_module:$PYTHONPATH"
# added by Anaconda 2.3.0 installer
export PATH="$ANACONDA_ROOT/anaconda/bin:$PATH"

### Virtualenvwrapper
if [ -f $ANACONDA_ROOT/anaconda/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	source $ANACONDA_ROOT/anaconda/bin/virtualenvwrapper.sh
fi

# for coloring ls results
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# echo "＼(うぇるかむようこそプロファイル)／"
