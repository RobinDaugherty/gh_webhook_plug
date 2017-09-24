defmodule GithubWebhookAuthenticationPlug do
  import Plug.Conn
  require Logger

  def init(options) do
    options
  end

  def call(conn, options) do
    payload = Poison.encode!(conn.params)
    case get_req_header(conn, "x-hub-signature") do
      [signature_in_header] ->
        if verify_signature(payload, options[:secret], signature_in_header) do
          conn
        else
          conn |> deny_access()
        end
      [] ->
        conn |> deny_access()
    end
  end

  defp deny_access(conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:forbidden, ~s({"status":"Signature verification failed"}))
    |> halt()
  end

  defp verify_signature(payload, secret, signature_in_header) do
    signature = "sha1=" <> (:crypto.hmac(:sha, secret, payload) |> Base.encode16(case: :lower))
    Plug.Crypto.secure_compare(signature, signature_in_header)
  end
end
