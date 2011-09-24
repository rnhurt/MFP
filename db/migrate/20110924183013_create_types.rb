class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string  :type
      t.string  :name
      
      t.boolean :active,  :default => true
      t.timestamps
    end
  end
end
