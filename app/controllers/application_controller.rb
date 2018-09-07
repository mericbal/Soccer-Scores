class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def landing
    redirect_to '/profile' if current_user
  end

  def index
    @teams = Team.all.order(created_at: :asc)
  end

  def login
    redirect_to new_user_registration_path
  end

  def your_games
  end

  def all_players
    @users = User.all
  end

  def points_table
    @users = User.all.order(points: :desc)
  end

  def all_games
    @all_games = Game.all
    @your_games = current_user.games
    @games_won = @your_games.select { |g| g.winner == current_user.id }
    @games_lost = @your_games.select { |g| g.loser == current_user.id }
    @games_draw = @your_games.select { |g| g.draw }
  end


  # for devise 
  before_action :configure_permitted_parameters, if: :devise_controller?
  #
	
  # for devise
	protected

  def configure_permitted_parameters
    attributes = [:username, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
  #
  
end
