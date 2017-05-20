class Attraction < ApplicationRecord
  default_scope { order("name")}
  belongs_to :city
end
