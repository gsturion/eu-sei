class Alternative < ApplicationRecord
  belongs_to :question
  has_many :users, through: :answers
end
