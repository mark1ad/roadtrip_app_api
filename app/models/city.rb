class City < ApplicationRecord
  belongs_to :roadtrip
  has_many :attractions
end
