class Question < ApplicationRecord
  has_many :alternatives, dependent: :destroy
  belongs_to :classroom
  belongs_to :user

  def answered?(user)
    query = <<-SQL
      SELECT count(*)
      FROM answers
      JOIN alternatives ON alternatives.id = answers.alternative_id
      JOIN questions ON questions.id = alternatives.question_id
      WHERE questions.id = '#{self.id}' AND answers.user_id = '#{user.id}'
    SQL

    count = ActiveRecord::Base.connection.execute(query).first["count"]
    count == 1
  end

  def can_be_displayed?
    if self.released_at != nil and self.released_at <= DateTime.now
      true
    else
      false
    end
  end
end
