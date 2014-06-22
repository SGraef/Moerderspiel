class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :rankings
  has_many :jobs
  has_many :sjobs, class_name: "ExtraJob"

  def get_jobs
    normal = Job.where(killer: self, status: "unfinished")
  end

  def get_sjobs
    special = ExtraJob.where(killer: self, status: "unfinished")
  end

  def get_name
    if self.user.nil?
      return self.name
    else
      return self.user.username
    end
  end

  def has_multi_kill?
    self.get_jobs.group(:victim_id).having("COUNT(victim_id) > 1").to_a.size > 0
  end

  def alive?
    return self.game.circles.size != Job.where(victim: self, status: "finished").size && self.game.circles.size != Job.where(victim: self, status: "canceled").size
  end

  def ranking
    self.rankings.first
  end

  def calculate_points victim, game

  end
  
  def to_s
    self.get_name
  end
end
