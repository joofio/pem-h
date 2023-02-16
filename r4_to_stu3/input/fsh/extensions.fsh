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


Extension: teste
Id:       test
Title:    "NÚMERO DE VIAS"
Description: "Via da receita no caso de ser renovável (1, 2, 3, ...)."
* value[x] only positiveInt
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-dosage-instruction"


Extension: med-prescription-frequency-time
Id:       med-prescription-frequency-time
Title:    "FREQUENCIA E HORARIO"
Description: "Indica a frequência e horário de toma do medicamento definidos pelo CTC."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionFrequencyTimeVS (required)
// ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-dosage-instruction"


Extension: med-prescription-duration
Id:       med-prescription-duration
Title:    "DURACAO - VALOR E UNIDADE"
Description: "Indica a duração de tratamento da posologia - Valor e Unidade"
* value[x] only Quantity
* value[x] from MedPrescriptionDurationVS (required)
// ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-dosage-instruction"


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
Description: "Sub-extensão relativa ao Tipo de Enquadramento."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionFramingDispenseVS (required)
* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-framing-dispense"

Extension: med-prescription-legal-diploma
Id:       med-prescription-legal-diploma
Title:    "CÓDIGO E DESCRIÇÃO DO DIPLOMA"
Description: "Sub-extensão relativa ao Diploma Legal que estabelece o regime especial ou excecional de comparticipação."
* value[x] only CodeableConcept
* value[x] from MedPrescriptionFramingDispenseVS (required)
//* ^url = "http://spms.min-saude.pt/iop/extensions/med-prescription-framing-dispense"

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



