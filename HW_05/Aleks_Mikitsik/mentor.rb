class Mentor < Human
	def set_homework(homework)
		Homework.new(homework)
	end
end