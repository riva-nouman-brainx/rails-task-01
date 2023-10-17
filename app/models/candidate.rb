class Candidate < ApplicationRecord
  has_many_attached :documents
  has_one_attached :profile_picture
  has_one_attached :resume
  belongs_to :position
  has_one :assign, dependent: :destroy
  has_one :assessment, through: :assign

  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true
  validates :industry_experience, presence: true
end
