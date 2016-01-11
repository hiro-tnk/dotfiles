#if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#fi

export TESSDATA_PREFIX="/usr/local/Cellar/tesseract/3.02.02/share"
export PYTHONPATH="/Users/hiro/py_module:$PYTHONPATH"
# added by Anaconda 2.3.0 installer
export PATH="/Users/hiro/anaconda/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
### Virtualenvwrapper
if [ -f /Users/hiro/anaconda/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	source /Users/hiro/anaconda/bin/virtualenvwrapper.sh
fi

# for coloring ls results
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

echo "＼(うぇるかむようこそプロファイル)／"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
