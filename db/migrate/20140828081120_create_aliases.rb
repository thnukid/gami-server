class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :username
      t.string :email
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
