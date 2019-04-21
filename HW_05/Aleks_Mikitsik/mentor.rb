# set Mentor class
class Mentor < Human
  attr_accessor :notifications
  attr_reader :homework

  def initialize(name)
    @notifications = []
    super
  end

  def hw_set(homework)
    @homework = homework
    Homework.new(homework)
  end

  def subscribed_to_student(student)
    student.subscribed_by_mentor = self
  end

  def read_notifications!
    notifications.map { |note| note[:status] = 'read' }
  end

  def check_hw(hw_student_solution)
    if hw_student_solution.solved_tasks.size == homework[:hw_tasks].size
      hw_student_solution.status = 'succeeded'
    else
      hw_student_solution.status = 'failed'
    end
  end
end
