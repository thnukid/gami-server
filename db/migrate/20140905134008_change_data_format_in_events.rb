class ChangeDataFormatInEvents < ActiveRecord::Migration
  def up
    change_column :events , :data, :text
  end
  def down
    change_column :events , :data, :string
  end
end
