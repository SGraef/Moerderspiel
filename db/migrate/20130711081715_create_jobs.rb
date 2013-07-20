class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :circle, index: true
      t.references :killer, index: true
      t.references :victim, index: true
      t.string :key
      t.string :status

      t.timestamps
    end
  end
end
