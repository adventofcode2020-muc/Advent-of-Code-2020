print "Advent of Code 2020 Day 21 Part 1\n"

ingredients = []
allergens = []
foods = []
foods_raw = File.read("day21_input.txt").split("\n").map{|x| x.split(" (contains ")}

foods_raw.each{|fr|
	fr_ingredients = fr[0].split " "
	fr_allergens = fr[1].split ", "
	fr_allergens[-1] = fr_allergens[-1][0..-2] # remove closing bracket

	foods << [fr_ingredients, fr_allergens]
	fr_ingredients.each{|i| ingredients << i}
	fr_allergens.each{|a| allergens << a}
}

ingredients.uniq!
allergens.uniq!

puts "Found #{foods.size} foods from #{ingredients.size} ingredients containing #{allergens.size} allergens."

while (true) do
	success = false
	allergen_uniques = []
	allergens.each{|a|
		allergen_uniques = foods.select{|f| f[1].include? a}
		next if allergen_uniques.empty?
		puts "There are #{allergen_uniques.size} foods that include #{a}"

		candidates = []
		(0...allergen_uniques.size).each{|i|
			candidates = allergen_uniques[i][0] if i == 0
			candidates &= allergen_uniques[i][0] if i > 0
		}
		#puts "candidates: #{candidates}"

		if candidates.size == 1
			success = true
			puts "Found #{candidates[0]} to contain #{a}"

			(0...foods.size).each{|i|
				foods[i][0] = foods[i][0] - candidates if foods[i][0].include? candidates[0]
				foods[i][1] = foods[i][1] - [a] if foods[i][1].include? a
			}
		end
	}

	break if success == false
end

allergens_left = []
ingredients_left = []
foods.each{|f|
	f[1].each{|a| allergens_left << a}
	f[0].each{|i| ingredients_left << i}
}

allergens_left.uniq!

puts ""
puts "There are #{allergens_left.size} allergens left: #{allergens_left}"
puts "There are #{ingredients_left.size} ingredients left (duplicates included)"