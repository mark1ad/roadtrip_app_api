class User < ApplicationRecord
  has_many :user_roadtrips
  has_many :roadtrips, through: :user_roadtrips
end
