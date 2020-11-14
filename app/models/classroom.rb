class Classroom < ApplicationRecord
  has_many :users
  has_many :questions

  validates :name, presence: true
  validates :year, presence: true
end
