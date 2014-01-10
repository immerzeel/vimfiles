ln -s ~/vimfiles ~/.vim
ln -s ~/vimfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git ~/vimfiles/bundle/vundle
vim -c "BundleUpdate"

# TODO make it work on Windows.
# mkdir ~/Library/Vim
# mkdir ~/Library/Vim/{swap,undo,backup}
