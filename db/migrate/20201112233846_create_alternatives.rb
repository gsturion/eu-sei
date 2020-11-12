class CreateAlternatives < ActiveRecord::Migration[6.0]
  def change
    create_table :alternatives do |t|
      t.text :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
