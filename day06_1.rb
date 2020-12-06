print "Advent of Code 2020 Day 6 Part 1\n"

answers = File.read("day06_input.txt").split("\n")
answers << ''

sum_counts = 0

choices = []
answers.each{|a|

	if(a.split('').size > 0)
		a.split('').each{|q|
			choices << q
		}
	else
		choices.uniq!
		sum_counts += choices.size
		#print "Group answered yes to #{choices.size} questions\n"
		choices = []
	end

}

print "Sum of counts is #{sum_counts}\n"