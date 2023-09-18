#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f ./tmp/pids/server.pid

# If running the rails server then create or migrate existing database
if [[ $@ == "rails server -b '0.0.0.0'" ]] || [[ $@ == "" ]]; then
  ./bin/rails db:prepare
  exec rails server -b '0.0.0.0'
else
exec $@
fi

