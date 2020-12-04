class User < ApplicationRecord
  has_many :questions
  has_many :alternatives, through: :answers
  belongs_to :classroom
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  def answered
    # answered = Answers.where.(user_id: self.id).count(:answer_id)
    answered = <<-SQL
      SELECT count(*)
      FROM answers
      JOIN alternatives ON alternatives.id = answers.alternative_id
      WHERE answers.user_id = '#{self.id}'
    SQL
    answered = ActiveRecord::Base.connection.execute(answered).first["count"]
  end

  def corrects
    corrects = <<-SQL
      SELECT count(*)
      FROM answers
      JOIN alternatives ON alternatives.id = answers.alternative_id
      WHERE alternatives.is_correct = true AND answers.user_id = '#{self.id}'
    SQL
    corrects = ActiveRecord::Base.connection.execute(corrects).first["count"]
  end
end
