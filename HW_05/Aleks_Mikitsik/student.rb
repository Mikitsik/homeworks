class Student < Human

  def hw_done(solution)
  	HomeworkSolution.new(solution)
  end

end