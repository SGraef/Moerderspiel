class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :gamemaster, index: true
      t.string :name

      t.timestamps
    end
  end
end
