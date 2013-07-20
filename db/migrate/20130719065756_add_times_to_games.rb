class AddTimesToGames < ActiveRecord::Migration
  def change
    add_column :games, :starttime, :time
    add_column :games, :endtime, :time
  end
end
