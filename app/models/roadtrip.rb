class Roadtrip < ApplicationRecord
  has_many :user_roadtrips
  has_many :users, through: :user_roadtrips
  has_many :cities
end
