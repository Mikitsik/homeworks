def task_2(message)
  result = []
  message.each_line.map do |line|
    next unless line.include?('POST')

    result << "#{line.match(%r{\d{2}/[a-z]{3}/\d{4}[\:\d{2}]*{3}\s\+\d{4}}i)} \
    FROM: #{line.match(/\d{2}\.\d.\d{3}\.\d{3}/)} \
    TO: #{line.upcase.match(%r{/[A-Z]*/\d/[A-Z]*})}"
  end
  result
end
