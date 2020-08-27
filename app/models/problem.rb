class Problem < ApplicationRecord
  CATEGORIES = ["Glass", "Construction Work", "Cycling Path"]
  
  belongs_to :user

  validates :category, presence: true
  validates :date, presence: true

end
