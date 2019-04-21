require 'json'
require 'net/http'
require 'uri'
require_relative 'human'
require_relative 'mentor'
require_relative 'student'
require_relative 'homework'

mentor = Mentor.new({first_name: "Piotr", last_name: "Piatrou"})
student = Student.new({first_name: "Ivan", last_name: "Ivanou"})

hw_01 = mentor.set_hw({hw_number: "hw_01", hw_tasks: {task_1_1: "some task_1_1 contents", 
	task_1_2: "some task_1_2 contents", task_1_3: "some task_1_3 contents", task_1_4: "some task_1_4 contents"}})

mentor.subscribed_to_student(student)

student.takes_hw(hw_01) 
student.done_hw(["answer_1_1", "answer_1_2", "answer_1_3", "answer_1_4"])
student.submit_hw

mentor.read_notifications!

