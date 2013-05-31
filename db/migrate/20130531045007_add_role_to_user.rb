class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :null => false, :default => "unverified"
  end
end
