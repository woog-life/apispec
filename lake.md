FORMAT: 1A9

# wooglife

## Data Structures

## LakeData (object)

+ time:               `2021-04-16T16:29:45.869` (string, required)
+ temperature:        9 (number, required)
+ preciseTemperature: `9.33` (string, required)

## LakeInfo (object)

+ id:   `69c8438b-5aef-442f-a70d-e0d783ea2b38` (string, required)
+ name: "Großer Woog" (string, required)

## Lake (LakeInfo)

+ data (LakeData)

## Lakes

### List lakes [GET /lake]
+ Response 200 (application/json)
    + Attributes (array[LakeInfo])

### Specific lake [/lake/{lake_uuid}]

#### Get specific lake [GET]

+ Response 200 (application/json)
+ Parameters
    + lake_uuid (string) - UUID of the lake to get data for
+ Attributes (Lake)

### Update lake [PUT]

+ Parameters
    + lake_uuid (string) - UUID of the lake to update
+ Request (application/json)
    + Headers

            Authorization: Bearer {token}
+ Response 200 (application/json)
