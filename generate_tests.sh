#!/bin/sh

sushi . -s
rm -rf inferno
git clone -b fi-898-900-928 --single-branch https://github.com/onc-healthit/inferno.git
cp -r build/input/profiles inferno/resources/demo
cp -a build/input/capabilities/. inferno/resources/demo/
cp package.json inferno/resources/demo/
cd inferno
bundle install
bundle exec rake "inferno:generate[generic,demo]"
