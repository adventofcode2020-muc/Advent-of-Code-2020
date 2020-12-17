print "Advent of Code 2020 Day 16 Part 1\n"

puzzle = File.read("day16_input.txt").split("\n")
line_read = 0
fields = []

(0..99).each{|l|
	line_read = l
	break if puzzle[l] == ""
	match = puzzle[l].match /([\w\s]+): (\d+)-(\d+) or (\d+)-(\d+)/
	fields << [match[1], match[2].to_i..match[3].to_i, match[4].to_i..match[5].to_i]
}
puts "fields: #{fields}"

myticket = puzzle[line_read + 2].split(",").map{|x| x.to_i}
line_read += 3

tickets = []
((line_read + 2)..9999).each{|l|
	break if puzzle[l].nil?
	tickets << puzzle[l].split(",").map{|x| x.to_i}
}
puts "tickets: #{tickets}"

def is_valid(fields, value)
	fields.each{|f|
		return true if f[1].include?(value) or f[2].include?(value)
	}
	return false
end

invalid_values = []
tickets.each_with_index{|t, i|
	t.each{|v|
		next if is_valid(fields, v)
		invalid_values << v
	}
}
puts "invalid values are: #{invalid_values}"

answer = 0
invalid_values.each{|v| answer += v}
puts "answer: #{answer}"