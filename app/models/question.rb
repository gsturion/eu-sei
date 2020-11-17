class Question < ApplicationRecord
  has_many :alternatives, dependent: :destroy
  belongs_to :classroom
  belongs_to :user
end
