defmodule Mix.Tasks.Dev.Setup do
  use Mix.Task

  alias Coach.Cmd

  def run(_) do
    Application.ensure_all_started(:devenvset)

    Devenvset.Setup.setup_user() |> Cmd.run
    Devenvset.Setup.copy_dotfiles() |> Cmd.run
    Devenvset.Setup.install_infrastructure() |> Cmd.run
    Devenvset.Setup.setup_postgres() |> Cmd.run
    Devenvset.Setup.tmux() |> Cmd.run
  end
end
