
# Elixir (asdf) (elixir-asdf)

Elixir development environment using asdf for version management. Reads .tool-versions from your project.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| projectName | Project name (used for container name and workspace folder): | string | my-elixir-app |

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


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/team-alembic/devcontainer-templates/blob/main/src/elixir-asdf/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
