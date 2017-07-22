#! /usr/bin/env bash

echo "THIS IS WORKING";

source "${HOME}/.asdf/asdf.sh";

ssh -o StrictHostKeyChecking=no -T git@github.com

rm -rf devenvset;

git clone https://github.com/cjpoll/devenvset;

cd devenvset;

mix deps.get;
mix compile;
mix dev.setup;
