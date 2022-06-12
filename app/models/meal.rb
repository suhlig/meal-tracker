class Meal < ApplicationRecord
  has_many :cookings, dependent: :destroy
  validates :title, presence: true
  acts_as_taggable_on :tags

  scope :top10, -> {
    select("meals.id, title, count(cookings.id) AS cookings_count").
    joins(:cookings).
    group("meals.id").
    order("cookings_count DESC").
    limit(10)
  }
end
