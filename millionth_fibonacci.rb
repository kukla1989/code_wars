def fib(n)
  return 1 if n == 1 || n == -1
  if n < 0
    n = -n
    negative = true
  end
  n1 = 0
  n2 = 1
  n3 = 0
  num = 1
  while num < n do
    n3 = n1 + n2
    n1 = n2
    n2 = n3
    num += 1
    print n3
    print "!!!!"
  end
  return -n3 if negative
  n3
end

p fib 2000000
print fib 0
p 0
print fib 1
p 1
print fib 2
p 1
print fib 3
p 2
print fib 4
p 3
print fib 5
p 5
