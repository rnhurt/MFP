class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string  :type
      t.integer :parent_id
      t.string  :region_code
      t.string  :code
      t.string  :value

      t.boolean :active,  :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
