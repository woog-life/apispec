$version: "2"

namespace wooglife.v2

use wooglife.common#DateTime
use wooglife.common#Uuid

@deprecated(
    message: "The booking feature has been deprecated for removal.",
    since: "2023-04-07"
)
resource Booking {
    read: GetBookings
    update: PutBookings
}

@deprecated(
    message: "The booking feature has been deprecated for removal.",
    since: "2023-04-07"
)
@readonly
@auth([])
@http(method: "GET", uri: "/lake/{id}/booking")
operation GetBookings {
    input: LakeReference
    output: GetBookingsOutput
}

structure GetBookingsOutput {
    @required
    events: GetBookingEvents
}

list GetBookingEvents {
    member: GetBookingEvent
}

structure GetBookingEvent {
    @required
    varation: String
    @required
    bookingLink: String
    @required
    beginTime: DateTime
    @required
    endTime: DateTime
    @required
    saleStartTime: DateTime
}

@deprecated(
    message: "The booking feature has been deprecated for removal.",
    since: "2023-04-07"
)
@idempotent
@http(method: "PUT", uri: "/lake/{id}/booking", code: 204)
operation PutBookings {
    input: PutBookingsInput
}

structure PutBookingsInput {
    @httpLabel
    @required
    id: Uuid

    @httpPayload
    @required
    body: PutBookingsBody
}

structure PutBookingsBody {
    @required
    variation: String

    @required
    events: PutBookingEvents
}

list PutBookingEvents {
    member: PutBookingEvent
}

structure PutBookingEvent {
    @required
    bookingLink: String
    @required
    beginTime: DateTime
    @required
    endTime: DateTime
    @required
    saleStartTime: DateTime
    @required
    isAvailable: Boolean
}
