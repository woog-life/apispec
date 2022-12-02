$version: "2"

namespace wooglife.v2

use wooglife.common#DateTime
use wooglife.common#Region
use wooglife.common#Uuid

resource Temperature {
    read: GetTemperature
    update: PutTemperature

}

@documentation(
    """
    Get the temperature of a specific lake.

    The temperature can be retrieved for a specific point in time using the `at` paramter.
    If no time is requested, the latest data is returned.
    """
)
@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/temperature")
operation GetTemperature {
    input: GetTemperatureInput
    output: TemperatureData
}

apply GetTemperature @examples([
    {
        title: "Get latest Woog temperature with three digits of precision formatted for Germany"
        input: {
            id: "69c8438b-5aef-442f-a70d-e0d783ea2b38"
            precision: 3
            formatRegion: "DE"
        }
        output: {
            time: "2022-12-02T14:28:46.926Z"
            temperature: 6
            preciseTemperature: "6,182"
        }
    }
])

structure GetTemperatureInput {
    @httpLabel
    @required
    id: Uuid

    @httpQuery("at")
    time: DateTime

    @httpQuery("precision")
    precision: Precision

    @documentation("The region the precise temperature should be formatted for.")
    @httpQuery("formatRegion")
    formatRegion: Region = "US"
}

structure TemperatureData {
    @documentation("The exact time of the temperature measurement.")
    @required
    time: DateTime
    @required
    temperature: Integer
    @required
    preciseTemperature: String
}

@idempotent
@http(method: "PUT", uri: "/lake/{id}/temperature", code: 204)
operation PutTemperature {
    input: PutTemperatureInput
}

structure PutTemperatureInput {
    @httpLabel
    @required
    id: Uuid

    @httpPayload
    @required
    body: PutTemperatureBody
}

structure PutTemperatureBody {
    @required
    time: DateTime

    @required
    temperature: Double
}

@range(min: 0, max: 5)
integer Precision


resource TemperatureExtrema {
    read: GetTemperatureExtrema
}

@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/temperature/extrema")
operation GetTemperatureExtrema {
    input: GetTemperatureExtremaInput
    output: GetTemperatureExtremaOutput
}

structure GetTemperatureExtremaInput {
    @httpLabel
    @required
    id: Uuid

    @httpQuery("precision")
    precision: Precision

    @documentation("The region the precise temperature should be formatted for.")
    @httpQuery("formatRegion")
    formatRegion: Region = "US"
}

structure GetTemperatureExtremaOutput {
    min: TemperatureData
    max: TemperatureData
}
