class Meal < ApplicationRecord
  has_many :cookings
  validates :title, presence: true
end
