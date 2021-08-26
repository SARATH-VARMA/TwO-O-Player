class Question

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def problem
    "What does #{@number1} plus #{@number2} equal?"
  end

  def correct?(ans)
    @answer == ans
  end

end