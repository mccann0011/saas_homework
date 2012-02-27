# In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors 
# (S). The rules are: Rock beats Scissors, Scissors beats Paper, but Paper beats Rock.
# A rock-paper-scissors game is encoded as a list, where the elements are 2-element lists that 
# encode a player’s name and a player’s strategy.

[ [ "Armando", "P" ], [ "Dave", "S" ] ]
# => returns the list ["Dave", "S"] wins since S>P

# (a) Write a method rps_game_winner that takes a two-element list and behaves as follows:
# - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
# - If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise 
#      NoSuchStrategyError
# - Otherwise, return the name and strategy of the winning player. 
# If both players use the same strategy, the first player is the winner.

# We'll get you started:

class WrongNumberOfPlayersError < StandardError ; 
end 

class NoSuchStrategyError < StandardError ; 
end

def rps_game_winner(game)
raise WrongNumberOfPlayersError unless game.length == 2 
# your code here
end