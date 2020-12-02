print "Advent of Code 2020 Day 1 Part 2\n"

report = File.read("day01_input.txt").split("\n").map{|x| x.to_i}

report.each_with_index {|m, i|
	report.each_with_index {|n, j|
		report.each_with_index {|o, k|
			print "#{m} times #{n} times #{o} equals #{m * n * o}\n" if i > j && j > k && m + n + o == 2020
		}
	}
}
