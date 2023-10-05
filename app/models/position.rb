class Position < ApplicationRecord
  has_many :candidates
  validates :title, presence: true
  validates :experience, presence: true
  validates :employment_type, presence: true
end
