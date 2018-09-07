module GameHelper
#
	def winner_loser game, winner, loser 
		game.winner, game.loser, game.draw = winner.id, loser.id, false
	end

	def set_goals game, p1, p2
		p1.goals_s += game.homegoal and p1.goals_a += game.awaygoal
		p2.goals_s += game.awaygoal and p2.goals_a += game.homegoal
	end
#
end
