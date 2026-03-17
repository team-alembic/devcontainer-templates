
# Elixir (asdf) with PostgreSQL (elixir-asdf-postgres)

Elixir development environment using asdf for version management, with a PostgreSQL service container. Reads .tool-versions from your project.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| projectName | Project name (used for container name, workspace folder, and default database): | string | my-elixir-app |
| installNervesBootstrap | Install Nerves Bootstrap (for Nerves IoT projects): | boolean | false |
| postgresVersion | PostgreSQL version: | string | 17 |

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

Set `projectName` to your real app name when applying the template. It controls container/workspace naming and the default database name (`<projectName>_dev`).

Default credentials:
- **User:** `postgres`
- **Password:** `postgres`
- **Database:** `<projectName>_dev`

## Repo Configuration

During setup, the template prints a reminder to configure your Repo host to use `DATABASE_HOST`.

Example (`config/dev.exs` or `config/runtime.exs`):

```elixir
config :your_app, YourApp.Repo,
  hostname: System.get_env("DATABASE_HOST", "localhost")
```

## Included Tools

- **asdf** for version management (reads `.tool-versions`)
- **Claude Code CLI** (`claude`)
- **GitHub CLI** (`gh`)
- **Erlang/OTP build dependencies** (autoconf, wxWidgets, OpenGL, etc.)
- **Hex** and **Rebar** (installed automatically)

## Claude Code Authentication

The template passes `ANTHROPIC_API_KEY` and `ANTHROPIC_AUTH_TOKEN` from your host into the container via `remoteEnv`.

If these variables are not set on your host, start Claude Code in the container and log in interactively:

```bash
claude
```

## Port Forwarding

- **4000** — Phoenix dev server
- **5432** — PostgreSQL

## Volumes

- **postgres-data** — persists database data across container rebuilds
- **dialyzer-plt** — caches Dialyzer PLT files in `~/.mix` for faster analysis


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/team-alembic/devcontainer-templates/blob/main/src/elixir-asdf-postgres/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
