class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
    	t.integer :home, :away
    	t.integer :winner, :loser, default: 0
    	t.integer :homegoal, :awaygoal, default: 0
    	t.boolean :draw, default: true

      t.timestamps
    end
  end
end
