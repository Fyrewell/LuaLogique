
JSON = require("vendor.json")
inspect = require("vendor.inspect")

-- JSON to Lua table parse
print(inspect({ola='mundo'}))
print(inspect(JSON.decode('{"ola":"mundo"}')))

-- Lua table to JSON parse
print(inspect(JSON.encode({nums={1,2,3}})))

print("--------------")
--------------------------

function callBySharing1(p)
  p.num1 = p.num1 + 1
end

function callBySharing2(p)
  p = {num1=100}
end

local x = {num1=10}
y = x
callBySharing1(x)
print(x.num1)

callBySharing2(x)
print(x.num1)

print(y.num1)
callBySharing1(y)
print(x.num1)

callBySharing2(y)
print(y.num1)


