class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :address_type_id
      t.string  :street_number
      t.string  :street_number_suffix
      t.string  :street_name
      t.string  :street_type
      t.integer :street_direction_id
      t.string  :block
      t.string  :crossstreet
      
      t.integer :country_id
      t.integer :state_id
      t.integer :county_id
      t.integer :city_id
      t.string  :postal_code

      t.decimal :latitude,  :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.boolean :active,  :default => true
      t.timestamps
    end
  end
end
