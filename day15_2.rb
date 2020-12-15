print "Advent of Code 2020 Day 15 Part 2\n"

numbers = "1,0,16,5,17,4".split(",").map{|n| n.to_i}
last_occurence = {}
turns = []

# runs about a minute ... but yeah!

(0...30000000).each{|t|
	if(t < numbers.size)
		turns << numbers[t]
		#puts "Turn #{t + 1}: starting number: #{numbers[t]}"
	else
		#puts "Turn #{t + 1}: starting"
		last_number = turns.last
		speak_number = 0

		unless last_occurence[last_number.to_s.to_sym].nil?
			#puts "found number at #{last_occurence[last_number.to_s.to_sym] + 1}"
			speak_number = t - last_occurence[last_number.to_s.to_sym] - 1
		end

		puts "Turn #{t + 1}: speaks number #{speak_number}" if (t + 1) % 1000000 == 0
		turns << speak_number
	end
	last_occurence[turns[t - 1].to_s.to_sym] = t - 1
}

puts "last number spoken is #{turns.last}"