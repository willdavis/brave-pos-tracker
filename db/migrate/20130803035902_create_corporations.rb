class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :name
      t.integer :eve_id

      t.timestamps
    end
    
    add_index :corporations, :eve_id, :unique => :true
  end
end
