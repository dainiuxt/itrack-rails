class AddProjectRefToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :project, null: false, foreign_key: true, default: false
  end
end
