
JSON = require("vendor.JSON")
inspect = require("vendor.inspect")

-- JSON to Lua table parse
print(inspect({ola='mundo'}))
print(inspect(JSON:decode('{"ola":"mundo"}')))

-- Lua table to JSON parse
print(inspect(JSON:encode({nums={1,2,3}})))

