print "Advent of Code 2020 Day 18 Part 1\n"

math = File.read("day18_input.txt").split("\n")

def parse_math(m)
	while sub = m.match(/\(([^()]+)\)/)
		#puts "matched: #{sub[1]}"
		m.sub!("(#{sub[1]})", parse_math(sub[1]).to_s)
		#puts "new expression: #{m}"
	end

	tokens = m.split ' '
	ret = tokens.slice!(0).to_i
	while (opval = tokens.slice!(0..1)).size > 0
		case opval[0]
			when "*"
				ret *= opval[1].to_i
			when "+"
				ret += opval[1].to_i
			end
	end
	return ret
end


result = 0
math.each{|m|
	r = parse_math(m)
	#puts "#{m} = #{r}"
	result += r
}

puts "Sum of all expressions: #{result}"
