import Config

config :derangedium,
  data_path: (if Mix.env() == :prod, do: "/var/derangedium/data", else: ".data"),
  channel_unload_timeout: 3 * 1000, # milliseconds
  guild_unload_timeout: 4 * 1000,
  log_interval: 1000,
  usage_recalc_interval: 60_000,
  node_voice_server: {'localhost', 2700},
  pre_train_batch_size: 100,
  scrape_port: 4040

config :prometheus, Derangedium.Prometheus.Plug,
  path: "/metrics",
  format: :auto,
  registry: :default,
  auth: false

config :logger,
  level: :debug,
  backends: [:console, {LoggerFileBackend, :file}]
config :logger, :console,
  metadata: [:shard, :guild, :channel],
  level: :info
config :logger, :file,
  path: "/var/derangedium/latest.log",
  level: :info

config :nostrum,
  num_shards: :auto,
  gateway_intents: [
    :guilds,
    :guild_messages,
    :message_content
  ]
