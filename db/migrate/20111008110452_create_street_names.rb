class CreateStreetNames < ActiveRecord::Migration
  def change
    create_table :street_names do |t|
      t.string    :code
      t.string    :local_code
      t.integer   :county_id
      t.string    :name

      t.boolean   :active, :default => true
      t.timestamps
    end
  end
end
