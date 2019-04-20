require_relative "human"
require_relative "mentor"
require_relative "student"
require_relative "homework"
require_relative "homework_solution"

mr_aleksandr = Mentor.new({first_name: "Aleksandr", last_name: "Shagov"})
mr_maksim = Mentor.new({first_name: "Maksim", last_name: "Holubeu"})

st_mikitsik = Student.new({first_name: "Aleksei", last_name: "Mikitsik"})
st_ivanou = Student.new({first_name: "Ivan", last_name: "Ivanou"})

hw_1 = mr_aleksandr.set_homework({homework_number: "01", homework_tasks: ["task_1_1", "task_1_2", "task_1_3", "task_1_4"]})

mikitsik_hw_1 = st_mikitsik.hw_done(["abcde", "fghij", "klmno", "pqrst"])

#p mikitsik_hw_1.hw_solution

