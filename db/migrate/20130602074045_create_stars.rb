class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name,         :null => false, :default => ""
      t.decimal :security,    :null => false, :default => 1.0
      t.integer :gate_count,  :null => false, :default => 1

      t.timestamps
    end
    
    add_index :stars, :name,  :unique => true
  end
end
