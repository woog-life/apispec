namespace wooglife.v2

use wooglife.common#DateTime
use wooglife.common#Uuid
use wooglife.common#NoContent

resource Temperature {
    read: GetTemperature,
    update: PutTemperature,

}

@documentation(
    """
    Get the temperature of a specific lake.

    The temperature can be retrieved for a specific point in time using the `at` paramter. If no time is requested, the
    latest data is returned.
    """
)
@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/temperature")
operation GetTemperature {
    input: GetTemperatureInput,
    output: TemperatureData,
}

structure GetTemperatureInput {
    @httpLabel
    @required
    id: Uuid,

    @httpQuery("at")
    time: DateTime,

    @httpQuery("precision")
    precision: Precision,
}

structure TemperatureData {
    @documentation("The exact time of the temperature measurement.")
    @required
    time: DateTime,
    @required
    temperature: PrimitiveInteger,
    @required
    preciseTemperature: String,
}

@idempotent
@http(method: "PUT", uri: "/lake/{id}/temperature", code: 204)
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

@range(min: 0, max: 5)
integer Precision


resource TemperatureExtrema {
    read: GetTemperatureExtrema,
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/temperature/extrema")
operation GetTemperatureExtrema {
    input: GetTemperatureExtremaInput,
    output: GetTemperatureExtremaOutput,
}

structure GetTemperatureExtremaInput {
    @httpLabel
    @required
    id: Uuid,

    @httpQuery("precision")
    precision: Precision,
}

structure GetTemperatureExtremaOutput {
    min: TemperatureData,
    max: TemperatureData,
}
