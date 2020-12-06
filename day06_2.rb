print "Advent of Code 2020 Day 6 Part 2\n"

answers = File.read("day06_input.txt").split("\n")
answers << ''

sum_counts = 0

choices = []
other_choices = []
newgroup = true

answers.each{|a|

	if(a.split('').size > 0)
		if(newgroup)
			a.split('').each{|q|
				choices << q
			}
			newgroup = false
		else
			other_choices = []
			a.split('').each{|q|
				other_choices << q
			}
			choices = choices & other_choices
		end
	else
		sum_counts += choices.size
		choices = []
		newgroup = true
	end

}

print "Sum of counts is #{sum_counts}\n"