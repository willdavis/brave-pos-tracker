class AddPilotNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :pilot_name, :string,  :null => false
    add_index :users, :pilot_name,            :unique => true
  end
end
