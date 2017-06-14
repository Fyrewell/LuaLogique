
local Decoder7seg = require("decoder_7seg.decoder_7seg")

local uni_dec_7seg = Decoder7seg.new({a=0,b=0,c=1,d=0, complement=false})

print("result: "..uni_dec_7seg.out.sa..uni_dec_7seg.out.sb..uni_dec_7seg.out.sc..uni_dec_7seg.out.sd..uni_dec_7seg.out.se..uni_dec_7seg.out.sf..uni_dec_7seg.out.sg)

function print_as_7seg(t)
  print(t.sa==1 and ' ### ' or ' -- ')
  print((t.sf==1 and '#' or '´')..(t.sb==1 and '   #' or '   ´'))
  print((t.sf==1 and '#' or '´')..(t.sb==1 and '   #' or '   ´'))
  print(t.sg==1 and ' ###' or ' ---')
  print((t.se==1 and '#' or '´')..(t.sc==1 and '   #' or '   ´'))
  print((t.se==1 and '#' or '´')..(t.sc==1 and '   #' or '   ´'))
  print(t.sd==1 and ' ### ' or ' --- ')
end

print_as_7seg(uni_dec_7seg.out)
