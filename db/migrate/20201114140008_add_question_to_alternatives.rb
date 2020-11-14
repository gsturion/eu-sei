class AddQuestionToAlternatives < ActiveRecord::Migration[6.0]
  def change
    add_reference :alternatives, :question, null: false, foreign_key: true
  end
end
