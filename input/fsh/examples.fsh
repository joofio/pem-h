
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
* entry[+].resource = ExemploRequestGroup
* entry[=].fullUrl =  "http://spms.min-saude.pt/fhir/RequestGroup/25f1ea48-e0ef-405e-86fc-498ae907f6df"
* entry[+].resource = ExemploMedicationRequest
* entry[=].fullUrl =  "http://spms.min-saude.pt/fhir/MedicationRequest/e22942f3-a461-40b9-8449-30f7a7e9d0d5"
* entry[+].resource = ExemploMedication
* entry[=].fullUrl =  "http://spms.min-saude.pt/fhir/Medication/a87cddf3-01de-4241-b9b2-7209f5f2bcab"
* entry[+].resource = ExemploPatient
* entry[=].fullUrl =  "http://spms.min-saude.pt/fhir/Patient/3616b380-01be-465a-aa29-906337c6e7a4"


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

Instance: ExemploMedicationRequest
InstanceOf: MedicationRequest
Description: "Exemplo 1 - Nova prescrição de medicação - MedicationRequest"

* id = "e22942f3-a461-40b9-8449-30f7a7e9d0d5"
* meta.lastUpdated = "2019-10-10T23:10:23+00:00"
* groupIdentifier.system = "http://spms.min-saude.pt/his/<id-rnuentidade>/identifiers/local-prescription-id"
* groupIdentifier.value = "6789342"
* status = #active
* intent = #order
* medicationReference.reference = "Medication/a87cddf3-01de-4241-b9b27209f5f2bcab"
* subject.reference = "Patient/3616b380-01be-465a-aa29906337c6e7a4"
//* context.reference = "Encounter/2d3f8e19-205e-40c6-aeec7b17cbef8045"
* authoredOn = "2019-07-14T23:10:23+00:00"
//* requester.agent.reference = "Practitioner/f644ab44-7e32-4e05972c-1f14bebf27a8"
//* requester.agent.display = "Dr. António da Cruz"
//* onBehalfof.reference = "Organization/dec4d0d7-b8dd-4c6f9c7e-71ca0ee53ace"
* note.text = "Informação sobre a prescrição"
* dosageInstruction
  * text = "500 mg daily for 5 days"
  * timing.repeat.boundsPeriod.start =  "2019-07-16"
  * timing.repeat.boundsPeriod.end = "2019-07-30"
  * timing.repeat.timeOfDay = "09:00:00"
  * route.coding.system = "http://www.infarmed.pt"
  * route.coding.code = #255560000
  * route.coding.display = "Intravenous"
  * doseAndRate.doseQuantity.value = 400
  * doseAndRate.doseQuantity.unit = "mg"
  * doseAndRate.doseQuantity.system = "https://www.infarmed.pt"
  * doseAndRate.doseQuantity.code = #mg
* dispenseRequest.quantity.value = 30
* dispenseRequest.quantity.unit = "TAB"
* dispenseRequest.quantity.code = #TAB
* dispenseRequest.quantity.system = "https://www.infarmed.pt"

Instance: ExemploMedication
InstanceOf: Medication
Description: "Exemplo 1 - Nova prescrição de medicação - Medication"

* id = "a87cddf3-01de-4241-b9b2-7209f5f2bcab"
* code = http://infarmed.pt#10007274 "Ibuprofeno 600 mg Comp"
* form = http://www.infarmed.pt#10219000 "Comprimido"


Instance: ExemploPatient
InstanceOf: Patient
Description: "Exemplo 1 - Nova prescrição de medicação - Patient"

* id = "3616b380-01be-465a-aa29-906337c6e7a4"
* meta.lastUpdated = "2019-01-14T23:10:23+00:00"
* identifier.type.coding.system =  "http://h17.org/fhir/v2/0203"
* identifier.type.coding.display =  "Health Card Number"
* identifier.type.coding.code = #HC
* identifier.type.text = "NNU"
* identifier.system = "http://spms.min-saude.pt/rnu/identifiers/patient-id"
* identifier.value = "11920641576"
* name.text = "Pedro Alvares Cabral"
* name.given = "Pedro"
* name.family = "Cabral"
* gender = #male
* birthDate = "1979-11-19"
* telecom.system = #email
* telecom.value = "PedroAlvaresCabral@dominio.pt"


Instance: ExemploEncounter
InstanceOf: Encounter
Description: "Exemplo 1 - Nova prescrição de medicação - Encounter"

* id = "2d3f8e19-205e-40c6-aeec7b17cbef8045"
* identifier.system = "http://spms.min-saude.pt/iop/identifiers/encounter"
* identifier.value = "1243546"
* status = #in-progress
* class = http://hl7.org/fhir/v3/ActCode#EMER "Emergency"
* subject.reference = "Patient/3616b380-01be-465a-aa29-906337c6e7a4"
* participant.individual.reference = "Practitioner/f644ab44-7e324e05-972c-1f14bebf27a8"
* period.end = "2019-01-27"
