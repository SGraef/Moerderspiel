class AddPlotToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :plot, :string
  end
end
