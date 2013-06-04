class AddIceBeltCountToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :ice_belt_count, :integer, :null => false, :default => 0
  end
end
