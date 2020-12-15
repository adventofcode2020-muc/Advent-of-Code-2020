print "Advent of Code 2020 Day 15 Part 1\n"

numbers = "1,0,16,5,17,4".split(",").map{|n| n.to_i}
turns = []

(0...2020).each{|t|
	if(t < numbers.size)
		turns << numbers[t]
		#puts "Turn #{t + 1}: starting number: #{numbers[t]}"
	else
		#puts "Turn #{t + 1}: starting"
		last_number = turns.last
		known_number = false
		speak_number = 0
		(2..t).each{|x|
			#puts "Testing turn #{t - x + 1}: #{turns[t - x]}"
			if(turns[t - x] == last_number)
				#puts "Found number at turn #{t - x + 1}"
				speak_number = x - 1
				break
			end
		}
		puts "Turn #{t + 1}: speaks number #{speak_number}"
		turns << speak_number
	end
}

puts "last number spoken is #{turns.last}"