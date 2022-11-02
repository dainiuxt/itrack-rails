class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column(:projects, :created_by, :integer)
    add_column(:projects, :assignrd_to, :integer)
  end
end
