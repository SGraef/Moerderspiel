class Job < ActiveRecord::Base
  belongs_to :circle
  belongs_to :killer, class_name: "Player"
  belongs_to :victim, class_name: "Player"
  
  
  def self.generate_key
    tmp = ""; while (tmp.length < 12) do 
      tmp+= Random.rand(127).chr; tmp.gsub!(/\W/,'')
    end
    return tmp
  end
  
  def kill(message)
    self.status = "done"
    self.plot = message
    job = Job.where(circle: self.circle, killer:self.victim, status:"unfinished").first
    if !job.nil?
      job.status ="canceled"
      Job.create(circle: self.circle, killer: self.killer, key: job.key, victim:job.victim, status:"unfinished")
      job.save
    end
    if self.killer.user
      #self.killer.calculate_points(self.victim, self.circle.game)
    end
    self.save
  end
  
end
