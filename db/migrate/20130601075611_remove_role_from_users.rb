class RemoveRoleFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :role, :string
  end

  def down
    add_column :users, :role, :string, :null => false, :default => "unverified"
  end
end
