$version: "2"

namespace wooglife

use aws.protocols#restJson1

@documentation(
    """
    The heart of the woog-life API are lakes. Note that what we refer to as a "lake" might be any
    body of water, e.g. a river, a sea or even an ocean. In those examples, there may exist multiple
    "lakes" at different locations of one body of water.

    Note: Lakes cannot be created via the API.
    """
)
@cors
@restJson1
@httpBearerAuth
service Wooglife {
    version: "v3.1.0"
    resources: [
        Lake
        Temperature
        TemperatureExtrema
        TidalExtrema
    ]
}
