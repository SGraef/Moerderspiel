class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :jobs
  has_many :sjobs, class_name: "ExtraJob"
  
  def get_jobs
    normal = Job.where(killer: self, status: "unfinished")
  end
  
  def get_sjobs
    special = ExtraJob.where(killer: self, status: "unfinished")
  end
  
  def alive?
    return self.game.circles.size == Job.where(victim: self, status: "finished")
  end
end
