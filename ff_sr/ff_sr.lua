
require("bit_infix")

local ff_sr = {}

local FFSR = {}

function FFSR:execute (NewTin)
  self.out.q = (NewTin.s or self.inp.s) -bitnand- self.out.qn
  self.out.qn = (NewTin.r or self.inp.r) -bitnand- self.out.q
end

function ff_sr.new (Tin)
  local self = {}
  setmetatable(self, {__index = FFSR})
  self.inp = Tin or {s=0,r=0}
  self.out = {q=0,qn=1}
  self:execute({})
  return self
end

return ff_sr