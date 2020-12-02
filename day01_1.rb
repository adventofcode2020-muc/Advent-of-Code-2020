print "Advent of Code 2020 Day 1 Part 1\n"

report = File.read("day01_input.txt").split("\n").map{|x| x.to_i}

report.each_with_index {|n, i|
	report.each_with_index {|m, j|
		print "#{n} times #{m} equals #{n * m}\n" if i > j && n + m == 2020
	}
}
