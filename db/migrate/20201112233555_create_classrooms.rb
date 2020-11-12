class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :class
      t.integer :year

      t.timestamps
    end
  end
end
