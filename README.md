# IG Test Creation Demo

**NOTE: This is a demonstration of a prototype.  Bugs and issues are expected and the API _will_ change**

## Overview

Generate tests from an IG.

![test_flow](https://github.com/inferno-community/tech-forum-demo/blob/master/test_flow.png?raw=true)

## Requirements
Users should have all the necessary dependencies installed to run [SUSHI](https://github.com/FHIR/sushi) and the [FHIR IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation).  This includes things like Node.js, Java, Ruby and Jekyll.  Please see the relevant tools for instructions on installation and use.

## Generating the tests and running Inferno

### In one shot

```shell
yes | ./generate_tests.sh
```

### Step by step

This script will pause at major points in the demo and request user input before continuing.

```shell
./generate_tests.sh
```

## Creating the Profiles

The example profiles are written in FHIR Shorthand.  We can use SUSHI to compile these into Structure Definitions

Install SUSHI:
```shell
npm install -g fsh-sushi
```

Compile the profiles

```shell
sushi .
```

## Generating the tests

Download Inferno

```shell
git clone -b FI-886 --single-branch https://github.com/onc-healthit/inferno.git
```

Copy the StructureDefinitions into Inferno

```shell
cp -r build/input/profiles inferno/resources/demo
```

Generate the tests

```shell
cd inferno
bundle install
bundle exec rake "inferno:generate[generic,demo]"
```

Then enable the test in the Inferno config.yml by adding `-demo` to `modules:`

run inferno

```shell
be rackup
```