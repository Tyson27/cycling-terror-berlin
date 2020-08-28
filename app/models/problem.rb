class Problem < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ["Glass", "Construction Work", "Cycling Path"]


  validates :category, presence: true
  validates :date, presence: true
end
