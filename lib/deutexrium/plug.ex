defmodule Derangedium.Plug do
  import Plug.Conn
  use Plug.Router

  plug Derangedium.Prometheus.Plug

  get "/metrics" do
    send_resp(conn, 200, "ok")
  end
end
