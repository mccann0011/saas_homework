# (b) A rock, paper, scissors tournament is encoded as a bracketed array of games - that is, each 
# element can be considered its own tournament.
[ [
[ ["Richard", "R"], ["Michael", "S"] ], ],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
] ]
[ ["Armando", "P"], ["Dave", "S"] ],


# Under this scenario, Dave would beat Armando (S>P), Richard would beat Michael (R>S), and then 
# Dave and Richard would play (Richard wins since R>S); similarly, Allen would beat Omer, David E. 
# would beat Richard X., and Allen and Richard X. would play (Allen wins since S>P); and finally 
# Richard would beat Allen since R>P, that is, continue until there is only a single winner. Write 
# a method rps_tournament_winner that takes a tournament encoded as a bracketed array and returns 
# the winner (for the above example, it should return [“Richard”, “R”]). You can assume that the 
# array is well formed (that is, there are 2^n players, and each one participates in exactly one 
# match per round).