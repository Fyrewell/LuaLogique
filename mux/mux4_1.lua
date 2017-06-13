
local Mux2_1 = require("mux.mux2_1")

local sel2 = 1
local sel1 = 0

local mux1_2_1 = Mux2_1.new({in1=0,in2=0,sel=sel1})
local mux2_2_1 = Mux2_1.new({in1=1,in2=0,sel=sel1})
local mux3_2_1 = Mux2_1.new({in1=mux1_2_1.out,in2=mux2_2_1.out,sel=sel2})

print("output: "..mux3_2_1.out)