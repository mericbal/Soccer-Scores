class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
    	t.string :name, null: false
    	t.integer :added_by

      t.timestamps
    end
  end
end
