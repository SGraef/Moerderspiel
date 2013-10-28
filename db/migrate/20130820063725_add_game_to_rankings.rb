class AddGameToRankings < ActiveRecord::Migration
  def change
    add_column :rankings, :game_id, :integer
  end
end
