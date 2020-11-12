class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :lesson
      t.timestamp :released_at

      t.timestamps
    end
  end
end
