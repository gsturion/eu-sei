class Classroom < ApplicationRecord
  has_many :users
  has_many :questions
  has_one :chatroom

  validates :name, presence: true
  validates :year, presence: true
end
