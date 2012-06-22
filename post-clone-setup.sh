git submodule init
git submodule update
mkdir autoload
ln -s ../vim-pathogen/autoload/pathogen.vim autoload
ln -s $PWD/vimrc ~/.vimrc

