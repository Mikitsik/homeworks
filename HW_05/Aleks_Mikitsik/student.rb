# set Student class
class Student < Human
  attr_accessor :subscribed_by_mentor
  attr_reader :hw, :hw_solutions

  def takes_hw(homework)
    @hw = homework
  end

  def done_hw(solutions)
    solutions[:student] = "#{first_name} #{last_name}"
    solutions[:homework] = hw.hw_number
    @hw_solutions = solutions
    HomeworkSolution.new(solutions)
  end

  def submit_hw
    Net::HTTP.post URI('http://www.example.com/api/search'),
                   hw_solutions.to_json, 'Content-Type' => 'application/json'
    return unless subscribed_by_mentor

    subscribed_by_mentor.notifications <<
      { notification:
      "Student #{first_name} #{last_name} has sent #{hw.hw_number}",
        status: 'unread' }
  end
end
