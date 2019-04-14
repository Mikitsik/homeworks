require 'yaml'

def main_keys_to_sym(message)
  YAML.safe_load(message).keys.map(&:to_sym)
end

def sub_keys_and_pairs_ruse(message)
  YAML.safe_load(message).values.map do |item|
    item.each_with_object({}) do |(key, value), hash|
      hash[key.to_sym] = value if key == 'password'
      hash[:db] = value if key == 'database'
      hash[:user] = value if key == 'username'
      hash[:magic_number] = create_magic_number(item['pool'], item['timeout'])
      hash
    end
  end
end

def create_magic_number(pool, timeout)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool * timeout
end

def task_4_2(message)
  if message.empty?
    {}
  else
    Hash[main_keys_to_sym(message).zip(sub_keys_and_pairs_ruse(message))] \
      .map { |key, value| { key => value } }
  end
end

p task_4_2('stage: # name env
  adapter: mysql2 # not obligatory
  encoding: utf8  # not obligatory
  reconnect: false # not obligatory
  database: test-mysql2_development # obligatory
  pool: 5 # not obligatory, by default 1
  timeout: 5000 # not obligatory, by default 1000
  username: root # not obligatory
  password: password # not obligatory
  socket: /tmp/mysql.sock # not obligatory

development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 1000

production:
  adapter: postgresql
  encoding: unicode
  database: test-postgres_production
  pool: 5
  username: test-postgres
  password: x123')
