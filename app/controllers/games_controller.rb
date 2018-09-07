class GamesController < ApplicationController

	include GameHelper

	def new
		@game = Game.new
		p controller_name
	end #

	def create
		@game = Game.new(game_params)
		if @game.home == @game.away
			redirect_to new_game_path, alert: "Player can NOT play the game with him/herself"
		elsif @game.save
			@p1, @p2 = User.find(@game.home), User.find(@game.away)
			if @game.homegoal > @game.awaygoal
				winner_loser @game,@p1,@p2
				set_goals @game,@p1,@p2
				@p1.points += 3
				@p1.save and @p2.save and @game.save
				redirect_to :root, notice: "#{@p1.username} won !"
			elsif @game.homegoal < @game.awaygoal
				winner_loser @game,@p2,@p1
				set_goals @game,@p1,@p2
				@p2.points += 3
				@p1.save and @p2.save and @game.save
				redirect_to :root, notice: "#{@p2.username} won !"
			else @game.homegoal == @game.awaygoal
				set_goals @game,@p1,@p2
				@p1.points += 1 and @p2.points += 1
				@p1.save and @p2.save and @game.save
				redirect_to :root, notice: "Game is draw !"
			end
		end
		
	end # def
#
#
	private 

	def game_params
		params.require(:game).permit(:home, :away, :homegoal, :awaygoal, :winner, :loser, :draw)
	end
#
end # class