class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # has_many :games, class_name: 'Game', foreign_key: :home, foreign_key: :away
  has_many :homegames, class_name: 'Game', foreign_key: :home
  has_many :awaygames, class_name: 'Game', foreign_key: :away

  def games
  	self.homegames + self.awaygames
  end

  def total
    tot = 0
    tot += (self.wins?)*3
    tot += (self.draws?)*1
    tot
  end



  def add_points num
  	self.points << num
  end

  def add_goals num
  	self.goals_s << num
  end

  def wins?
  	Game.all.where(winner: self.id).count
  end

  def draws?
  	self.games.select { |g| g.draw == true }.count
  end

  def lost?
    Game.all.where(loser: self.id).count
  end

	def add_fav team
		self.favs << team
	end

  def percent num
    (100/self.games.count) * num
  end

end
