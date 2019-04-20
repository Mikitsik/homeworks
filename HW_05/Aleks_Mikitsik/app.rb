require_relative "human"
require_relative "mentor"
require_relative "student"
require_relative "homework"

mr_aleksandr = Mentor.new({first_name: "Aleksandr", last_name: "Shagov"})
mr_maksim = Mentor.new({first_name: "Maksim", last_name: "Holubeu"})

st_mikitsik = Student.new({first_name: "Aleksei", last_name: "Mikitsik"})
st_ivanou = Student.new({first_name: "Ivan", last_name: "Ivanou"})

hw_1 = mr_aleksandr.set_homework({hw_number: "hw_01", hw_tasks: ["task_1_1", "task_1_2", "task_1_3", "task_1_4"]})
hw_2 = mr_maksim.set_homework({hw_number: "hw_02", hw_tasks: ["task_2_1", "task_2_2", "task_2_3", "task_2_4"]})

st_mikitsik.takes_hw(hw_1) 
st_mikitsik.hw_done(["answer_1_1", "answer_1_2", "answer_1_3", "answer_1_4"])

st_ivanou.takes_hw(hw_2)
st_ivanou.hw_done(["solution_2_1", "solution_2_2", "solution_2_3", "solution_2_4"])

p st_mikitsik.hw_solutions
p st_ivanou.hw_solutions


