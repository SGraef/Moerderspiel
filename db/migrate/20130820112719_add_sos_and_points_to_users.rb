class AddSosAndPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sos, :integer
    add_column :users, :points, :integer
  end
end
