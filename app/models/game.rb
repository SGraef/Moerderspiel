class Game < ActiveRecord::Base
  belongs_to :gamemaster, class_name: 'User'
  has_many :player
  has_many :circles
  has_many :extrajobs
  after_create :create_circles
  
  def circle_count
    @circle_count || 1
  end
  
  def circle_count=(circle_count)
    @circle_count = circle_count.to_i
  end
  
  def create_circles
    circle_count.times do |i|
      Circle.create number: (i+1),
                    game_id: self.id
    end
  end
  
  
  def participate(user=nil, name=nil, email=nil)
    if user.nil?
      if(Player.where(name: name, game: self).empty? &&
         Player.where(email: email, game: self).empty?)
         Player.create name: name,
                       email: email,
                       game: self
        return true
      else
        return false
      end
    else
      if(Player.where(user: user, game: self).empty?)
         Player.create user: user,
                       game: self
        return true
      else
        return false
      end
    end
  end
  
  def get_player_statistics
    "#{get_living_player.size}/#{self.player.size}"
  end
  
  def get_living_player
    players = []
    self.player.each do |player|
      if player.alive?
        players << player
      end
    end
    return players
  end
  
    
  def start
    players = self.player
    self.circles.each do |circle|
      play =players.shuffle 
      play.each_with_index do |player, i|
        if player==play.last
          Job.create killer: player,
                     victim: play.first,
                     circle: circle,
                     status: "unfinished",
                     key: Job.generate_key
        else
          Job.create killer: player,
                     victim: play[i+1],
                     circle: circle,
                     status: "unfinished",
                     key: Job.generate_key
        end
      end
    end
    self.update_attributes(status: "running")
  end
  
  def end_game
    jobs = Job.where(circle_id: self.circles, status: "unfinished")
    jobs.each do |job|
      job.update_attributes(status: "canceled")
    end
    self.update_attributes(status: "finished")
  end
  
  def finished_jobs
    Job.where(circle_id: self.circles, status: "done")
  end
end
