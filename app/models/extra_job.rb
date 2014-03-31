class ExtraJob < ActiveRecord::Base
  belongs_to :game
  belongs_to :killer
  belongs_to :victim

  def kill(message)
    self.status = "done"
    self.plot = message
    if self.killer.user
      #self.killer.calculate_points(self.victim, self.circle.game)
    end
    self.save
  end
end
