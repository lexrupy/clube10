class CreateConfirmations < ActiveRecord::Migration
  def self.up
    create_table :confirmations do |t|
      t.references :user
      t.references :reserve
      t.boolean :credit_card
      t.timestamps
    end
  end

  def self.down
    drop_table :confirmations
  end
end
