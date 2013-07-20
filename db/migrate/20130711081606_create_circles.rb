class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.references :game, index: true
      t.integer :number

      t.timestamps
    end
  end
end
