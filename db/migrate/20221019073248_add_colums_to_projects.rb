class AddColumsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :start, :datetime
    add_column :projects, :target_end, :datetime
    add_column :projects, :actual_end, :datetime
  end
end
