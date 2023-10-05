class Candidate < ApplicationRecord
  belongs_to :position

  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true
  validates :industry_experience, presence: true
end
