
local bit = require("bit")

local sm = setmetatable

local function infix(f)
  local mt = { __sub = function(self, b) return f(self[1], b) end }
  return sm({}, { __sub = function(a, _) return sm({ a }, mt) end })
end

shl = infix(function(a, b) return a*(2^b) end)
bnot = infix(function(a, b) return bit.bnot(a,b) end)
bor = infix(function(a, b) return bit.bor(a,b) end)
band = infix(function(a, b) return bit.band(a,b) end)
bxor = infix(function(a, b) return bit.bxor(a, b) end)
bnand = infix(function(a, b) return bit.bnand(a, b) end)