#! /usr/bin/env zsh

USERNAME="${1}";

if [ -z "${USERNAME}" ]; then
	USERNAME="dev";
fi

#useradd -d /home/"${USERNAME}" -m "${USERNAME}";
#passwd -d "${USERNAME}"

cp "dotfiles/.zshrc" "/home/${USERNAME}/";
cp "dotfiles/.tmux.conf" "/home/${USERNAME}/";
cp "dotfiles/.vimrc" "/home/${USERNAME}/";
#cp "${HOME}/.ssh/authorized_keys" "/home/${USERNAME}/.ssh/authorized_keys"

#apk add sudo build-base zsh libevent-dev-2.1.8-r2 curl tmux python cmake

git clone "https://github.com/VundleVim/Vundle.vim.git" "/home/${USERNAME}/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall
