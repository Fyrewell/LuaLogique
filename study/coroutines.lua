

function sum_recursive()
  for i=1,20 do
    print("hello")
    coroutine.yield()
  end
  --coroutine.yield()
  --sum_recursive(a+b, b)
end

co = coroutine.create(sum_recursive)

print(coroutine.status(co))

print(coroutine.resume(co))
