class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :contact_id
      t.string  :name

      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
