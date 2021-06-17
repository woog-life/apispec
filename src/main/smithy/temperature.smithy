namespace wooglife.v2

use wooglife.common#DateTime
use wooglife.common#Uuid

resource Temperature {
    read: GetTemperature,
    update: PutTemperature,
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/temperature")
operation GetTemperature {
    input: GetTemperatureInput,
    output: GetTemperatureOutput,
}

structure GetTemperatureInput {
    @httpLabel
    @required
    id: Uuid,

    @httpQuery("at")
    time: DateTime,
}

structure GetTemperatureOutput {
    @required
    time: DateTime,
    @required
    temperature: PrimitiveInteger,
    @required
    preciseTemperature: String,
}

@idempotent
@http(method: "PUT", uri: "/lake/{id}/temperature")
operation PutTemperature {
    input: PutTemperatureInput,
}

structure PutTemperatureInput {
    @httpLabel
    @required
    id: Uuid,

    @httpPayload
    @required
    body: PutTemperatureBody,
}

structure PutTemperatureBody {
    @required
    time: DateTime,

    @required
    temperature: PrimitiveDouble
}
