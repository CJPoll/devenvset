defmodule Devenvset.Setup do
  alias Coach.Play.Copy
  alias Coach.Cmd.Combinator

  @spec setup() :: Coach.Cmd.t
  def setup do
    copy_dotfiles()
  end

  @spec copy_dotfiles() :: Coach.Cmd.t
  def copy_dotfiles do
    dotfile_dir = Path.join([File.cwd!(), "priv/files"])
    dotfile_dir
    |> File.ls!
    |> Enum.map(fn(file) ->
         Copy.new()
         |> Copy.from(file)
         |> Copy.to(System.user_home!)
       end)
    |> Enum.reduce(fn(right, left) ->
      Combinator.then(left, right)
    end)
  end
end
