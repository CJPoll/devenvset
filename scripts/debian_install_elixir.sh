#! /usr/bin/env bash

# Install ASDF version manager (Erlang + Elixir)
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0;

source ~/.bashrc;

# Install Erlang plugin for ASDF version manager
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git;

# Install Elixir plugin for ASDF version manager
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git;

#Install necessary dependencies for Erlang
apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng3 libssh-dev;

#Install lastest Erlang
asdf install erlang 20.0;
asdf global erlang 20.0;

#Install lastest Elixir
asdf install elixir 1.4.5;
asdf global elixir 1.4.5;
