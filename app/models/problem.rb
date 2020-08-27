class Problem < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :date, presence: true
end
