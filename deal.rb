def deal(n)
  faces = %w[Jack Queen King Ace]
  suits = %w[Hearts Diamonds Spades Clubs]
  if block_given?
    n.times do
      random_face = faces.sample
      random_suit = suits.sample
      # call the block here
      print_score = yield random_face, random_suit
      puts "You scored a #{print_score}!"
    end
  else
    puts 'No deal!'
  end
end

deal(20) do |face, suit|
  puts "Dealt a(n) #{face} of #{suit}"
  face.length + suit.length
end
