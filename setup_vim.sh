#!/usr/bin/env bash

if [[ "$1" == "-h" ]]; then
  echo "$0 [-h] [-r] [-u]"
  echo "    -h    Print this help"
  echo "    -r    Move current configuration out of the way and Reset"
  echo "    -u    Update plugins in ~/.vim/bundle"
  exit
fi

if [[ "$1" == "-u" ]]; then
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
fi

if [[ -d ~/.vim ]]; then
  read -p "Delete existing vim configuration dir (~/.vim) and continue?" yn
  if [[ $yn == "Y" ]] ; then
    rm -RF ~/.vim
  else
    echo "Remove ~/.vim manually and re-run"
    exit -1
  fi
fi

if [[ ! -e ~/.vimrc ]] ; then
  DC_DIR=`pwd`
  pushd ~
    ln -s $DC_DIR/dot.vimrc .vimrc
  popd
fi

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
  git clone https://github.com/sanmiguel/vimerl.git
  git clone https://github.com/jnurmine/Zenburn.git
  #git clone https://github.com/vim-scripts/searchfold.vim.git
  git clone https://github.com/tpope/vim-markdown.git
  git clone https://github.com/wesgibbs/vim-irblack.git
  git clone https://github.com/gregsexton/gitv.git
  git clone https://github.com/majutsushi/tagbar.git
  git clone https://github.com/mileszs/ack.vim.git
  git clone https://github.com/ervandew/supertab.git
popd


