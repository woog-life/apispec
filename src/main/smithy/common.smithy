$version: "2"

namespace wooglife

string Uuid

@documentation("A timestamp in ISO-8601 format. Must always be given in UTC timezone.")
@timestampFormat("date-time")
timestamp UtcDateTime

@documentation("A timestamp in ISO-8601 format. Note that this does explicitly allow offsets.")
@timestampFormat("date-time")
timestamp DateTime

@documentation("An ISO 3166-1 alpha-2 country code (in upper case).")
@length(min: 2, max: 2)
string Region
