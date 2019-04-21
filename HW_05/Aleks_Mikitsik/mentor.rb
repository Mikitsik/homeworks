class Mentor < Human

  attr_accessor :notifications

  def initialize(name)
  	@notifications = Array.new
  	super
  end
  	

  def set_hw(homework)
	Homework.new(homework)
  end

  def subscribed_to_student(student)
    student.subscribed_by_mentor = self
  end

  def read_notifications!
  	notifications.map {|note| note[:status] = "read"}
  end

end