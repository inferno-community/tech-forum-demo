#!/bin/sh

sushi .
rm -rf inferno
git clone -b FI-886 --single-branch https://github.com/onc-healthit/inferno.git
cp -r build/input/profiles inferno/resources/demo
cd inferno
bundle install
bundle exec rake "inferno:generate[generic,demo]"
