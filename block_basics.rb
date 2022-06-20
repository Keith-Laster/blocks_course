puts "let's start mastering ruby blocks!"

1.upto(5) do |n|
  puts "#{n} situp"
  puts "#{n} pushup"
  puts "#{n} chinup"
end

# bonusround
1.step(9, 2) do |n|
  puts "#{n} situp"
  puts "#{n} pushup"
  puts "#{n} chinup"
end
