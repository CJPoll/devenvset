#! /usr/bin/env bash

echo "THIS IS WORKING";

source "${HOME}/.asdf/asdf.sh";

git clone https://github.com/cjpoll/devenvset;

cd devenvset;

mix deps.get;
mix compile;
mix dev.setup;
