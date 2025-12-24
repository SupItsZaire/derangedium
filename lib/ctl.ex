defmodule Ctl do
  @moduledoc """
  Admin functions meant to be executed from the shell
  """

  alias Derangedium.{Translation, CommandHolder}

  defdelegate migrate(channel_id, limit), to: Derangedium.Util.Migrate
  defdelegate migrate(channel_id), to: Derangedium.Util.Migrate
  defdelegate migrate_all(), to: Derangedium.Util.Migrate
  defdelegate observer, to: :observer_cli, as: :start
  defdelegate reload_langs, to: Translation, as: :reload
  defdelegate reload_commands, to: CommandHolder, as: :reload

  def reload do
    reload_langs()
    reload_commands()
  end
end
