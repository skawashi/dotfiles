#!/bin/sh

# 0.
# git をインストールしていなければ、 git --version を実行。 自動的にgitがインストールされる
# GUIアプリは付属のmdを参照してインストール

# 1. Homebrew をホームディレクトリ直下にインストール
mkdir $HOME/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
echo 'export PATH=$HOME/.homebrew/bin:$PATH' >> $HOME/.zprofile
echo 'export HOMEBREW_CACHE=$HOME/.homebrew/cache' >> $HOME/.zprofile
source ~/.zprofile

# 2 HomebrewでCLIアプリをインストール
brew install mas # App Store のアプリをcliからインストールするツール

# 3. mas-cli でApp Store からアプリをインストール
mas install 1429033973 # runcat
mas install 1575588022 # MenubarX
mas install 539883307  # LINE
