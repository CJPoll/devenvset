defmodule Devenvset.Setup do
  use Coach.Playbook

  @dev_account "dev"

  defplay :setup_user do
    create_user user: @dev_account, home: "/home/#{@dev_account}"
    change_shell user: @dev_account, shell: "/bin/bash"
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
    service action: :start, services: ["postgresql", "rabbitmq-server", "redis-server"]
  end
end
