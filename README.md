# IG Test Creation Demo

## Generating the tests

```shell
./generate_tests.sh
```

Then enable the tests in the Inferno `config.yml`

Then run Inferno

```shell
cd inferno
be rackup
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