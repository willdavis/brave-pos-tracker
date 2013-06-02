class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.decimal :security
      t.integer :gate_count

      t.timestamps
    end
  end
end
