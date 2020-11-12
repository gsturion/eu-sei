class AddPropertiesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_teacher, :boolean
    add_column :users, :name, :string
    add_column :users, :subject, :string
  end
end
