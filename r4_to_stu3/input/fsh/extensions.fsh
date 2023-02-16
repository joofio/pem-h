Extension: MeaningOrder
Id:        meaning-order
Title:    "MODALIDADE DE PRESCRIÇÃO"
Description: "Receita com papel (RCP) ou receita sem papel (RSP)."
* value[x] only CodeableConcept
* value[x] from MeaningOrderVS (required)
* ^url = "http://spms.min-saude/pe/top/extensions/med-request-modality"


Extension: PrescriptionDuplicate
Id:        prescription-duplicate
Title:    "NÚMERO DE VIAS"
Description: "Via da receita no caso de ser renovável (1, 2, 3, ...)."
* value[x] only positiveInt
* ^url = "http://spms.min-saude.pt/iop/extensions/prescription-duplicate"

Extension: MedPrescriptionDosageLine
Id:        med-prescription-dosage-line
Title:    "NÚMERO DE VIAS"
Description: "Via da receita no caso de ser renovável (1, 2, 3, ...)."
* value[x] only positiveInt
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-dosage-line"


Extension: med-prescription-dosage-instruction
Id:       med-prescription-dosage-instruction
Title:    "FREQ+HORÁRIO"
Description: "Extensões referentes a frequência e horário de toma do medicamento e a duração de tratamento da posologia em valor e unidade."
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-dosage-instruction"
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open


* extension contains med-prescription-frequency-time named med-prescription-frequency-time 1..1 
* extension contains med-prescription-duration named med-prescription-duration 1..1


Extension: med-prescription-frequency-time
Id:       med-prescription-frequency-time
Title:    "FREQUENCIA E HORARIO"
Description: "Indica a frequência e horário de toma do medicamento definidos pelo CTC."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionFrequencyTimeVS (required)
* ^url = "med-prescription-frequency-time"

Extension: med-prescription-duration
Id:       med-prescription-duration
Title:    "DURACAO - VALOR E UNIDADE"
Description: "Indica a duração de tratamento da posologia - Valor e Unidade"
* value[x] only Quantity
* value[x] from MedPrescriptionDurationVS (required)
* ^url = "med-prescription-duration"


Extension: presc-print
Id:       presc-print
Title:    "IMPRESSÃO"
Description: "Indicar se a receita foi impressa"
* value[x] only boolean
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-print"

Extension: presc-administration
Id:       presc-administration
Title:    "ADMINISTRAÇÃO"
Description: "Indicar se a prescrição é para administração interna ou SFH; true: administração interna; false: SFH"
* value[x] only boolean
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-internal-administration"


Extension: presc-transcription
Id:       presc-transcription
Title:    "RECEITA MANUSCRITA"
Description: "Indicar se trata-se de uma transcrição de uma receita manuscrita."
* value[x] only boolean
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-transcript"

Extension: presc-type
Id:       presc-type
Title:    "TIPO DE RECEITA"
Description: "Tipo de prescrição: e.g.: FH, RE, BIO ou OUT."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionTypeVS (required)
* ^url = "http://spms.min-saude.pt/iop/extensions/med-request-type"


Extension: presc-local
Id:       presc-local
Title:    "LOCAL"
Description: "Referência para um resource que contém informações do local de prescrição"
* value[x] only Reference(Location)
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-local"



Extension: med-prescription-framing-dispense
Id:       med-prescription-framing-dispense
Title:    "Tipo enquadramento"
Description: "Extensões referentes ao enquadramento da dispensa"
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open


* extension contains med-prescription-legal-diploma named med-prescription-legal-diploma 0..1 
* extension contains meaning-order named MeaningOrder 0..1

* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-framing-dispense"


Extension: med-prescription-framing-type
Id:       med-prescription-framing-type
Title:    "CÓDIGO E DESCRIÇÃO DO DIPLOMA"
Description: "Sub-extensão relativa ao Diploma Legal que estabelece o regime especial ou excecional de comparticipação."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionFramingTypeVS (required)
* ^url = "med-prescription-framing-type"


Extension: med-prescription-legal-diploma
Id:       med-prescription-legal-diploma
Title:    "CÓDIGO E DESCRIÇÃO DO DIPLOMA"
Description: "Sub-extensão relativa ao Diploma Legal que estabelece o regime especial ou excecional de comparticipação."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionLegalDiplomaVS (required)
* ^url = "med-prescription-legal-diploma"



Extension: med-prescription-cancel-reason
Id:       med-prescription-cancel-reason
Title:    "MOTIVO ANULAÇÃO"
Description: "Motivo de anulação da receita."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionCancelReasonVS (required)
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-cancel-reason"

Extension: med-cost
Id:       med-cost
Title:    "Custo"
Description: "Extensão referente ao valor e a moeda da terapêutica"
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains med-currency named med-currency 1..1 
* extension contains med-value named med-value 1..1 
* ^url = "http://spms.min-saude.pt/iop/extensions/med-cost"

