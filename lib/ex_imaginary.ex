defmodule ExImaginary do
  @moduledoc """
  Provides functions to generate secure Imginary URLs.
  """

  defp config do
    %{
      host: Application.get_env(:ex_imaginary, :host),
      url_signature_key: Application.get_env(:ex_imaginary, :url_signature_key),
      token: Application.get_env(:ex_imaginary, :token)
    }
  end

  defp sign(url_signature_key, path, query) do
    mac = :crypto.mac(:hmac, :sha256, url_signature_key, path <> query)

    Base.url_encode64(mac, padding: false)
  end

  @doc """
  Generates a secure Imginary URL given:
  * `path` - The URL path of the image operation.
  * `params` - (optional) A map containing Imgaginary API parameters used to manipulate the image.
  * `config` - (optional) A map containing Imganiry source config:
      * `:host` - The Imaginary host.
      * `:token` - The token for API authorization.
      * `:url_signature_key` - The url signature key used to verify the API url signature.
  ## Examples
      iex> ExImaginary.url "/resize", %{nocrop: true, type: "jpeg", url: "https://raw.githubusercontent.com/mrdotb/i/master/mcdo.jpg"}
      "http://localhost:9000/resize?nocrop=true&type=jpeg&url=https%3A%2F%2Fraw.githubusercontent.com%2Fmrdotb%2Fi%2Fmaster%2Fmcdo.jpg"
      iex> ExImaginary.url "/thumbnail", %{url: "https://raw.githubusercontent.com/mrdotb/i/master/mcdo.jpg"}
      "http://localhost:9000/thumbnail?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmrdotb%2Fi%2Fmaster%2Fmcdo.jpg"
  """
  def url(path, params \\ %{}, config \\ config()) do
    query = encode_query(params, config.token)
    url = "#{config.host}#{path}?#{query}"

    url
    |> maybe_sign_url(path, query, config.url_signature_key)
  end

  defp encode_query(params, nil), do: URI.encode_query(params)

  defp encode_query(params, token) do
    params
    |> Map.put(:token, token)
    |> URI.encode_query()
  end

  defp maybe_sign_url(url, _path, _query, nil), do: url

  defp maybe_sign_url(url, path, query, url_signature_key) do
    signature = sign(url_signature_key, path, query)

    if query == "" do
      "#{url}?sign=#{signature}"
    else
      "#{url}&sign=#{signature}"
    end
  end
end
