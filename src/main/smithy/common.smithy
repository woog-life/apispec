$version: "2"

namespace wooglife.common

string Uuid

@timestampFormat("date-time")
timestamp DateTime

@documentation("An ISO 3166-1 alpha-2 country code (in upper case).")
@length(min: 2, max: 2)
string Region
