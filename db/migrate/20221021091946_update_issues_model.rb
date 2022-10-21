class UpdateIssuesModel < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :summary, :string
    add_column :issues, :priority, :string
    add_column :issues, :created_by, :integer
    add_column :issues, :assigned_to, :integer
    add_column :issues, :assigned_by, :integer
    add_column :issues, :resolution_plan, :datetime
    add_column :issues, :resolution_actual, :datetime
    add_column :issues, :resolution_summary, :text
  end
end
