class HomeworkSolution < Homework

  attr_accessor :hw_solution
  
  def initialize(solution)
    @hw_solution = Array.new(solution)
  end
end