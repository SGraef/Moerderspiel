class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :user, index: true
      t.integer :points
      t.integer :sos

      t.timestamps
    end
  end
end
