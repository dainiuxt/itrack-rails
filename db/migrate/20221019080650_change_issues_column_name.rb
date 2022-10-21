class ChangeIssuesColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :issues, :body, :description
  end
end
