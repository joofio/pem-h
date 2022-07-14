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
Title:       "Perfil Conteudo Receita"
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
* extension[MeaningOrder].valueCodeableConcept.coding.system = "http://spms.min-saude/pe/top/extensions/med-request-modality"

Profile:     PEMHMedicationRequest
Id:          med-request-profile
Parent:      MedicationRequest
Title:       "Perfil informação de receita"
Description: "Este recurso contém informações da linha da receita."

* id 1..1 MS
* groupIdentifier 1..1 MS
* status 1..1
* intent = #order
* medication[x] only Reference(PEMHMedication)
* authoredOn 1..1


Profile:     PEMHMedication
Id:          med-pemh-profile
Parent:      Medication
Title:       "Perfil Medicação"
Description: "Este recurso representa o medicamento que é referenciado pelo recurso MedicationRequest."

Profile:     PEMHPatient
Id:          patient-pemh-profile
Parent:      Patient
Title:       "Perfil Paciente"
Description: "Utente a quem diz respeito a prescrição de medicação."

Profile:     PEMHEncounter
Id:          encounter-pemh-profile
Parent:      Encounter
Title:       "Perfil Episódio"
Description: "Recurso que caracteriza o episódio a partir do qual a prescrição de medicação está a ser solicitada."

Profile:     PEMHCoverage
Id:          coverage-pemh-profile
Parent:      Encounter
Title:       "Perfil Coverage"
Description: "Recurso utilizado para representar a relação entre beneficiário (utente) e a entidade responsável. Este recurso é referenciado no recurso Patient numa extensão própria."


Profile:     PEMHLocation
Id:          location-pemh-profile
Parent:      Location
Title:       "Perfil Location"
Description: "Recurso utilizado para representar informação sobre o local de prescrição da medicação."


Profile:     PEMHbundleResponse
Id:          bundle-response-profile
Parent:      Bundle
Title:       "Perfil Bundle de mensagem de resposta"
Description: "O fluxo de prescrição de medicação é um fluxo síncronopara a aplicação emissora."


// @Name: Instance Example
// @Description: An example of an instance of a Patient resource

Instance: Exemplo
InstanceOf: Bundle
Description: "Exemplo 1 - Nova prescrição de medicação"

* id = "7898e419-6983-4afc-8163-a19274a12290"
* meta.lastUpdated =  "2019-10-10T23:10:23+00:00"
* meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescription-synchronization/v1-0-3"
* type = #message
* entry[0]
  * fullUrl = "http://spms.min-saude.pt/fhir/MessageHeader/db6428bf-1e58-48d4-9102-b85d6c716bb1"
  * resource
    * resourceType = "MessageHeader" 
    * id = "db6428bf-1e58-48d4-9102-b85d6c716bb1"
    * meta.profile = "http://spms.min-saude.pt/fhir/iop/profiles/med-prescription-synchronization-msh/v1-0-3"
    * meta.lastUpdated = "2019-10-10T23:10:23+00:00"
    * meta.tag.system = "http://spms.min-saude.pt/iop/event-meta-tags"
    * meta.tag.code = #10911
    * meta.tag.display = "MED PRESCRIPTION NEW"
   // * event.system =  "http://spms.min-saude.pt/iop/events" #stu3 is not supported by SUSHI
   // * event.code = #10724
   // * event.display = "MED PRESCRIPTION SYNCHRONIZATION"
    * destination.name = "PEMH"
    * destination.endpoint = "SPMS/PEMH"
    * destination.receiver.reference = "Organization/dec4d0d7-b8dd-4c6f-9c7e-71ca0ee53ace"
    * destination.receiver.display = "Organização Origem"
    * sender.reference = "Organization/dec4d0d7-b8dd-4c6f-9c7e-71ca0ee53ace"
    * sender.display = "Organização Origem"
    // * timestamp = "2019-07-14T23:10:23+00:00"
    * source.name = "Aplicação Origem"
    * source.endpoint = "Endpont_Aplicação_Origem"
    * focus.reference = "RequestGroup/25f1ea48-e0ef-405e86fc-498ae907f6df"
  * fullUrl =  "http://spms.min-saude.pt/fhir/RequestGroup/25f1ea48-e0ef-405e-86fc-498ae907f6df"
* entry[+].resource = ExemploRequestGroup

Instance: ExemploRequestGroup
InstanceOf: PEMHContent
Description: "Exemplo 1 - Nova prescrição de medicação - RequestGroup"

* id = "25f1ea48-e0ef-405e-86fc-498ae907f6df"
* meta.lastUpdated = "2019-10-10T23:10:23+00:00"
* groupIdentifier.system = "http://spms.min-saude.pt/his/<id-rnu-entidade>/identifiers/local-prescription-id"
* groupIdentifier.value = "6789342"
* status = #active
* intent = #order
* extension[duplicateOrder].valuePositiveInt = 1
* extension[MeaningOrder].valueCodeableConcept.coding.code = #RSP
* extension[MeaningOrder].valueCodeableConcept.coding.display  =  "Receita sem Papel"
//* action.label = 1
* action.timingPeriod.end = "2019-01-27"
