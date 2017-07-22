defmodule Devenvset.Setup do
  use Coach.Playbook

  defplay :copy_dotfiles do
    copy from: {:priv, "dotfiles/.bashrc"}, to: {:home, ".bashrc"}
    copy from: {:priv, "dotfiles/.bash_profile"}, to: {:home, ".bash_profile"}
    copy from: {:priv, "dotfiles/.zshrc"}, to: {:home, ".zshrc"}
    copy from: {:priv, "dotfiles/.psqlrc"}, to: {:home, ".psqlrc"}
    copy from: {:priv, "dotfiles/.tmux.conf"}, to: {:home, ".tmux.conf"}
  end
end
