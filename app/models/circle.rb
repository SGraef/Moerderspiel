class Circle < ActiveRecord::Base
  belongs_to :game
  has_many :jobs
  
  def to_s
    gamename = self.game.name
    return "#{gamename} #{self.number}"
  end
end
