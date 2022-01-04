defmodule ExImaginaryTest do
  use ExUnit.Case
  doctest ExImaginary

  @url "https://raw.githubusercontent.com/mrdotb/i/master/mcdo.jpg"

  test "signature should match the one computed using the Go example" do
    path = "/resize"
    params = %{nocrop: true, type: "jpeg", url: @url, width: 200}

    config = %{
      host: "http://localhost:9000",
      url_signature_key: "4f46feebafc4b5e988f131c4ff8b5997",
      token: nil
    }

    go_signature = "ec5tYLlL65gtbQDbbg-Ztk__XmaU4vBHw6JIXP7GzYA"
    assert ExImaginary.url(path, params, config) =~ go_signature
  end
end
