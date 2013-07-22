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
end
