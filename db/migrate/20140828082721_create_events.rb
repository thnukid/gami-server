class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :data
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
