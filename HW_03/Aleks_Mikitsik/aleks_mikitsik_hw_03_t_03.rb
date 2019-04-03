#  first solution

def task_3_1(message)
  # str_res = []
  int_res = []
  message.each_line.map do |line|
    next unless line.include?('Calling core with action')

    mark = line.match(/^\d{4}[\-\d{2}]*{2}\s[\d{2}\:]*{2}\d{2}\.\d/)
    # str_res << mark
    int_res << mark.to_s.delete('.', ':').match(/.{5}$/).to_s.to_i
  end
  # first_num = int_res[1].round(-3) * 0.6 + (int_res[1] - int_res[1].round(-3))
  # second_num = int_res[0].round(-3) * 0.6 + \
  # (int_res[0] - int_res[0].round(-3))
  # { }"(#{str_res[0]} - #{str_res[1]}) = (#{first_num} - #{second_num}) = \
  # {(first_num - second_num) * 0.1}"
end

#  second one

require 'time'
def task_3_2(message)
  date = []
  message.each_line.map do |line|
    next unless line.include?('Calling core with action')

    date << Time.strftime(line.match(/^.{21}/).to_s, '%M%S%L')
  end
  date
end
