print "Advent of Code 2020 Day 2 Part 2\n"

list = []
File.read("day02_input.txt").split("\n").each{|x|
	x = x.split " "
	list.append({:policy => x[0].split("-").map{|x| x.to_i}, :letter => x[1].gsub(":", ""), :password => x[2]})
}

valid = 0
testing = 0

list.each_with_index{|x, i|
	testing = 0
	testing += 1 if x[:password][x[:policy][0] - 1] == x[:letter]
	testing += 1 if x[:password][x[:policy][1] - 1] == x[:letter]
	#print "Testing #{x[:password]} for #{x[:letter]}: #{x[:policy][0]}-#{x[:password][x[:policy][0] - 1]}; #{x[:policy][1]}-#{x[:password][x[:policy][1] - 1]} \n"
	valid += 1 if testing == 1
}

print "There are #{valid} valid passwords"