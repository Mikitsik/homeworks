class Student < Human

  attr_reader :hw, :hw_solutions

  def takes_hw(homework)
  	@hw = homework
  end

  def hw_done(solutions)
  	@hw_solutions = [{hw.hw_number => Hash[hw.hw_tasks.zip(solutions)]}]
  end

end