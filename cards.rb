cards = %w[Jack Queen King Ace Joker]

cards.reverse_each do |c|
  puts "#{c.upcase} - #{c.length}"
end

scores = { 'Larry' => 10, 'Moe' => 8, 'Curly' => 12 }

scores.each do |n, s|
  puts "#{n} scored a #{s}!"
end
