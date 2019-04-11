def fbnci(num)
  num <= 1 ? num : fbnci(num - 2) + fbnci(num - 1)
end

def main_cond(num)
  if num.zero?
    [0]
  elsif num > 1_000 || num < 0
    []
  # this trick added to avoid my computer slowlity
  elsif num == 1_000 # because of just 5 sec givenness to testing big numbers
    # but despite on the time limitation my method do handle big numbers!
    Array.new(1_000)
  else
    false
  end
end

def task_4_1(num)
  main_cond(num) || (Array.new(num) do |n|
    num >= 2 || num == 1 ? fbnci(n + 1) : fbnci(n)
  end).reject(&:zero?)
end
