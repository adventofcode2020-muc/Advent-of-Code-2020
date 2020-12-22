print "Advent of Code 2020 Day 22 Part 1\n"
# even works with more than two players

input = File.read("day22_input.txt").split("\n\n")
players = []
input.each_with_index{|p, i|
	p.split("\n").each_with_index{|c, j|
		(players[i] = []; next) if j == 0
		players[i] << c.to_i
	}
}

winner = -1
while (true) do
	puts ""

	cards = []
	(0...players.size).each{|i|
		puts "Player #{i + 1}'s deck: #{players[i].join(", ")}"
		cards << players[i].slice!(0)
	}

	puts "Cards played: #{cards.join(", ")}"

	highest_card = 0
	cards.each_with_index{|c, i|
		if c.to_i > highest_card
			winner = i
			highest_card = c
		end
	}

	puts "Player #{winner + 1} wins the round!"
	cards -= [nil]
	cards.sort!{|x, y| y <=> x}

	cards.each{|c|
		players[winner] << c unless c.nil?
	}

	players_in_game = 0
	players.each{|p|
		players_in_game += 1 if p.size > 0
	}
	break unless players_in_game > 1
end

score = 0
players[winner].each_with_index{|c, i|
	score += c * (players[winner].size - i)
}

puts "Winner's score: #{score}"