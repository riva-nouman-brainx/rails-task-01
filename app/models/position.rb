class Position < ApplicationRecord
  has_many :candidates
  has_one_attached :thumbnail
  validates :title, presence: true
  validates :experience, presence: true
  validates :employment_type, presence: true
end
