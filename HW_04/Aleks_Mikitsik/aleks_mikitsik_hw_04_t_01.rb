def main_conditions(num)
  if num.zero?
    Array.new(1, 0)
  elsif num > 1_000 || num < 0
    Array.new()
  elsif num == 1_000
    Array.new(1_000)
  else
    false
  end
end

def fibonacci(num)
  num <= 1 || num > 1_000 ? num : fibonacci(num - 2) + fibonacci(num - 1)
end

def task_4_1(num)
  if main_conditions(num).eql?([0]) || main_conditions(num).eql?([]) \
    || main_conditions(num).eql?(Array.new(1_000))
    main_conditions(num)
  else
    (Array.new(num) { |_num| fibonacci(_num) }).reject(&:zero?)
  end
end

puts task_4_1(9)
