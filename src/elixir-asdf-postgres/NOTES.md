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

## PostgreSQL

The template includes a PostgreSQL service container accessible from the app container at hostname `db`. The `DATABASE_HOST` environment variable is set automatically.

Default credentials:
- **User:** `postgres`
- **Password:** `postgres`
- **Database:** `<projectName>_dev`

## Included Tools

- **asdf** for version management (reads `.tool-versions`)
- **GitHub CLI** (`gh`)
- **Erlang/OTP build dependencies** (autoconf, wxWidgets, OpenGL, etc.)
- **Hex** and **Rebar** (installed automatically)

## Port Forwarding

- **4000** — Phoenix dev server
- **5432** — PostgreSQL

## Volumes

- **postgres-data** — persists database data across container rebuilds
- **dialyzer-plt** — caches Dialyzer PLT files in `~/.mix` for faster analysis
