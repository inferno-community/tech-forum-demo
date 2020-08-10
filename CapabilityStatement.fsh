Instance: DemoServer
InstanceOf: CapabilityStatement
Title: "Demo Server Requirements"
Usage: #definition

* status = #draft
* date = "2020-08-05"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json

// The REST Endpoint Requirements

* rest.mode = #server

* rest.resource[0].type = #Patient
* rest.resource[0].supportedProfile = "http://example.org/fhir/demo/StructureDefinition/demo-patient"
// SHALL support the read interaction
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[0].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[1].type = #Condition
* rest.resource[1].supportedProfile = "http://example.org/fhir/demo/StructureDefinition/demo-condition"
// SHALL support the read interaction
* rest.resource[1].interaction[0].code = #read
* rest.resource[1].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[1].interaction[0].extension[0].valueCode = #SHALL

// SHOULD support search interaction
* rest.resource[1].interaction[1].code = #search-type
* rest.resource[1].interaction[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[1].interaction[1].extension[0].valueCode = #SHOULD

// SHOULD support search by patient
* rest.resource[1].searchParam[0].name = "subject"
* rest.resource[1].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/demo-condition-subject"
* rest.resource[1].searchParam[0].type = #token
* rest.resource[1].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[1].searchParam[0].extension[0].valueCode = #SHOULD

Instance: ConditionPatientSearch
InstanceOf: SearchParameter
Title: "Search Condition by patient"
Usage: #definition

* url = "http://hl7.org/fhir/SearchParameter/demo-condition-subject"
* name = "DemoConditionSubject"
* status = #draft
* description = "What conditions does the subject have?"
* code = #subject
* base = #Condition
* type = #reference
* expression = "Condition.subject"
