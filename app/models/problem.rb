class Problem < ApplicationRecord

  belongs_to :user
  # skip_before_action :authenticate_user!, only :index
  # check with pundit
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  acts_as_favoritable

  CATEGORIES = ["Construction work", "Cycling path", "Glass"]

  validates :category, presence: true
  validates :date, presence: true
end
