class WrongNumberOfPlayersError < StandardError ; 
end 

class NoSuchStrategyError < StandardError ; 
end

def rps_game_winner(game)
   raise WrongNumberOfPlayersError, game.length.to_s() unless game.length == 2 

   p1 = game[0][1].upcase
   p2 = game[1][1].upcase

   if (p1 == p2) or 
      (p1 == "R" and p2 == "S") or
      (p1 == "P" and p2 == "R") or
      (p1 == "S" and p2 == "P")
      return game[0]
   elsif (p1 == "R" and p2 == "P") or
         (p1 == "P" and p2 == "S") or
         (p1 == "S" and p2 == "R")
      return game[1]
   else
      raise NoSuchStrategyError, p1 + " vs " + p2   
   end
end

def rps_tournament_winner(list, level = 0)
#   level.times {print "-"}; print "Playing  " + list.inspect + "\n"
   
   i = 0
   winner = []
   
   for element in list
#      level.times {print "-"}; print "Checking " + element.inspect + "\n"
      if element[0].class.eql?(String) and element[1].class.eql?(String)
#      	level.times {print "-"}; print "Playing game " + list.inspect + "\n"
      	winner[i] = rps_game_winner(list)
#      	level.times {print "-"}; print "Game winner  " + winner.inspect + "\n"
      	return winner[i]
      else
         winner[i] = rps_tournament_winner(element, level+1)
      end
      i = i + 1
   end
   
   if i == 2
      game = [winner[0], winner[1]]
#      level.times {print "-"}; print "Playing game " + game.inspect + "\n"
      winner[i] = rps_game_winner(game) 
#      level.times {print "-"}; print "Round winner  " + winner[i].inspect + "\n"
   end
   
   return winner[i]
end

if __FILE__ == $0

   print "\n===== Test Case 1\n"
   game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
   winner = rps_game_winner(game)
   print winner.inspect + "\n"
   # => returns the list ["Dave", "S"] wins since S>P

   print "\n===== Test Case 2\n"
   game = [ [ "Armando", "r" ], [ "Dave", "S" ] ]
   winner = rps_game_winner(game)
   print winner.inspect + "\n"
   # => returns the list ["Dave", "S"] wins since S>P

   print "\n===== Test Case 3\n"
   begin
      game = [ [ "Armando", "P" ], [ "Dave", "s" ], ["Shawn", "R"] ]
      winner = rps_game_winner(game)
      print winner.inspect + "\n"
   rescue WrongNumberOfPlayersError
      print "ERROR : Wrong number of players\n"
      #print "ERROR : Wrong number of players (" + $! + ")\n"
   rescue NoSuchStrategyError
      print "ERROR : No such strategy\n"
      #print "ERROR : No such strategy (" + $! + ")\n"
   end

   print "\n===== Test Case 4\n"
   begin
      game = [ [ "Armando", "R" ], [ "Dave", "X" ] ]
      winner = rps_game_winner(game)
      print winner.inspect + "\n"
   rescue WrongNumberOfPlayersError
      print "ERROR : Wrong number of players\n"
   rescue NoSuchStrategyError
      print "ERROR : No such strategy\n"
   end

   print "\n===== Test Case 5\n"
   begin
   	game1 = [ ["Armando", "P"], ["Dave", "S"] ]
   	tournament = game1
      winner = rps_tournament_winner(tournament, 0)
      print winner.inspect + "\n"
   end

   print "\n===== Test Case 6\n"
   begin
   	game1 = [ ["Armando", "P"], ["Dave", "S"] ]
   	game2 = [ ["Richard", "R"], ["Michael", "S"] ]
   	round1 = [game1, game2]
   
   	game3 = [ ["Allen", "S"], ["Omer", "P"] ]
   	game4 = [ ["David E.", "R"], ["Richard X.", "P"] ]
   	round2 = [game3, game4]
   
		tournament = [round1, round2]

      winner = rps_tournament_winner(tournament, 0)
      print winner.inspect + "\n"
   end

   print "\n===== Test Case 7\n"
   begin
      game1 = [ ["A1", "P"], ["A2", "S"] ]
      game2 = [ ["A3", "R"],  ["A4", "S"] ]
   	round1 = [game1, game2]

      game3 = [ ["Armando", "P"], ["Dave", "S"] ]
      game4 = [ ["Richard", "R"],  ["Michael", "S"] ]
   	round2 = [game3, game4]

      game5 = [ ["Armando", "P"], ["Dave", "S"] ]
      game6 = [ ["Richard", "R"],  ["Michael", "S"] ] 
   	round3 = [game5, game6]

      game7 = [ ["Armando", "P"], ["Dave", "S"] ]
      game8 = [ ["Richard", "R"],  ["Michael", "S"] ]
   	round4 = [game7, game8]

	   tournament = [
	  						[round1, round2],
	  						[round3, round4]
						 ]

      winner = rps_tournament_winner(tournament)
      print winner.inspect + "\n"
   end
end
