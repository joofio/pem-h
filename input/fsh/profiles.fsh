ValueSet: EventagsVS

ValueSet: EventCodeVS

ValueSet: MeaningOrderVS


Profile:     PEMHbundleRquest
Id:          example-patient-profile
Parent:      Bundle
Title:       "Perfil Bundle de mensagem"
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
Title:       "Perfil MessageHeader"
Description: "Este recurso deve ser a primeira entrada no Bundle e deve referenciar (focus) o recurso MedicationRequest."

* id 1..1
* meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescriptionsynchronization-msh/v1-0-3"
* meta.tag from EventagsVS (required)
* meta.tag 1..1 MS
* source.name 1..1
//* event.system = "http://spms.min-saude.pt/iop/events"
//* event.code from EventCodeVS (required)
* focus 1..* MS
* focus only Reference(PEMHContent)

Extension: PrescriptionDuplicate
Id:        duplicate-order
Title:    "Condition related to the current resource"
Description: "The resource has an unspecified relationship with a Condition."
* value[x] only positiveInt
* ^url = "http://spms.min-saude.pt/iop/extensions/prescription-duplicate"


Extension: MeaningOrder
Id:        meaning-order
Title:    "Condition related to the current resource"
Description: "The resource has an unspecified relationship with a Condition."
* value[x] only CodeableConcept
* value[x] from MeaningOrderVS (required)
* ^url = "http://spms.min-saude/pe/top/extensions/med-request-modality"




Profile:     PEMHContent
Id:          content-profile
Parent:      RequestGroup
Title:       "Perfil Conteudo Receita"
Description: "Este recurso representa a receita (N??mero da receita, local e central, n??mero da linha e a data de validade )."

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

Profile:     PEMHMedicationRequest
Id:          med-request-profile
Parent:      MedicationRequest
Title:       "Perfil informa????o de receita"
Description: "Este recurso cont??m informa????es da linha da receita."

* id 1..1 MS
* groupIdentifier 1..1 MS
* status 1..1
* intent = #order
* medication[x] only Reference(PEMHMedication)
* authoredOn 1..1


Profile:     PEMHMedication
Id:          med-pemh-profile
Parent:      Medication
Title:       "Perfil Medica????o"
Description: "Este recurso representa o medicamento que ?? referenciado pelo recurso MedicationRequest."

Profile:     PEMHPatient
Id:          patient-pemh-profile
Parent:      Patient
Title:       "Perfil Paciente"
Description: "Utente a quem diz respeito a prescri????o de medica????o."

Profile:     PEMHEncounter
Id:          encounter-pemh-profile
Parent:      Encounter
Title:       "Perfil Epis??dio"
Description: "Recurso que caracteriza o epis??dio a partir do qual a prescri????o de medica????o est?? a ser solicitada."

Profile:     PEMHCoverage
Id:          coverage-pemh-profile
Parent:      Encounter
Title:       "Perfil Coverage"
Description: "Recurso utilizado para representar a rela????o entre benefici??rio (utente) e a entidade respons??vel. Este recurso ?? referenciado no recurso Patient numa extens??o pr??pria."


Profile:     PEMHLocation
Id:          location-pemh-profile
Parent:      Location
Title:       "Perfil Location"
Description: "Recurso utilizado para representar informa????o sobre o local de prescri????o da medica????o."


Profile:     PEMHbundleResponse
Id:          bundle-response-profile
Parent:      Bundle
Title:       "Perfil Bundle de mensagem de resposta"
Description: "O fluxo de prescri????o de medica????o ?? um fluxo s??ncronopara a aplica????o emissora."

