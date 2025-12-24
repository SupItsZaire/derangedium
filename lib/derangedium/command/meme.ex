defmodule Derangedium.Command.Meme do
  use Derangedium.Command.WithDefaultImports
  @moduledoc """
  Generates and sends back a meme
  """

  def spec, do: %{
    name: "meme",
    flags: [:defer]
  }

  def handle_command(%Struct.Interaction{} = interaction) do
    file = Derangedium.Meme.generate({interaction.channel_id, interaction.guild_id}, interaction.id)
    {:finish, %{files: [file]}, file}
  end

  def finish_handling(file) do
    Derangedium.Meme.cleanup(file)
  end
end
