class Classroom < ApplicationRecord
  has_many :users, :questions
end
