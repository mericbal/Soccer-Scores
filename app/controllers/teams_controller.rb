class TeamsController < ApplicationController

	def index
		sleep 0.5
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			@team.added_by = current_user.id
			respond_to do |f|
				f.html { redirect_to teams_path, notice: 'New team added !' }
				# f.js
			end
			
		else
			render :new
		end
	end

	def add_to_fav
		@team = Team.find(params[:id])
		if current_user.favs.include? @team.id
			redirect_to teams_path, alert: 'Noo'
		else
			current_user.favs << @team.id
			current_user.save
			redirect_to teams_path, notice: 'team added to your favs .'
		end
	end


	private

	def team_params
		params.require(:team).permit(:name, :added_by)
	end

end