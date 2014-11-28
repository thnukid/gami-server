class AddhasEarnedtoBadge < ActiveRecord::Migration
  def up 
    add_column :badges, :hasEarned, :boolean, :default => true
  end
  def down
    add_column :badges, :hasEarned, :boolean, :default => nil 
  end
end
