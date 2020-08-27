class Problem < ApplicationRecord
  validates :user, presence: true
  validates :category, presence: true
  validates :date, presence: true
end
