class AddTweetToGames < ActiveRecord::Migration
  def change
    add_column :games, :tweet, :boolean
  end
end
