class Area < ApplicationRecord
  has_many :careers
  validates :name_area, length: { in: 1..30 , message: "Must be between 3 characters and 30"}

end
