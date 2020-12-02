print "Advent of Code 2020 Day 2 Part 1\n"

list = []
File.read("day02_input.txt").split("\n").each{|x|
	x = x.split " "
	list.append({:policy => Range.new(*x[0].split("-").map(&:to_i)), :letter => x[1].gsub(":", ""), :password => x[2]})
}

valid = 0

list.each_with_index{|x, i|
	#print "Checking ##{i}: #{x[:policy]} #{x[:letter]}: #{x[:password]}\n"
	valid += 1 if x[:policy].include?(x[:password].count(x[:letter]))
}

print "There are #{valid} valid passwords"