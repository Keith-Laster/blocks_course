class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status = :bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new('Larry', 'larry@example.com', 4000, :platinum)
flyers << Flyer.new('Moe', 'moe@example.com', 1000)
flyers << Flyer.new('Curly', 'curly@example.com', 3000, :gold)
flyers << Flyer.new('Shemp', 'shemp@example.com', 2000)

frequent_flyers = flyers.select { |m| m.miles_flown >= 3000 }
infrequent_flyers = flyers.reject { |m| m.miles_flown >= 3000 }
puts frequent_flyers
puts '---'
puts infrequent_flyers

puts flyers.any? { |f| f.status == :platinum }

puts flyers.detect { |f| f.status == :bronze }

platinum_flyers, coach_flyers = flyers.partition { |f| f.status == :platinum }

p platinum_flyers
p coach_flyers

name_tags = flyers.map { |f| "#{f.name}, #{f.status.upcase}" }
p name_tags

flyer_miles_in_km = flyers.map { |f| f.miles_flown * 1.6 }
p flyer_miles_in_km

total_miles_flown = flyers.reduce(0) { |sum, f| sum + f.miles_flown }
p total_miles_flown

puts flyer_miles_in_km.reduce(0) { |sum, f| sum + f }

bronzies = flyers.select { |f| f.status == :bronze }

p bronzies

bronzie_kilos = bronzies.map { |f| f.miles_flown * 1.6 }
p bronzie_kilos.reduce(:+)

puts flyers.max_by { |f| f.miles_flown }
