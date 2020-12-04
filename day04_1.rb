print "Advent of Code 2020 Day 4 Part 1\n"

passports = File.read("day04_input.txt").split("\n\n").map{|x| x.gsub("\n", " ").split(" ").map{|x| x.split(":")}}

required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"].sort

valid = 0

passports.each{|p|
	fields = p.map{|f| f[0]}.uniq

	#print "         fields: #{fields}\n"
	#print "required fields: #{required_fields}\n"
	#print "      intersect: #{fields | required_fields}\n"
	valid += 1 if (fields & required_fields).size == required_fields.size
}

print "We have #{valid} valid passports out of #{passports.size}\n"