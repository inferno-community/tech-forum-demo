#!/bin/sh

read -p "Ready to build the IG?"

# Remove any existing build artifacts
rm -rf build

# Run SUSHI to compile FSH to FHIR
sushi . -s

# Build the IG
cd build
./_updatePublisher.sh # Install/Update the IG Publisher
./_genonce.sh # Run the IG Publisher
cd ..

read -p "Ready to download Inferno?"

# Remove any existing Inferno install in the local directory
rm -rf inferno

# Install Inferno locally
git clone --single-branch --branch development https://github.com/onc-healthit/inferno.git

read -p "Ready to copy the IG into Inferno?"

# Unzip the NPM package
tar zxvf build/output/package.tgz -C ./

# Copy the package into Inferno
mv package inferno/resources/demo

read -p "Ready to generate the tests?"

# Generate tests based on the IG
cd inferno
bundle install
bundle exec rake "inferno:generate[generic,demo]"

read -p "Ready to run Inferno?"

# Run Inferno
docker-compose pull
docker-compose up --build
