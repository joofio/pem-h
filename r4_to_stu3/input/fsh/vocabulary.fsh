ValueSet: EventagsVS

ValueSet: EventCodeVS

CodeSystem: MeaningOrderCS
* ^url =   http://spms.min-saude.pt/bdnp/codesystem/med-request-modality

* #RSP
"Receita sem papel"
* #RCP
"Receita com papel"


ValueSet: MeaningOrderVS
* include codes from system MeaningOrderCS



ValueSet: MedPrescriptionFrequencyTimeVS
* include codes from system MeaningOrderCS

ValueSet: MedPrescriptionDurationVS
* include codes from system MeaningOrderCS


ValueSet: MedPrescriptionTypeVS
* include codes from system MeaningOrderCS

ValueSet: MedPrescriptionCancelReasonVS
* include codes from system MeaningOrderCS

ValueSet: MedPrescriptionFramingDispenseVS
* include codes from system MeaningOrderCS
