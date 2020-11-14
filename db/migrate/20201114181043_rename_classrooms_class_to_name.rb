class RenameClassroomsClassToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :classrooms, :class, :name
  end
end
