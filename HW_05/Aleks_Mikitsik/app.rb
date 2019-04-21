require 'json'
require 'net/http'
require 'uri'
require_relative 'human'
require_relative 'mentor'
require_relative 'student'
require_relative 'homework'
require_relative 'homework_solution'

mr_petrov = Mentor.new(first_name: 'Piotr', last_name: 'Petrov')
st_ivanov = Student.new(first_name: 'Ivan', last_name: 'Ivanov')

hw01 = mr_petrov.hw_set(hw_number: 'hw_01', hw_tasks:
  { task_1_1: 'some task_1_1 contents', task_1_2: 'some task_1_2 contents',
    task_1_3: 'some task_1_3 contents', task_1_4: 'some task_1_4 contents' })

mr_petrov.subscribed_to_student(st_ivanov)

st_ivanov.takes_hw(hw01)

st_ivanou_hw_01_done = st_ivanov.done_hw(solved_tasks:
  { task_1_1: 'answer_1_1', task_1_2: 'answer_1_2',
    task_1_3: 'answer_1_3', task_1_4: 'answer_1_4' })

st_ivanov.submit_hw

mr_petrov.read_notifications!

mr_petrov.check_hw(st_ivanou_hw_01_done)
