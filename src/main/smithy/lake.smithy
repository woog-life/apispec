namespace wooglife.v2

use wooglife.common#Uuid

resource Lake {
    identifiers: { id: Uuid },

    read: GetLake,
    list: ListLakes,
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}")
operation GetLake {
    input: LakeReference,
    output: LakeOutput,
}

@references([{resource: Lake}])
structure LakeReference {
    @httpLabel
    @required
    id: Uuid,
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake")
operation ListLakes {
    output: ListLakesOutput,
}

structure ListLakesOutput {
    @required
    lakes: Lakes,
}

list Lakes {
    member: LakeOutput,
}

structure LakeOutput {
    @required
    id: Uuid,
    @required
    name: String,
    @required
    supportedFeatures: FeatureSet
}

set FeatureSet {
    member: Feature
}

@enum([
    {
        value: "temperature",
        name: "TEMPERATURE",
    },
    {
        value: "booking",
        name: "BOOKING",
    }
])
string Feature
