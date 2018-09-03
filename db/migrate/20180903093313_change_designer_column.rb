class ChangeDesignerColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :designer, :is_designer
  end
end
