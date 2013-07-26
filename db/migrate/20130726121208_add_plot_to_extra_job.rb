class AddPlotToExtraJob < ActiveRecord::Migration
  def change
    add_column :extra_jobs, :plot, :string
  end
end
