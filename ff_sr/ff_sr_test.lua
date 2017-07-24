
local FFSR = require("ff_sr.ff_sr")

local ff_sr = FFSR.new({s=1,r=0})
print("q = "..ff_sr.out.q..", qn = "..ff_sr.out.qn)

ff_sr:execute({s=1,r=1})
print("q = "..ff_sr.out.q..", qn = "..ff_sr.out.qn)

ff_sr:execute({s=0,r=1})
print("q = "..ff_sr.out.q..", qn = "..ff_sr.out.qn)

ff_sr:execute({s=1,r=1})
print("q = "..ff_sr.out.q..", qn = "..ff_sr.out.qn)

ff_sr:execute({s=0,r=0})
print("q = "..ff_sr.out.q..", qn = "..ff_sr.out.qn)
