class RemoveStars < ActiveRecord::Migration
  def change
    drop_table :stars
  end
end
