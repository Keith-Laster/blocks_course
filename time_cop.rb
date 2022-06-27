require 'timeout'

Timeout.timeout(2.0) do
  sleep 3.0
  puts 'That was refreshing...'
end

def try_with_timeout(time, &block)
  Timeout.timeout(time, &block)
rescue Timeout::Error
  puts 'took too long!'
end

try_with_timeout(2.0) do
  sleep 1.0
  puts 'That was refreshing...'
end
