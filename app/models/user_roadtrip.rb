class UserRoadtrip < ApplicationRecord
  belongs_to :user
  belongs_to :roadtrip
end
