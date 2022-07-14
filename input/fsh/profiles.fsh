ValueSet: EventagsVS

ValueSet: EventCodeVS

ValueSet: MeaningOrderVS


Profile:     PEMHbundle
Id:          example-patient-profile
Parent:      Bundle
Title:       "Example Patient Profile"
Description: "O Bundle da mensagem deve ser do tipo 'message', deve ter como primeira entrada o recurso MessageHeader, e como segunda o recurso."

* id 1..1
* type = #message
* meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescription-synchronization/v1-0-3"
* signature 1..1 MS
* signature.type 1..* MS
* signature.when 1..1 MS
* entry 2..* MS
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "name"
* entry ^slicing.rules = #open
* entry contains messageheader 1..1 MS and request 1..1 MS and  parameter 1..1 MS  

* entry[messageheader].resource only PEMHMSH

Profile:     PEMHMSH
Id:          msh-profile
Parent:      MessageHeader
Title:       "Example Patient Profile"
Description: "Este recurso deve ser a primeira entrada no Bundle e deve referenciar (focus) o recurso MedicationRequest."

* id 1..1
* meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescriptionsynchronization-msh/v1-0-3"
* meta.tag from EventagsVS (required)
* meta.tag 1..1 MS
* source.name 1..1
//* event.system = "http://spms.min-saude.pt/iop/events"
//* event.code from EventCodeVS (required)


Extension: PrescriptionDuplicate
Id:        duplicate-order
Title:    "Condition related to the current resource"
Description: "The resource has an unspecified relationship with a Condition."
* value[x] only positiveInt
//^url = "http://spms.min-saude.pt/iop/extensions/prescription-duplicate"


Extension: MeaningOrder
Id:        meaning-order
Title:    "Condition related to the current resource"
Description: "The resource has an unspecified relationship with a Condition."
* value[x] only CodeableConcept
* value[x] from MeaningOrderVS (required)
//^url = "http://spms.min-saude.pt/iop/extensions/prescription-duplicate"




Profile:     PEMHContent
Id:          content-profile
Parent:      RequestGroup
Title:       "Example Patient Profile"
Description: "Este recurso representa a receita (Número da receita, local e central, número da linha e a data de validade )."

* id 1..1 
* meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescriptionsynchronization-msh/v1-0-3"
* groupIdentifier 1..1
* intent = #order
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open


* extension contains duplicate-order named duplicateOrder 0..1 
* extension contains meaning-order named MeaningOrder 0..1
//* extension[duplicate-order].url = "http://spms.min-saude.pt/iop/extensions/prescription-duplicate"
* extension[MeaningOrder].valueCodeableConcept.coding.system = "http://spms.min-saude.pt/bdnp/codesystem/med"



Profile:     PEMHMedicationRequest
Id:          med-request-profile
Parent:      MedicationRequest
Title:       "Example Patient Profile"
Description: "Este recurso contém informações da linha da receita."
