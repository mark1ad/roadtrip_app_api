class City < ApplicationRecord
  default_scope { order("triporder")}
  belongs_to :roadtrip
  has_many :attractions
end
