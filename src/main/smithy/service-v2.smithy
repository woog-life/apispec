$version: "2"

namespace wooglife.v2

use aws.protocols#restJson1

@cors
@restJson1
@httpBearerAuth
service Wooglife {
    version: "v2"
    resources: [
        Lake
        Temperature
        TemperatureExtrema
        Booking
    ]
}
