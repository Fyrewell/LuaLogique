
local sm = setmetatable

local function infix(f)
  local mt = { __sub = function(self, b) return f(self[1], b) end }
  return sm({}, { __sub = function(a, _) return sm({ a }, mt) end })
end

function bitnot(x)
    return x == 0 and 1 or 0
end

bitor = infix(function(a, b) return (a==1 or b==1) and 1 or 0 end)
bitand = infix(function(a, b) return (a == b and a==1) and 1 or 0 end)
bitxor = infix(function(a, b) return a ~= b and 1 or 0 end)
bitnor = infix(function(a, b) return bitnot(a -bitor- b) end)
bitnand = infix(function(a, b) return bitnot(a -bitand- b) end)