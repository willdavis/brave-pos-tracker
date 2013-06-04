class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name,                   :null => false, :default => ""
      t.integer :asteroid_belt_count,   :null => false, :default => 0
      t.integer :poco_owner_id

      t.timestamps
    end
    
    add_index :planets, :name,     :unique => true
  end
end
