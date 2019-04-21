# set HomeworkSolution class
class HomeworkSolution < Homework
  attr_accessor :status
  attr_reader :student, :homework, :solved_tasks

  def initialize(solutions)
    @student = solutions[:student]
    @homework = solutions[:homework]
    @solved_tasks = solutions[:solved_tasks]
  end
end
