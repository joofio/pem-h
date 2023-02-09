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

