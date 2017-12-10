defmodule Devenvset.Setup do
  use Coach.Playbook
  alias Coach.Play.{ASDF, Postgres}

  @dev_account "dev"

  defplay :setup_user do
    create_user user: @dev_account, home: "/home/#{@dev_account}"
    password user: @dev_account, password: "changethispasswordimmediately"
    sudoer user: @dev_account
  end

  defplay :copy_dotfiles do
    copy from: {:priv, "dotfiles/.bashrc"}, to: {:home, @dev_account, ".bashrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.bash_profile"}, to: {:home, @dev_account, ".bash_profile"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.zshrc"}, to: {:home, @dev_account, ".zshrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.psqlrc"}, to: {:home, @dev_account, ".psqlrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.tmux.conf"}, to: {:home, @dev_account, ".tmux.conf"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.vimrc"}, to: {:home, @dev_account, ".vimrc"}, chown: @dev_account
    copy from: {:home, ".ssh/authorized_keys"}, to: {:home, @dev_account, ".ssh/authorized_keys"}, chown: @dev_account
  end

  defplay :terminal do
    install packages: ["zsh", "libevent-2.0-5", "libevent-dev", "powerline", "curl"], on: :debian
    change_shell user: @dev_account, shell: "/bin/zsh"
    mkdir {:home, @dev_account, ".oh-my-zsh"}
    mkdir {:home, @dev_account, ".config"}
    git_clone repo: "git@github.com:robbyrussell/oh-my-zsh.git", to: {:home, @dev_account, ".oh-my-zsh"}
    git_clone repo: "git@github.com:tmux-plugins/tpm", to: {:home, @dev_account, ".tmux/plugins/tpm"}
    git_clone repo: "git@github.com:cjpoll/custom", to: {:home, @dev_account, "custom"}
    git_clone repo: "git@github.com:chriskempson/base16-shell", to: {:home, @dev_account, ".config/base16-shell"}
    git_clone repo: "git@github.com:tmux/tmux", to: {:home, @dev_account, "dev/tmux"}

    play :install_tmux

    chown file: {:home, @dev_account, ".oh-my-zsh"}, recursive: true, owner: @dev_account
    chown file: {:home, @dev_account, ".tmux/plugins/tpm"}, recursive: true, owner: @dev_account
    chown file: {:home, @dev_account, "custom"}, recursive: true, owner: @dev_account
    chown file: {:home, @dev_account, ".config/base16-shell"}, recursive: true, owner: @dev_account

    play :copy_dotfiles
  end

  defplay :editor do
    git_clone repo: "https://github.com/VundleVim/Vundle.vim.git", to: {:home, @dev_account, ".vim/bundle/Vundle.vim"}
    shell command: "vim", args: ["+PluginInstall", "+qall"]
  end
end
