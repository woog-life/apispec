FORMAT: 1A9

## Data Structures

## LakeData (object)

+ time:               "2021-04-16T16:29:45.869" (string, required)
+ temperature:        9 (number, required)
+ preciseTemperature: "9.33" (string, required)

## LakeInfo (object)

+ id:   "69c8438b-5aef-442f-a70d-e0d783ea2b38" (string, required)
+ name: "Großer Woog" (string, required)

## Lake (LakeInfo)

+ data: {"time": "2021-04-16T16:29:45.869", temperature: 9, preciseTemperature: "9.33"} (LakeData)

## Lakes [/lake]

## Update lake [PUT /lake/{lake_uuid}]

+ Parameters
    + lake_uuid (string) - UUID of the lake to update
+ Request (application/json)
    + Headers

            Authorization: Bearer {token}
+ Response 200 (application/json)
