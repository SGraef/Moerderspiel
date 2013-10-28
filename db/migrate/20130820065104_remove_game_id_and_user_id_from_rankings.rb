class RemoveGameIdAndUserIdFromRankings < ActiveRecord::Migration
  def change
    remove_column :rankings, :game_id, :integer
    remove_column :rankings, :user_id, :integer
    add_column :rankings, :player_id, :integer
  end
end
