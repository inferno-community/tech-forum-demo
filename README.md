# IG Test Creation Demo

## Requirements
Users should have all the necessary dependencies installed to run [SUSHI](https://github.com/FHIR/sushi) and the [FHIR IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation).  This includes things like Node.js, Java, Ruby and Jekyll.  Please see the relevant tools for instructions on installation and use.  Running the Inferno portion of the demo requires the installation of Ruby and Docker.  See [Inferno](https://github.com/onc-healthit/inferno) for more details.

**NOTE: This is a demonstration of a prototype.  Bugs and issues are expected and the API _will_ change**

## Overview

Generate tests from an IG.

![test_flow](https://github.com/inferno-community/tech-forum-demo/blob/master/test_flow.png?raw=true)

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

## Contact Us
The Inferno development team can be reached by email at
inferno@groups.mitre.org.  Inferno also has a dedicated [HL7 FHIR chat
channel](https://chat.fhir.org/#narrow/stream/153-inferno).

## License

Copyright 2020 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at
```
http://www.apache.org/licenses/LICENSE-2.0
```
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.