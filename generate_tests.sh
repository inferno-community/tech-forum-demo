#!/bin/sh

# Remove any existing build artifacts
rm -rf build

# Run SUSHI to compile FSH to FHIR
sushi . -s

# Build the IG
cd build
./_updatePublisher.sh # Install/Update the IG Publisher
./_genonce.sh # Run the IG Publisher
cd ..

# Remove any existing Inferno install in the local directory
rm -rf inferno

# Install Inferno locally
git clone https://github.com/onc-healthit/inferno.git

# Unzip the NPM package
tar zxvf build/output/package.tgz -C ./

# Copy the package into Inferno
mv package inferno/resources/demo

# Generate tests based on the IG
cd inferno
bundle install
bundle exec rake "inferno:generate[generic,demo]"

# Run Inferno
docker-compose pull
docker-compose up --build