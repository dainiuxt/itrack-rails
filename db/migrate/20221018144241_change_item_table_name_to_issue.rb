class ChangeItemTableNameToIssue < ActiveRecord::Migration[7.0]
  def change
    rename_table :items, :issues
  end
end
