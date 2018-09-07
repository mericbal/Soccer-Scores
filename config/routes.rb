Rails.application.routes.draw do
  #
  devise_for :users
  #
	root to: "application#landing"
	#
	get '/profile'		=> 'application#index'
	get '/dashboard' 	=> 'dashboard#index'
	get '/all_players' => 'application#all_players'
	get '/points_table' => 'application#points_table'
	get '/all_played_games' => 'application#all_games'
	get	'/your_games' => 'application#your_games'
	get 'login' => 'application#login'
	#
	resources :teams, only: [:index, :new, :create] do
		member { get 'add_to_fav' }
	end
	#
	resources :games, only: [:new, :create]
	#
	#
end
