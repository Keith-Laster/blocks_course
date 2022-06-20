class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end

  flyers = []

  1.upto(5) do |n|
    flyers << Flyer.new("Flyer#{n}", "Flyer#{n}@example.com", n * 1000)
  end
  puts flyers

  flyers.each do |f|
    puts "#{f.name} - #{f.miles_flown} miles"
  end
  total = 0

  flyers.each do |f|
    total += f.miles_flown
  end
  puts "Total miles flown: #{total}"

  promotions = { 'United' => 1.5, 'Delta' => 2.0, 'Lufthansa' => 2.5 }
  promotions.each do |n, b|
    puts "Earn #{b}x miles by flying #{n}!"
  end

  # bonus
  flyers.each do |f|
    promotions.each do |n, b|
      puts "#{f.name} could earn #{f.miles_flown * b} by flying #{n}!"
    end
  end
end
