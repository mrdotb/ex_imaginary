<!-- ix-docs-ignore -->
# ExImaginary
> An Elixir client library for generating image URLs for [imaginary](https://github.com/h2non/imaginary)

[![CI](https://github.com/mrdotb/ex_imaginary/actions/workflows/ci.yml/badge.svg)](https://github.com/mrdotb/ex_imaginary/actions/workflows/ci.yml)
[![Module Version](https://img.shields.io/hexpm/v/ex_imaginary.svg)](https://hex.pm/packages/ex_imaginary)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ex_imaginary/)
[![Total Download](https://img.shields.io/hexpm/dt/ex_imaginary.svg)](https://hex.pm/packages/ex_imaginary)
[![License](https://img.shields.io/hexpm/l/ex_imaginary.svg)](https://github.com/mrdotb/ex_imaginary/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/mrdotb/ex_imaginary.svg)](https://github.com/mrdotb/ex_imaginary/commits/master)

<!-- /ix-docs-ignore -->

- [Installation](#installation)
- [Documentation](#documentation)
- [Configuration](#configuration)
- [Usage](#usage)


## Installation


ex_imaginary is [available in Hex](https://hex.pm/packages/ex_imaginary), the package can be
installed as:

Add `:ex_imaginary` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_imaginary, "~> 0.1.0"}
  ]
end
```

## Documentation

The source is really small so reading through it should be straight-forward but
the full package documentation is available at https://hexdocs.pm/ex_imaginary

## Configuration

To use the library you have to configure your imaginary domain and secure token or
pass them as an options map `%{domain: "domain", token: "token"}` as the
third parameter to `ExImaginary.url/3`.
See `config/test.exs` for an example of how to configure this.

## Usage

Create a thumbnail image.
```elixir
url = ExImaginary.url "/thumbnail", %{url: "https://raw.githubusercontent.com/mrdotb/i/master/mcdo.jpg"}
```

Check [imaginary documentation](https://github.com/h2non/imaginary) to see all the supported path.