Extension: med-currency
Id:       med-currency
Title:    "MOEDA"
Description: "Sub-extensão referente a moeda"
* value[x] only CodeableConcept
* value[x] from urn:iso:std:iso:4217 (required)
* ^url = "med-currency"



Extension: med-value
Id:       med-value
Title:    "VALOR"
Description: "Sub-extensão referente ao valor da terapêutica"
* value[x] only decimal
* ^url = "med-value"



/// PATIENT EXTENSIONS ////

Extension: ptAddress
Id:       ptAddress
Title:    "Custo"
Description: "Extensão referente ao valor e a moeda da terapêutica"
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains ptaddressType named ptaddressType 0..1 
* extension contains ptstreetType named ptstreetType 0..1 
* extension contains ptstreet named ptstreet 0..1 
* extension contains ptbuildingType named ptbuildingType 0..1 
* extension contains ptdoorNumber named ptdoorNumber 0..1 
* extension contains ptdoorSide named ptdoorSide 0..1 
* extension contains ptfloor named ptfloor 0..1 
* extension contains ptplace named ptplace 0..1 
* extension contains ptlocality named ptlocality 0..1 
* extension contains ptstate named ptstate 0..1 
* extension contains ptparish named ptparish 0..1 
* extension contains foreignPostalCode named foreignPostalCode 0..1 
* extension contains ptpostalCode named ptpostalCode 0..1 
* extension contains foreignDistrict named foreignDistrict 0..1 
* extension contains foreignCity named foreignCity 0..1 

* extension contains foreignAddress named foreignAddress 0..1 
* extension contains foreignRegion named foreignRegion 0..1 
* extension contains foreignCountry named foreignCountry 0..1 

* ^url = "http://spms.min-saude.pt/rnu/extensions/address"


Extension: ptaddressType
Id:       ptaddressType
Title:    "VALOR"
Description: "Sub-extensão para o tipo de morada"
* value[x] only Coding
* value[x] from AddressTypeVS (required)
* ^url = "address-type"


Extension: ptstreetType
Id:       ptstreetType
Title:    "VALOR"
Description: "Sub-extensão para o Tipo de via"
* value[x] only CodeableConcept
* ^url = "street-type"

Extension: ptstreet
Id:       ptstreet
Title:    "VALOR"
Description: "Sub-extensão para o Nome da via"
* value[x] only string
* ^url = "street"


Extension: ptbuildingType
Id:       ptbuildingType
Title:    "VALOR"
Description: "Sub-extensão para o Tipo de Edificio"
* value[x] only CodeableConcept
* ^url = "building-type"

Extension: ptdoorNumber
Id:       ptdoorNumber
Title:    "VALOR"
Description: "Sub-extensão para o Número da porta"
* value[x] only string
* ^url = "door-number"

Extension: ptdoorSide
Id:       ptdoorSide
Title:    "VALOR"
Description: "Sub-extensão para o Tipo de lado da porta"
* value[x] only CodeableConcept
* ^url = "door-side"

Extension: ptfloor
Id:       ptfloor
Title:    "VALOR"
Description: "Sub-extensão para o Andar"
* value[x] only string
* ^url = "floor"


Extension: ptplace
Id:       ptplace
Title:    "VALOR"
Description: "Sub-extensão para o Lugar"
* value[x] only string
* ^url = "place"

Extension: ptlocality
Id:       ptlocality
Title:    "VALOR"
Description: "Sub-extensão para a Localidade"
* value[x] only string
* ^url = "locality"


Extension: ptstate
Id:       ptstate
Title:    "VALOR"
Description: "Sub-extensão para o Distrito"
* value[x] only CodeableConcept
* ^url = "state"

Extension: ptcity
Id:       ptcity
Title:    "VALOR"
Description: "Sub-extensão para o Concelho"
* value[x] only CodeableConcept
* ^url = "city"


Extension: ptparish
Id:       ptparish
Title:    "VALOR"
Description: "Sub-extensão para a Freguesia"
* value[x] only CodeableConcept
* ^url = "parish"

Extension: ptpostalCode
Id:       ptpostalCode
Title:    "VALOR"
Description: "Sub-extensão para código postal"
* value[x] only CodeableConcept
* ^url = "parish"

Extension: foreignAddress
Id:       foreignAddress
Title:    "VALOR"
Description: "Sub-extensão para o endereço da morada no estrangeiro"
* value[x] only string
* ^url = "foreign-address"

Extension: foreignRegion
Id:       foreignRegion
Title:    "VALOR"
Description: "Sub-extensão para Região no estrangeiro"
* value[x] only string
* ^url = "foreign-region"


Extension: foreignCity
Id:       foreignCity
Title:    "VALOR"
Description: "Sub-extensão para a Cidade no estrangeiro"
* value[x] only string
* ^url = "foreign-city"


Extension: foreignDistrict
Id:       foreignDistrict
Title:    "VALOR"
Description: "Sub-extensão para a Localidade no estrangeiro"
* value[x] only string
* ^url = "foreign-district"

Extension: foreignPostalCode
Id:       foreignPostalCode
Title:    "VALOR"
Description: "Sub-extensão para a Código Postal no estrangeiro"
* value[x] only string
* ^url = "foreign-postal-code"


