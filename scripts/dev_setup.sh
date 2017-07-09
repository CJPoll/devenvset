#! /usr/bin/env bash

source "${HOME}/.asdf/asdf.sh";

git clone https://github.com/cjpoll/devenvset;

cd devenvset;

mix deps.get;
mix compile;
mix dev.setup;
