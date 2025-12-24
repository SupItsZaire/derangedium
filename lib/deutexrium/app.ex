defmodule Derangedium.App do
  use Application
  @moduledoc """
  Derangedium OTP app
  """

  @impl true
  def start(_type, _args) do
    dir = Application.fetch_env!(:derangedium, :data_path)
    File.mkdir_p(dir |> Path.join("data"))

    scrape_port = Application.fetch_env!(:derangedium, :scrape_port)
    Supervisor.start_link([
      {Registry, keys: :unique, name: Registry.Server},
      {DynamicSupervisor, name: Derangedium.ServerSup},
      {Plug.Cowboy, scheme: :http, plug: Derangedium.Plug, options: [port: scrape_port]},
      Derangedium.Prometheus,
      Derangedium.Translation,
      Derangedium.Persistence,
      Derangedium.CommandHolder,
      Derangedium.Command,
      Derangedium.Presence,
    ], strategy: :one_for_one, name: Derangedium.RootSupervisor)
  end
end
