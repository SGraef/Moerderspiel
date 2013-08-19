class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password,                presence: true, confirmation: true, length: { minimum: 3}
  validates :email,                   presence: true, uniqueness: true
  has_many :player
  has_many :games
  has_one :ranking
end
