class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
