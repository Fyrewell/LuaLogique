
require("bit_infix")

local fulladder1bit = {}

local FullAdder1Bit = {}

function FullAdder1Bit:execute ()
  self.out.sum = (self.inp.a -bxor- self.inp.b) -bxor- self.inp.cin
  self.out.cout = (self.inp.a -band- self.inp.b) -bor- (self.inp.cin -band- (self.inp.a -bxor- self.inp.b))  
end

function fulladder1bit.new (Tin)
  local self = {}
  setmetatable(self, {__index = FullAdder1Bit})
  self.inp = Tin or {a=0,b=0,cin=0}
  self.out = {sum=0,cout=0}
  self:execute()
  return self
end

return fulladder1bit