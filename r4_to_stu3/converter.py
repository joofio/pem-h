import json
from os import listdir

OUTPUT_FOLDER = "../input/profiles/"
INPUT_FOLDER = "fsh-generated/resources/"
EXTENSION_FOLDER = "../input/extensions/"
EXAMPLE_FOLDER = "../input/examples/"
VOCAB_FOLDER = "../input/vocabulary/"

# multiple elementsa
for file in listdir(INPUT_FOLDER):
    print(file)
    # n_file = file.split(".")[0]
    with open(INPUT_FOLDER + file) as jsonFile:
        data = json.load(jsonFile)
    if data.get("fhirVersion") is not None:
        data["fhirVersion"] = "3.0.2"
    restype = data.get("resourceType")
    print(restype)
    if restype == "StructureDefinition":
        type_ = data.get("type")
        if type_ == "Extension":
            pass
        else:
            with open(OUTPUT_FOLDER + file, "w") as file:
                json.dump(data, file)

    #  with open(EXTENSION_FOLDER + file, "w") as file:
    #      json.dump(data, file)
    elif data["resourceType"] == "ValueSet":
        pass
    # with open(VOCAB_FOLDER + file, "w") as file:
    #    json.dump(data, file)
    elif data["resourceType"] == "CodeSystem":
        pass
        # with open(VOCAB_FOLDER + file, "w") as file:
        #    json.dump(data, file)
    else:
        with open(EXAMPLE_FOLDER + file, "w") as file:
            json.dump(data, file)
