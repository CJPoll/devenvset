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
cp "dotfiles/.gitignore" "${HOME}";
#cp "${HOME}/.ssh/authorized_keys" "${HOME}"

#apk add sudo build-base zsh curl tmux ncurses

git clone "https://github.com/VundleVim/Vundle.vim.git" "${HOME}/.vim/bundle/Vundle.vim"
su - "${USERNAME}" -c vim +PluginInstall +qall

git clone git@github.com:robbyrussell/oh-my-zsh "${HOME}/.oh-my-zsh"
git clone git@github.com:tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
git clone git@github.com:cjpoll/custom "${HOME}/custom"

git config --global user.email "cjpoll@gmail.com"
git config --global user.username "Cody J. Poll"
git config --global core.excludesfile "${HOME}/.gitignore"

chown -R "${USERNAME}" "${HOME}/.oh-my-zsh"
chown -R "${USERNAME}" "${HOME}/.tmux/plugins/tpm"
chown -R "${USERNAME}" "${HOME}/custom"
