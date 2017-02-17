class ChangeTypeTableColumnInVisitors < ActiveRecord::Migration[5.0]
  def change
    change_column :visitors, :table, :string
  end
end
