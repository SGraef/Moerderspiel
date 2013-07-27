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
    Player.create user: user,
                  name: name,
                  email: email,
                  game: self
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
  end
  
  def start_time
   starttime.time.strftime "%H:%M:%S %d-%m-%Y"
  end
  
  def end_time
    endtime.time.strftime "%H:%M:%S %d-%m-%Y"
  end
    
  def start
    players = self.player
    self.circles.each do |circle|
      play =players.shuffle 
      play.each_with_index do |player, i|
        if i < play.length
          Job.create killer: player,
                     victim: play[i+1],
                     circle: circle,
                     status: "unfinished",
                     key: Job.generate_key
        else i==play.length
          Job.create killer: player,
                     victim: play.first,
                     circle: circle,
                     status: "unfinished",
                     key: Job.generate_key
        end
      end
    end
  end
  
end
