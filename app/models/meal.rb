class Meal < ApplicationRecord
  has_many :cookings, dependent: :destroy
  validates :title, presence: true
end
