def task_1(message)
  (message.each_line.select { |line| line.match(/[Ee]rror/) }).to_s
end
