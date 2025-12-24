import Config

config :nostrum,
  token: System.get_env("DERANGE_TOKEN") |> String.trim
