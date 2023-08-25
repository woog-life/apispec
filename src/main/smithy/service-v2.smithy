$version: "2"

namespace wooglife

use aws.protocols#restJson1

@cors
@restJson1
@httpBearerAuth
service Wooglife {
    version: "v3"
    resources: [
        Lake
        Temperature
        TemperatureExtrema
        TidalExtrema
    ]
}
