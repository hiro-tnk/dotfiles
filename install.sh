for f in .??*[^~]
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".git_ignore" ]] && continue

    if [ ! -e ~/$f ]; then
        echo linking: $f
        ln -s ~/dotfiles/$f ~/$f
    fi
done
