class AddPilotNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :pilot_name, :string,  :null => false, :default => ""
    add_index :users, :pilot_name,            :unique => true
  end
end
