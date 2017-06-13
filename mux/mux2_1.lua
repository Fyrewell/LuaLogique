
require("bit_infix")

local mux2_1 = {}

local Mux2_1 = {}

function bnot(x)
    return x == 0 and 1 or 0
end

function Mux2_1:execute ()
  local not_sel = bnot(self.inp.sel)
  self.out = (self.inp.in1 -band- not_sel) -bor- (self.inp.in2 -band- self.inp.sel)
end

function mux2_1.new (Tin)
  local self = {}
  setmetatable(self, {__index = Mux2_1})
  self.inp = Tin or {in1=0,in2=0}
  self:execute()
  return self
end

return mux2_1