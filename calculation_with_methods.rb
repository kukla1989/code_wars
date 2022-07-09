#https://www.codewars.com/kata/525f3eda17c7cd9f9e000b39/train/ruby
def calculate(str, i)
  case str[1]
  when '*'
    res = str[0].to_i * i
  when '-'
    res = i - str[0].to_i
  when '/'
    res = i / (str[0].to_i)
  when '+'
    res = str[0].to_i + i
  end
  p res
end

def zero(i = 11)
  return 0 if i == 11
  calculate(i, 0)
end

def one(i = 11)
  return 1 if i == 11
  calculate(i, 1)
end

def two(i = 11)
  return 2 if i == 11
  calculate(i, 2)
end

def three(i = 11)
  return 3 if i == 11
  calculate(i, 3)
end

def four(i = 11)
  return 4 if i == 11
  calculate(i, 4)
end

def five(i = 11)
  return 5 if i == 11
  calculate(i, 5)
end

def six(i = 11)
  return 6 if i == 11
  calculate(i, 6)
end

def seven(i = 11)
  return 7 if i == 11
  calculate(i, 7)
end

def eight(i = 11)
  return 8 if i == 11
  calculate(i, 8)
end

def nine(i = 11)
  return 9 if i == 11
  calculate(i, 9)
end

def times(i)
   i.to_s + '*'
end

def plus(i)
  i.to_s + '+'
end

def minus(i)
  i.to_s + '-'
end

def divided_by(i)
  i.to_s + '/'
end


nine(times(nine))
four(plus(nine()))
eight(minus(three()))
six(divided_by(two()))