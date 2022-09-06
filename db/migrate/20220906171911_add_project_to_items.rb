class AddProjectToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :project, :integer
  end
end
