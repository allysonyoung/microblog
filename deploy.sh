#!/bin/bash
mix deps.get
mix ecto.migrate
mix release.init

export MIX_ENV=prod

mix phx.digest
mix release --env=prod

scp _build/prod/rel/microblog/releases/0.0.1/microblog.tar.gz bloguser@45.76.167.87:

ssh bloguser@45.76.167.87
