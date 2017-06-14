
require("bit_infix")

local decoder7seg = {}

local Decoder7seg = {}

function Decoder7seg:execute ()
  self.out.sa = (self.inp.a -bitnor- self.inp.c) -bitand- (self.inp.b -bitxor- self.inp.d)
  self.out.sb = (self.inp.b -bitand- (self.inp.d -bitnand- self.inp.c)) -bitand- (self.inp.d -bitor- self.inp.c)
  self.out.sc = (bitnot(self.inp.b) -bitand- self.inp.c) -bitand- (self.inp.d -bitnand- self.inp.c)
  self.out.sd = (((bitnot(self.inp.d) -bitor- self.inp.c) -bitor- (bitnot(self.inp.b))) -bitand- (bitnot(self.inp.c) -bitor- self.inp.b)) -bitand- ((bitnot(self.inp.c) -bitor- self.inp.d) -bitand- (self.inp.d -bitor- self.inp.b) -bitand- bitnot(self.inp.a))
  self.out.se = (bitnot(bitnot(self.inp.b) -bitor- self.inp.c)) -bitor- self.inp.d
  self.out.sf = (((bitnot(self.inp.b) -bitor- self.inp.c) -bitand- bitnot(self.inp.a)) -bitand- (self.inp.c -bitor- self.inp.d)) -bitand- (self.inp.d -bitor- bitnot(self.inp.b))
  self.out.sg = (self.inp.b -bitor- bitnot(self.inp.c)) -bitand- ((bitnot(self.inp.b) -bitor- self.inp.c) -bitand- bitnot(self.inp.a) -bitand- (self.inp.d -bitor- bitnot(self.inp.c)))
  
  if (self.inp.complement==false) then
    self.out.sa = bitnot(self.out.sa)
    self.out.sb = bitnot(self.out.sb)
    self.out.sc = bitnot(self.out.sc)
    self.out.sd = bitnot(self.out.sd)
    self.out.se = bitnot(self.out.se)
    self.out.sf = bitnot(self.out.sf)
    self.out.sg = bitnot(self.out.sg)
  end
end

function decoder7seg.new (Tin)
  local self = {}
  setmetatable(self, {__index = Decoder7seg})
  self.inp = Tin or {a=0,b=0,c=0,d=0,complement=true}
  self.out = {sa=0,sb=0,sc=0,sd=0,se=0,sf=0,sg=0}
  self:execute()
  return self
end

return decoder7seg