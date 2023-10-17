class Assessment < ApplicationRecord
  has_one_attached :test
  has_many :assigns, dependent: :destroy
  has_many :candidates, through: :assign
end
