class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :relationship_type_id
      t.integer :contact_id
      t.integer :contact_id_target
      
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
