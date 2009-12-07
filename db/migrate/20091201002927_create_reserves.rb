class CreateReserves < ActiveRecord::Migration
  def self.up
    create_table :reserves do |t|
      t.references :court
      t.date :reserved_at
      t.string :reserve_time
      t.boolean :confirmed
      t.references :user
      t.integer :points
      t.timestamps
    end
  end
  
  def self.down
    drop_table :reserves
  end
end
