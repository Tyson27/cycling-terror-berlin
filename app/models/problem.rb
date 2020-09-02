class Problem < ApplicationRecord

  belongs_to :user
  # skip_before_action :authenticate_user!, only :index
  # check with pundit
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  acts_as_favoritable
# check if its been used by someone currently
  CATEGORIES = ["glass", "construction_work", "cycling_path"]
  FORM_CATEGORIES = [
    ["Glass", "glass"], ["Construction work", "construction_work"], ["Cycling path", "cycling_path"]
  ]

  validates :category, presence: true
  validates :date, presence: true
end

