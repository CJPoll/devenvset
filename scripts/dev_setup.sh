#! /usr/bin/env zsh

USERNAME="${1}";

if [ -z "${USERNAME}" ]; then
	USERNAME="dev";
fi

HOME="/home/${USERNAME}"

#useradd -d /home/"${USERNAME}" -m "${USERNAME}";
#passwd -d "${USERNAME}"

cp "dotfiles/.zshrc" "${HOME}";
cp "dotfiles/.tmux.conf" "${HOME}";
cp "dotfiles/.vimrc" "${HOME}";
#cp "${HOME}/.ssh/authorized_keys" "${HOME}"

#apk add sudo build-base zsh libevent-dev-2.1.8-r2 curl tmux python cmake

git clone "https://github.com/VundleVim/Vundle.vim.git" "${HOME}/.vim/bundle/Vundle.vim"
su - "${USERNAME}" -c vim +PluginInstall +qall

git clone git@github.com:robbyrussell/oh-my-zsh "${HOME}/.oh-my-zsh"
git clone git@github.com:tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
git clone git@github.com:cjpoll/custom "${HOME}/custom"

chown -R "${USERNAME}" "${HOME}/.oh-my-zsh"
chown -R "${USERNAME}" "${HOME}/.tmux/plugins/tpm"
chown -R "${USERNAME}" "${HOME}/custom"
