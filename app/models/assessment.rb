class Assessment < ApplicationRecord
  has_one_attached :test
  has_one :assign
  has_many :candidates, through: :assign
end
