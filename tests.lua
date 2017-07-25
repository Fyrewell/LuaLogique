

str = [===[POST / HTTP/1.1\r\nHost: 192.168.1.1\r\nConnection: keep-alive\r\nContent-Length: 40\r\nAccept: */*\r\nOrigin: null\r\nUser-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4\r\n\r\n\r\nckt=bitnot(In1)&inputs=0%2C1&outputs=Out1]===]


function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

tbl_req = string.split(str,"\\r\\n")

function get_req_data_string(tbl_req)
  for i = #tbl_req, 1, -1 do
    val = tbl_req[i]
    if (#val > 3) then
      return val
    end
  end
end


str_qry = get_req_data_string(tbl_req)
print(str_qry)

argv = string.split(str_qry, '&')
print(argv[1])

str_qry = argv[1]
str_in = argv[2]
str_out = argv[3]
str_qry = string.gsub(str_qry,'ckt=','')
str_qry = string.gsub(str_qry,'+',' ')
str_qry = string.gsub(str_qry,'%%3D','=')
print(str_qry, str_in, str_out)

print(string.split(str_in, '%%2C')[1])



-- all is table
GT = {}
str_in = [===[ 
{ckt   ={Out1={"(In1 -bitand- bitnot(In3)) -bitor- (In2 -bitand- In3)"}
,inputs={"In1=0","In2=1","In3=0"}
,inputSequence={In1="0,200;1,200;0,400;1,600",Infinity=true}}
,pinMap={}
}
]===]
GT = loadstring('return '..str_in)()
print(GT['ckt']['Out1'][1])

