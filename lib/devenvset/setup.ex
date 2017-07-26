defmodule Devenvset.Setup do
  use Coach.Playbook
  alias Coach.Play.{ASDF, Postgres}

  @dev_account "dev"

  defplay :setup_user do
    create_user user: @dev_account, home: "/home/#{@dev_account}"
  end

  defplay :copy_dotfiles do
    copy from: {:priv, "dotfiles/.bashrc"}, to: {:home, @dev_account, ".bashrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.bash_profile"}, to: {:home, @dev_account, ".bash_profile"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.zshrc"}, to: {:home, @dev_account, ".zshrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.psqlrc"}, to: {:home, @dev_account, ".psqlrc"}, chown: @dev_account
    copy from: {:priv, "dotfiles/.tmux.conf"}, to: {:home, @dev_account, ".tmux.conf"}, chown: @dev_account
  end

  defplay :prep_postgres do
    shell "wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -"
    shell "echo \"deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main\" >> /etc/apt/sources.list.d/pgdg.list"
    shell "apt-get update"
  end

  defplay :install_infrastructure do
    play :prep_postgres
    install packages: ["postgresql-9.6", "postgresql-contrib-9.6", "rabbitmq-server", "redis-server", "redis-tools"], on: :debian
    delete file: "/lib/systemd/system/postgresql.service"
    shell "systemctl daemon-reload"
    service action: :start, services: ["rabbitmq-server", "redis-server"]
    service action: :restart, service: "postgresql"
  end

  defplay :terminal do
    install packages: ["zsh", "tmux", "powerline", "curl"], on: :debian
    change_shell user: @dev_account, shell: "/bin/zsh"
    mkdir {:home, @dev_account, ".oh-my-zsh"}
    mkdir {:home, @dev_account, ".config"}
    git_clone repo: "git@github.com:robbyrussell/oh-my-zsh.git", to: {:home, @dev_account, ".oh-my-zsh"}
    git_clone repo: "git@github.com:tmux-plugins/tpm", to: {:home, @dev_account, ".tmux/plugins/tpm"}
    git_clone repo: "git@github.com:cjpoll/custom", to: {:home, @dev_account, "custom"}
    git_clone repo: "git@github.com:chriskempson/base16-shell", to: {:home, @dev_account, ".config/base16-shell"}

    play :copy_dotfiles
  end

  defplay :install_asdf do
    git_clone repo: "git@github.com:asdf-vm/asdf", to: {:home, @dev_account, ".asdf"}, branch: "v0.3.0"
  end

  defplay :asdf do
    ASDF.add_plugin("erlang", "https://github.com/asdf-vm/asdf-erlang", {:home, @dev_account, ".asdf/bin/asdf"})
    ASDF.add_plugin("elixir", "https://github.com/asdf-vm/asdf-elixir", {:home, @dev_account, ".asdf/bin/asdf"})

    ASDF.install_version("erlang", "19.3", {:home, @dev_account, ".asdf/bin/asdf"})
    ASDF.set_global("erlang", "19.3", {:home, @dev_account, ".asdf/bin/asdf"})

    ASDF.install_version("elixir", "1.4.5", {:home, @dev_account, ".asdf/bin/asdf"})
    ASDF.set_global("elixir", "1.4.5", {:home, @dev_account, ".asdf/bin/asdf"})
  end

  defplay :setup_postgres do
    Postgres.create_user user: @dev_account, permissions: [:superuser], creator: "postgres"
  end
end
