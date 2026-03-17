# Dev Container Templates

A collection of [Dev Container Templates](https://containers.dev/implementors/templates) for Elixir development, maintained by [Team Alembic](https://github.com/team-alembic).

## Templates

### Elixir (asdf)

Standalone Elixir development environment using [asdf](https://asdf-vm.com/) for version management. Reads `.tool-versions` from your project to install the correct Erlang and Elixir versions.

```
ghcr.io/team-alembic/devcontainer-templates/elixir-asdf:latest
```

| Option | Description | Default |
|--------|-------------|---------|
| `projectName` | Container name and workspace folder | `my-elixir-app` |

### Elixir (asdf) with PostgreSQL

Same as above, plus a PostgreSQL service container with health checks, persistent volumes, and `DATABASE_HOST` pre-configured.

```
ghcr.io/team-alembic/devcontainer-templates/elixir-asdf-postgres:latest
```

| Option | Description | Default |
|--------|-------------|---------|
| `projectName` | Container name, workspace folder, and database name (`<name>_dev`) | `my-elixir-app` |
| `postgresVersion` | PostgreSQL version | `17` |

## Prerequisites

Your project needs a `.tool-versions` file in the root:

```
erlang 27.3
elixir 1.18.3-otp-27
```

## What's Included

Both templates provide:

- **asdf** version management (reads `.tool-versions`)
- **Erlang/OTP build dependencies** (autoconf, wxWidgets, OpenGL, etc.)
- **GitHub CLI** (`gh`)
- **Hex** and **Rebar** (installed automatically)
- **Port 4000** forwarded for Phoenix

The PostgreSQL template additionally provides:

- **PostgreSQL** with health checks and persistent data volume
- **Dialyzer PLT cache** volume (speeds up repeated analysis)
- **Port 5432** forwarded

## Development

### Testing Locally

```bash
./.github/actions/smoke-test/build.sh elixir-asdf
./.github/actions/smoke-test/test.sh elixir-asdf
```

### Publishing

Run the **Release Dev Container Templates** workflow from the Actions tab. This publishes templates to GHCR and generates documentation.

## Licence

[MIT](LICENCE)
