class ExtraJob < ActiveRecord::Base
  belongs_to :game
  belongs_to :killer
  belongs_to :victim
end
