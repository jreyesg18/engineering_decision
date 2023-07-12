class Career < ApplicationRecord
  belongs_to :area
  belongs_to :user

  validates :name_career, length: {in: 3...100, message: "Must be between 3 characters and 100"}
  validates :job_title, length: {in: 3...10000, message: "Must be between 3 characters and 10000"}
  validates :grade_title, length: {in: 3...100, message: "Must be between 3 characters and 100"}
  validates :duration,  presence: true
  validates :graduate_profile, length: {in: 3...10000, message: "Must be between 3 characters and 10000"}
  validates :occupational_field, length: {in: 3...10000, message: "Must be between 3 characters and 10000"}
  validates :area_id,  presence: true
end

