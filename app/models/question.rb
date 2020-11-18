class Question < ApplicationRecord
  has_many :alternatives, dependent: :destroy
  belongs_to :classroom
end
