class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.references :user, index: true
      t.string :aggregated_fact_name
      t.integer :value

      t.timestamps
    end
  end
end
