
require("bit_infix")

local mux2_1 = {}

local Mux2_1 = {}

function Mux2_1:execute ()
  self.out = (self.inp.in1 -bitand- bitnot(self.inp.sel)) -bitor- (self.inp.in2 -bitand- self.inp.sel)
end

function mux2_1.new (Tin)
  local self = {}
  setmetatable(self, {__index = Mux2_1})
  self.inp = Tin or {in1=0,in2=0}
  self:execute()
  return self
end

return mux2_1