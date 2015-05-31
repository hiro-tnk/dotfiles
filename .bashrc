export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export PATH='/Applications/MacVim.app/Contents/MacOS':$PATH
#yukitask
export EDITOR=vim
PATH=~/yukitask:$PATH
source ~/yukitask/command_aliases
source ~/yukitask/here_aliases

# command aliases
alias octave='open -a "Octave-cli"'

echo "＼(うぇるかむようこそアールシー)／"
