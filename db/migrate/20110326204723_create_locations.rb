class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :contact_id
      t.integer :address_id
      t.integer :role_id
      t.string  :phone_number
      t.string  :email_address

      t.boolean :active
    end
  end

  def self.down
    drop_table :locations
  end
end
