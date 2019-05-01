# set Human class
class Human
  attr_reader :first_name, :last_name

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end
end

# set Mentor class
class Mentor < Human
  attr_accessor :notifications

  def initialize(first_name:, last_name:)
    @notifications = []
    super
  end

  def create_hw(homework_params)
    Homework.new(homework_params)
  end

  def subscribed_to!(student)
    student.mentor = self
  end

  def read_notifications!
    notifications.map { |note| note[:status] = 'read' }
  end

  def check!(homework, homework_solution)
    if homework_solution.solved_tasks.size == homework.hw_tasks.size
      homework_solution.status = 'succeeded'
    else
      homework_solution.status = 'failed'
    end
  end
end

RSpec.describe Mentor do

end
