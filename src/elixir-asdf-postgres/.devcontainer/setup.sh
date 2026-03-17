#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2022 Alembic Pty Ltd
#
# SPDX-License-Identifier: MIT

if [ -e .asdf-plugins ]; then
  source .asdf-plugins
fi

if [ ! -e .tool-versions ]; then
  echo "No .tool-versions file found!"
  exit 1
fi

set -euo pipefail

PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
REQUIRED_PLUGINS=$(cat .tool-versions | cut -d \  -f 1)
INSTALLED_PLUGINS=$(asdf plugin list || echo "")

echo -n "==> Installing/updating required plugins: "
for PLUGIN in $REQUIRED_PLUGINS; do
  if [[ $INSTALLED_PLUGINS =~ (^|[[:space:]])"$PLUGIN"($|[[:space:]]) ]]; then
    asdf plugin update $PLUGIN
  else
    asdf plugin add $PLUGIN
  fi
  echo -n "$PLUGIN "
done
echo

echo "==> Installing tools: "
asdf install

echo "==> Setting up Hex and Rebar"
mix local.hex --force
mix local.rebar --force

if [ "${templateOption:installNervesBootstrap}" = "true" ]; then
  echo "==> Installing Nerves Bootstrap"
  mix archive.install hex nerves_bootstrap --force
fi

if [ -e mix.exs ]; then
  echo "==> Fetching dependencies..."
  mix deps.get
fi

if [ -e config/config.exs ]; then
  cat <<'EOF'

==> PostgreSQL template note
To connect your app to the bundled PostgreSQL container, configure your Repo host
to read DATABASE_HOST, for example in config/dev.exs or config/runtime.exs:

  config :your_app, YourApp.Repo,
    hostname: System.get_env("DATABASE_HOST", "localhost")

This template sets DATABASE_HOST=db in the devcontainer.
EOF
fi

echo "==> Setup complete!"
