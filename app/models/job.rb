class Job < ActiveRecord::Base
  belongs_to :circle
  belongs_to :killer
  belongs_to :victim
end
