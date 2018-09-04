class ChangeUserToDesigner < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :user_id, :designer_id
  end
end
