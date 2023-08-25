$version: "2"

namespace wooglife

@documentation(
    """
    Tidal extrema (low and high tide) for 'lakes'.
    Note that this resource is only available if the lake supports the `tides` feature.
    """
)
resource TidalExtrema {
    read: GetTidalExtrema
    update: PutTidalExtrema
}

@documentation(
    """
    Get information about upcoming tidal extrema for a lake.
    The first result will always be the extremum **before** the requested time.
    """
)
@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/tides")
operation GetTidalExtrema {
    input: GetTidalExtremaInput
    output: GetTidalExtremaOutput
}

structure GetTidalExtremaInput {
    @documentation("A lake ID. The lake must support the `tides` feature.")
    @httpLabel
    @required
    id: Uuid

    @documentation(
        """
        The time for which to return the next tidal extrema.
        The first result will be before that time.

        Defaults to the current time.
        """
    )
    @httpQuery("at")
    time: DateTime

    @documentation("The amount of upcoming extrema that should be returned.")
    @httpQuery("upcomingLimit")
    @range(min: 1, max: 20)
    upcomingLimit: Integer
}

structure GetTidalExtremaOutput {
    @documentation("A list of tidal extrema, sorted by time in ascending order")
    @required
    extrema: TidalExtremumDataList
}

@documentation(
    """
    Update the tidal extrema for a lake.

    Existing tidal information will be replaced if it conflicts with the provided information, but
    will otherwise be preserved.

    The provided information **must** cover a contiguous time frame, because the API will assume
    that the given data is the only correct data for the time between the first and last input.
    If you provide noncontiguous data, existing data inbetween your data points will be lost.
    """
)
@idempotent
@http(method: "PUT", uri: "/lake/{id}/tides", code: 204)
operation PutTidalExtrema {
    input: PutTidalExtremaInput
}

structure PutTidalExtremaInput {
    @documentation("A lake ID. The lake must support the `tides` feature.")
    @httpLabel
    @required
    id: Uuid

    @required
    @length(min: 2)
    extrema: TidalExtremumDataList
}

list TidalExtremumDataList {
    member: TidalExtremumData
}

structure TidalExtremumData {
    @documentation("Whether the extremum is a high tide (false means low tide)")
    @required
    isHighTide: Boolean
    @documentation("The (expected) time of the extremum.")
    @required
    time: DateTime
    @documentation("Water height in meters.")
    @required
    height: WaterHeight
}

string WaterHeight
