def task_1(message)
  if message =~ /.*[e]rror/i
    (message.each_line.select { |line| line.chop!.match(/.*[e]rror/i) }).to_s
  else
    ''
  end
end
