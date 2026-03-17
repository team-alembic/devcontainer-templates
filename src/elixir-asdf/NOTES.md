## Prerequisites

Your project must have a `.tool-versions` file in the root directory specifying at least `erlang` and `elixir` versions:

```
erlang 27.3
elixir 1.18.3-otp-27
```

## Optional: Custom asdf Plugins

If you need custom plugin repositories, create an `.asdf-plugins` file in your project root. This file is sourced as a shell script before plugin installation, allowing you to override plugin URLs:

```bash
# .asdf-plugins
export ASDF_ELIXIR_REPO="https://github.com/my-org/asdf-elixir.git"
```

## Included Tools

- **asdf** for version management (reads `.tool-versions`)
- **GitHub CLI** (`gh`)
- **Erlang/OTP build dependencies** (autoconf, wxWidgets, OpenGL, etc.)
- **Hex** and **Rebar** (installed automatically)

## Port Forwarding

- **4000** — Phoenix dev server
