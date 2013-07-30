class AddTimeToJobsAndExtraJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :time, :datetime
    add_column :extra_jobs, :time, :datetime
  end
end
