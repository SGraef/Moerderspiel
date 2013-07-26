class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :jobs
  has_many :sjobs
  
  def get_jobs
    normal = Job.where(killer: self, status: "unfinished")
    special = ExtraJob.where(killer: self, status: "unfinished")
    jobs = normal + special
    return jobs
  end
end
