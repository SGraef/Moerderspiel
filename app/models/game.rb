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
  
  def start
    players = self.player
    self.circles.each do |circle|
      play =players.shuffle.shuffle 
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
