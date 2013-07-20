class CreateExtraJobs < ActiveRecord::Migration
  def change
    create_table :extra_jobs do |t|
      t.references :game, index: true
      t.references :killer, index: true
      t.references :victim, index: true
      t.string :key
      t.string :status

      t.timestamps
    end
  end
end
