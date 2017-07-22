defmodule Mix.Tasks.Dev.Setup do
  use Mix.Task

  alias Coach.Cmd

  def run(_) do
    Application.ensure_all_started(:devenvset)
    Devenvset.Setup.copy_dotfiles(run_as: "cjpoll") |> Cmd.run
  end
end
