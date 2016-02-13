for f in .??*[^~]
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".git_ignore" ]] && continue

    if [ -e $HOME/$f ]; then
      if [ -f $f ]; then
        echo making .dot: $f
        ln -s $HOME/dotfiles/$f ~/$f.dot
      else
        echo the directory link already exists: $f
      fi
    else
      echo linking: $f
      ln -s $HOME/dotfiles/$f ~/$f
    fi
done