Extension: foreignCountry
Id:       foreignCountry
Title:    "VALOR"
Description: "Sub-extensão para o País Estrangeiro"
* value[x] only CodeableConcept
* value[x] from urn:iso:std:iso:3166 (required)
* ^url = "country"




Extension: contactObservations
Id:       contactObservations
Title: "Observações relacionadas com o bloco dos contactos do Utente"
Description:    "Extensão para Observações relacionadas com o bloco dos contactos do Utente"

* value[x] only string
* ^url = "http://spms.min-saude.pt/rnu/extensions/contact-observations"

Extension: contactPreference
Id:       contactPreference
Title:    "Contacto preferencial"
Description: "Extensão para informar se o contacto atual é o preferencial"
* value[x] only boolean
* ^url = "http://spms.min-saude.pt/rnu/extensions/preferred-contact"


Extension: ptOccupation
Id:       ptOccupation
Title:    "Contacto preferencial"
Description: "Extensão para a profissão do utente"
* ^url = "http://spms.min-saude.pt/rnu/extensions/occupation"
* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains ptOccupationCode  named ptOccupationCode 0..1 
* extension contains ptOccupationStatus  named ptOccupationStatus 0..1 
* extension contains ptOccupationEducation  named ptOccupationEducation 0..1 



Extension: ptOccupationCode
Id:       ptOccupationCode
Title:    "profissão"
Description: "Sub-extensão que corresponde à Profissão"
* value[x] only CodeableConcept
* ^url = "code"


Extension: ptOccupationStatus
Id:       ptOccupationStatus
Title:    "profissão"
Description: "Sub-extensão que corresponde à Situação da Profissão"
* value[x] only CodeableConcept
* ^url = "status"

Extension: ptOccupationEducation
Id:       ptOccupationEducation
Title:    "profissão"
Description: "Sub-extensão para as Habilitações Literárias do utente"
* value[x] only CodeableConcept
* ^url = "education"


Extension: ptFilliation
Id:       ptFilliation
Title:    "Filiação do utente"
Description: "Extensão Filiação do utente"
* ^url = "http://spms.min-saude.pt/rnu/extensions/patient-parents"

* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains ptFilliationMother  named ptFilliationMother 0..1 
* extension contains ptFilliationFather  named ptFilliationFather 0..1 


Extension: ptFilliationMother
Id:       ptFilliationMother
Title:    "Mãe"
Description: "Sub-extensão para indicar a mãe"
* value[x] only Reference(RelatedPerson)
* ^url = "mother"

Extension: ptFilliationFather
Id:       ptFilliationFather
Title:    "Pai"
Description: "Sub-extensão para indicar o pai"
* value[x] only Reference(RelatedPerson)
* ^url = "father"



Extension: ptPatientOtherInfo
Id:       ptPatientOtherInfo
Title:    "OUTRA INDICAÇÃO"
Description: "Extensão referente a informações sobre o utente"
* ^url = "http://spms.min-saude.pt/iop/extensions/med-patient-info"
* value[x] only string


//// ENCOUNTER ////


Extension: episodeServiceSpecialty
Id:       episodeServiceSpecialty
Title:    "CÓDIGO ESPECIALIDADE CONSULTA"
Description: "Extensão para indicar o código e a descrição da especialidade médica da consulta ou da prestação"
* ^url = "http://spms.min-saude.pt/iop/extensions/episode-service-specialty"
* value[x] only CodeableConcept
* value[x] from episodeServiceSpecialtyVS (required)


Extension: nextAppointmentDate
Id:       nextAppointmentDate
Title:    "DATA PROXIMA CONSULTA"
Description: "Extensão para indicar a data e hora da próxima consulta da mesma especialidade no mesmo âmbito da emissão da prescrição"
* ^url = "http://spms.min-saude.pt/iop/extensions/next-specialty-appointment-date"
* value[x] only dateTime


/// COVERAGE ////


Extension: CardInfo
Id:       CardInfo
Title:    "Informações sobre o cartão do beneficiário relativo a entidade"
Description: "Extensão para indicar a data e hora da próxima consulta da mesma especialidade no mesmo âmbito da emissão da prescrição"
* ^url = "http://spms.min-saude.pt/iop/extensions/coverage-card-info"

* extension 0..* MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains CardInfoType  named CardInfoType 0..1 
* extension contains CardCountry  named CardCountry 0..1 



Extension: CardInfoType
Id:       CardInfoType
Title:    "Tipo de documento de direito. Exemplo: CESD"
Description: "Sub-extensão para indicar o tipo de documento de direito"
* value[x] only CodeableConcept
* value[x] from CardInfoTypeVS (required)
* ^url = "card-type"

Extension: CardCountry
Id:       CardCountry
Title:    "País emissor do documento de direito"
Description: "SuSub-extensão para indicar o país emissor do documento de direito"
* value[x] only CodeableConcept
* value[x] from CardCountryVS (required)
* ^url = "card-country"