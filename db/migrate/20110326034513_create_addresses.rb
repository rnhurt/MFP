class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :street_number
      t.string  :street_number_suffix
      t.string  :street_name
      t.string  :street_type
      t.integer :street_direction_id
      t.integer :address_type_id
      t.string  :block
      t.string  :crossstreet
      
      t.integer :municipality_id  # Village / Town / City
      t.integer :district_id      # Province / State / County
      t.string  :postal_code
      t.integer :country_id

      t.decimal :latitude,  :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.boolean :active,  :default => true
      t.timestamps
    end
  end
end
