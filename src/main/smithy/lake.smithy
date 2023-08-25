$version: "2"

namespace wooglife

@documentation(
    """
    Lakes are the heart of the woog-life API. Not that what we refer to as a "lake" might be any
    body of water, e.g. a river, a sea or even an ocean. In those examples, there may exist multiple
    "lakes" at different locations of one body of water.

    Note: Lakes cannot be created via the API.
    """
)
resource Lake {
    identifiers: { id: Uuid }

    read: GetLake
    list: ListLakes
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}")
operation GetLake {
    input: LakeReference
    output: LakeOutput
}

@references([{resource: Lake}])
structure LakeReference {
    @httpLabel
    @required
    id: Uuid
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake")
operation ListLakes {
    output: ListLakesOutput
}

structure ListLakesOutput {
    @required
    lakes: Lakes
}

list Lakes {
    member: LakeOutput
}

structure LakeOutput {
    @required
    id: Uuid
    @required
    name: String
    @required
    supportedFeatures: FeatureSet
}

@uniqueItems
list FeatureSet {
    member: Feature
}

enum Feature {
    TEMPERATURE= "temperature"
    TIDES= "tides"
}
