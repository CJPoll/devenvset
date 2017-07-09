defmodule Mix.Tasks.Dev.Setup do
  use Mix.Task

  alias Coach.Cmd

  def run(_) do
    Devenvset.Setup.setup() |> Cmd.run
  end
end
