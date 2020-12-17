print "Advent of Code 2020 Day 16 Part 2\n"

puzzle = File.read("day16_input.txt").split("\n")
line_read = 0
fields = []

(0..99).each{|l|
	line_read = l
	break if puzzle[l] == ""
	match = puzzle[l].match /([\w\s]+): (\d+)-(\d+) or (\d+)-(\d+)/
	fields << [match[1], match[2].to_i..match[3].to_i, match[4].to_i..match[5].to_i]
}
#puts "fields: #{fields}"

myticket = puzzle[line_read + 2].split(",").map{|x| x.to_i}
line_read += 3

tickets = []
((line_read + 2)..9999).each{|l|
	break if puzzle[l].nil?
	tickets << puzzle[l].split(",").map{|x| x.to_i}
}
#puts "tickets: #{tickets}"

def valid_fields(fields, value)
	matching_fields = []
	fields.each_with_index{|f, i|
		matching_fields << i if f[1].include?(value) or f[2].include?(value)
	}
	return matching_fields
end

invalid_tickets = []
tickets.each_with_index{|t, i|
	t.each{|v|
		next unless valid_fields(fields, v).empty?
		invalid_tickets << i
	}
}
puts "\n"
puts "invalid tickets are: #{invalid_tickets}"

$field_names = []
$positions_solved = []

def strip_solved
	stripped = false
	$field_names.each_with_index{|f, k|
		next if f.size > 1
		next if $positions_solved.include? k # we already cleaned this out
		puts "found field #{f[0]} to be unique for position #{k}"
		$field_names.each_with_index{|ff, j|
			next if k == j
			$field_names[j] = $field_names[j] - f if ff.include? f[0]
		}
		$positions_solved << k
		stripped = true
	}
	return stripped
end

puts "\n"
tickets.each_with_index{|t, i|
	next if invalid_tickets.include? i
	t.each_with_index{|v, j|
		valid_fields = valid_fields(fields, v)
		if $field_names[j].nil?
			$field_names[j] = valid_fields
		else
			$field_names[j] &= valid_fields
		end
	}

	#puts "ticket #{i} gave field names: #{$field_names}"
	# as soon as one field is unique, we can strip it out as possibility for all others
	while (strip_solved) do end
	#puts "field names: #{$field_names}"
}

#puts "fields solved: #{$positions_solved}"

puts "\n"
puts "solution totally unique? #{$positions_solved.size == fields.size}"

puts "\n"
$field_names.each_with_index{|f, i|
	puts "position #{i} is named #{fields[f[0]][0]}"
}

puts "\n"
puts "calculate from my ticket values:"
solution = 1
$field_names.each_with_index{|f, i|
	if fields[f[0]][0].split(" ")[0] == "departure"
		puts "#{fields[f[0]][0]}: #{myticket[i]}"
		solution *= myticket[i]
	end
}

puts "our solution is: #{solution}" #1824455538407