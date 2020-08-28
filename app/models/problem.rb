class Problem < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  acts_as_favoritable

  CATEGORIES = ["Glass", "Construction Work", "Cycling Path"]

  belongs_to :user

  validates :category, presence: true
  validates :date, presence: true
end
