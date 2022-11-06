class RenameColumnInProjectsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :assignrd_to, :assigned_to
  end
end
