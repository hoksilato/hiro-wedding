class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :code
      t.string :name
      t.references :group, foreign_key: true
      t.integer :num
      t.integer :table
      t.text :note

      t.timestamps
    end
    add_index :visitors, :code
    add_index :visitors, :name
    add_index :visitors, :num
    add_index :visitors, :table
  end
end
