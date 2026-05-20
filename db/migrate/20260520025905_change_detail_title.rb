class ChangeDetailTitle < ActiveRecord::Migration[8.1]
  def change
    rename_column :tasks, :Details, :details
  end
end
