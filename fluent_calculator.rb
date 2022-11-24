#https://www.codewars.com/kata/52a1feca5ec9c508d10006f8
class Calc
  def one
    if @first
      res( 1)
    else
      @first = 1
      self
    end
  end
  def two
    if @first
      res( 2)
    else
      @first = 2
      self
    end
  end
  def three
    if @first
      res(3 )
    else
      @first =3
        self
    end
  end
  def four
    if @first
      res(4 )
    else
      @first =4
        self
    end
  end
  def five
    if @first
      res( 5)
    else
      @first =5
        self
    end
  end
  def six
    if @first
      res(6 )
    else
      @first = 6
        self
    end
  end
  def seven
    if @first
      res( 7)
    else
      @first = 7
        self
    end
  end
  def eight
    if @first
      res(8 )
    else
      @first = 8
        self
    end
  end
  def nine
    if @first
      res( 9)
    else
      @first = 9
        self
    end
  end
  def zero
    if @first
      res( 0)
    else
      @first = 0
        self
    end
  end



  def minus;      @operation = "-"; self; end
  def plus;       @operation = "+"; self; end
  def times;      @operation = "*"; self; end
  def divided_by; @operation = "/"; self; end


  def res(second)
    case @operation
    when "-"
      res = @first - second
    when "+"
      res = @first + second
    when "*"
      res = @first * second
    when "/"
      res = @first / second
    end
    res
  end
end

p Calc.new.two.minus.one
p Calc.new.four.plus.five
p Calc.new.five.plus.four