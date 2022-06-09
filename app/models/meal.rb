class Meal < ApplicationRecord
  has_many :cookings, dependent: :destroy
  validates :title, presence: true
  acts_as_taggable_on :tags
end
