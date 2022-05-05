class Cooking < ApplicationRecord
  belongs_to :meal
  validates :cooked_at, presence: true
  validates_uniqueness_of :meal_id, :scope => :cooked_at
end
