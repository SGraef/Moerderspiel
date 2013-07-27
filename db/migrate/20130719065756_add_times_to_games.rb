class AddTimesToGames < ActiveRecord::Migration
  def change
    add_column :games, :starttime, :datetime
    add_column :games, :endtime, :datetime
  end
end
