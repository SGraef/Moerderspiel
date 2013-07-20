class Game < ActiveRecord::Base
  belongs_to :gamemaster, class_name: 'User'
  has_many :player
  has_many :circles
  has_many :extrajobs
end
