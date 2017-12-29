#!/usr/bin/env bash

set -ue

rm -f *.gem
rm -rf test/package/installed

echo "Building client gem"
gem build organization-client.gemspec --norc

echo "Installing client gem"
gem install organization-client*.gem \
  --install-dir ./test/package/installed \
  --norc \
  --no-document \
  --no-ri

export GEM_PATH=test/package/installed

ruby test/package/client.rb

rm -rf test/package/installed
