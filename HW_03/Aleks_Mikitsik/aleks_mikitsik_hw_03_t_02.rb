def extract(message)
  message.each_line.map do |line|
  next unless line.include? 'POST'
    "#{line.match(%r{\d{2}/[a-z]{3}/\d{4}[\:\d{2}]*{3}\s\+\d{4}}i)} FROM:\
 #{line.match(/\d{2}\.\d.\d{3}\.\d{3}/)} TO:\
 #{line.upcase.match(%r{/[A-Z]*/\d/[A-Z]*})}"
  end
end

def task_2(message)
  	extract(message).delete_if {|x| x.empty?}
end

puts task_2('10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] " POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] " /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] " /test/2/messages HTTP/1.1" 200 48 0.0290')