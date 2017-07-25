
function split(str, separator)
  local tbl = {}
  string.gsub(str, "(%w+)", function(n) table.insert(tbl, n) end)
  return tbl
end

function double_split(str, separator)
  local tbl = {}
  string.gsub(str, "(%w+)"..separator.."(%w+)", function(n1, n2) table.insert(tbl, {n1, n2}) end)
  return tbl
end
