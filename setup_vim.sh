#!/usr/bin/env zsh

if [[ "$1" == "-h" ]]; then
  echo "$0 [-h] [-r] [-u]"
  echo "    -h    Print this help"
  echo "    -r    Move current configuration out of the way and Reset"
  echo "    -u    Update ~/.vimrc and plugins in ~/.vim/bundle"
  exit
fi

if [[ "$1" == "-u" ]]; then
  mv ~/.vimrc ~/.vimrc_bak
  cp dot.vimrc ~/.vimrc
  pushd ~/.vim/bundle
    for dir in *; do
        pushd $dir
          git pull
        popd
    done
  popd
  exit
fi

if [[ "$1" == "-r" ]]; then
  mv ~/.vim ~/.vim_bak
  mv ~/.vimrc ~/.vimrc_bak
fi

if [[ -e ~/.vimrc || -d ~/.vim ]]; then
  echo "Clear out existing vim configuration (~/.vimrc ~/.vim) first"
  exit -1
fi

cp dot.vimrc ~/.vimrc

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/backups
mkdir ~/.vim/autoload
mkdir ~/.vim/scripts

pushd ~/.vim/autoload
  curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
popd

pushd ~/.vim/scripts
  curl https://raw.github.com/vim-scripts/closetag.vim/master/plugin/closetag.vim > closetag.vim
popd

pushd ~/.vim/bundle
  git clone https://github.com/tpope/vim-sensible.git
  git clone https://github.com/tpope/vim-sleuth.git
  git clone https://github.com/tpope/vim-git.git
  git clone https://github.com/tpope/vim-fugitive.git
  git clone https://github.com/kien/ctrlp.vim.git
  git clone https://github.com/bling/vim-airline
  git clone https://github.com/scrooloose/nerdtree.git
  git clone https://github.com/scrooloose/syntastic.git
  git clone https://github.com/altercation/vim-colors-solarized.git
  git clone https://github.com/oscarh/vimerl.git
  git clone https://github.com/jnurmine/Zenburn.git
  #git clone https://github.com/vim-scripts/searchfold.vim.git
  git clone https://github.com/tpope/vim-markdown.git
  git clone https://github.com/wesgibbs/vim-irblack.git
  git clone https://github.com/gregsexton/gitv.git
  git clone https://github.com/majutsushi/tagbar.git
popd


