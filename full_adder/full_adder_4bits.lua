
local FullAdder1Bit = require("full_adder.full_adder_1bit")

local fa1_1bit = FullAdder1Bit.new({cin=                0,a=1,b=0})
local fa2_1bit = FullAdder1Bit.new({cin=fa1_1bit.out.cout,a=1,b=1})
local fa3_1bit = FullAdder1Bit.new({cin=fa2_1bit.out.cout,a=0,b=0})
local fa4_1bit = FullAdder1Bit.new({cin=fa3_1bit.out.cout,a=0,b=0})

print("result: "..fa4_1bit.out.cout..fa4_1bit.out.sum..fa3_1bit.out.sum..fa2_1bit.out.sum..fa1_1bit.out.sum)