print "Advent of Code 2020 Day 4 Part 2\n"

passports = File.read("day04_input.txt").split("\n\n").map{|x| x.gsub("\n", " ").split(" ").map{|x| x.split(":")}}

required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"].sort

valid = 0

passports.each{|p|
	fields = p.map{|f| f[0]}.uniq
	valid_fields = 0

	if (fields & required_fields).size == required_fields.size
		required_fields.each{|rf|
			value = p.select{|p| p[0] == rf}[0][1]
			case rf
				when "byr"
					valid_fields += 1 if (1920..2002).include?(value.to_i)
				when "iyr"
					valid_fields += 1 if (2010..2020).include?(value.to_i)
				when "eyr"
					valid_fields += 1 if (2020..2030).include?(value.to_i)
				when "hgt"
					case value[-2, 2]
						when "cm"
							valid_fields += 1 if (150..193).include?(value[0..-3].to_i)
						when "in"
							valid_fields += 1 if (59..76).include?(value[0..-3].to_i)
					end
				when "hcl"
					valid_fields += 1 if value.match? /^#[0-9a-f]{6}$/
				when "ecl"
					valid_fields += 1 if ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include? value
				when "pid"
					valid_fields += 1 if value.match? /^[\d]{9}$/
			end
		}
		valid += 1 if required_fields.size == valid_fields
	end
}

print "We have #{valid} valid passports out of #{passports.size}\n"