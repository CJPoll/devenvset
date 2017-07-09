#! /usr/bin/env bash
apt-get update;
apt-get -y install autoconf build-essential git libglu1-mesa-dev libgl1-mesa-dev libncurses5-dev libpng3 libwxgtk3.0-dev libssh-dev m4;

# Install ASDF version manager (Erlang + Elixir)
git clone https://github.com/asdf-vm/asdf.git "${HOME}"/.asdf --branch v0.3.0;

source "${HOME}/.asdf/asdf.sh"

# Install Erlang plugin for ASDF version manager
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git;

# Install Elixir plugin for ASDF version manager
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git;

#Install necessary dependencies for Erlang

#Install lastest Erlang
asdf install erlang 19.3;
asdf global erlang 19.3;

#Install lastest Elixir
asdf install elixir 1.4.5;
asdf global elixir 1.4.5;

mix local.hex --force;
mix local.rebar --force;
