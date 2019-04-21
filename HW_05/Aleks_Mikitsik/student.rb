class Student < Human

  attr_accessor :subscribed_by_mentor
  attr_reader :hw, :hw_solutions

  def takes_hw(homework)
  	@hw = homework
  end

  def done_hw(solutions)
  	@hw_solutions = {:student => "#{first_name} #{last_name}",
  		hw.hw_number => Hash[hw.hw_tasks.each_key.zip(solutions)]}
  end

  def submit_hw
    Net::HTTP.post URI('http://www.example.com/api/search'),
               hw_solutions.to_json, "Content-Type" => "application/json"
    if subscribed_by_mentor
        subscribed_by_mentor.notifications << 
        {notification: "Student #{first_name} #{last_name} has sent #{hw.hw_number}", status: "unread"}
    end
  end

end