def h1
  print '<h1>'
  print yield
  print '</h1>'
end

def h2
  print '<h2>'
  print yield
  print '</h2>'
end

def tag(name)
  print "<#{name}>"
  print yield
  print "</#{name}>"
end

h1 { 'Breaking News' }
h2 { 'Massive Ruby Discovered' }

tag(:ul) do
  tag(:li) { 'It sparkles!' }
  tag(:li) { 'It shines!' }
  tag(:li) { 'It mesmerizes!' }
end

def with_debugging
  puts 'Got Here!'
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected_value)
  puts 'Running test...'
  value = yield
  if value == expected_value
    puts 'Passed'
  else
    puts 'Failed!'
    p "Expected #{expected_value}, but got #{value}"
  end
end

with_expectation(5) { 2 + 2 }
with_expectation(4) { 2 + 2 }

def time_it(name, &block)
  result = Benchmark.realtime(&block)
  puts "#{name} took #{result}"
end
