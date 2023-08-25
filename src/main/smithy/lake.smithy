$version: "2"

namespace wooglife

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
