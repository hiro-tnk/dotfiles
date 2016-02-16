case ${OSTYPE} in
    darwin*)
        #Mac用の設定

        #MacVim を使用
        export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        export PATH='/Applications/MacVim.app/Contents/MacOS':$PATH

        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi
        ;;
    linux*)
        #Linux用の設定
        ;;
esac
#yukitask
if [ -e $HOME/yukitask ]; then
    export EDITOR=vim
    PATH=~/yukitask:$PATH
    source ~/yukitask/command_aliases
    source ~/yukitask/here_aliases
fi

# command aliases
alias octave='open -a "Octave-cli"'
mkcd () { mkdir $1; cd $1 ;}
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# echo "＼(うぇるかむようこそアールシー)／"
