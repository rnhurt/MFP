class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string    :code
      t.string    :local_code
      t.integer   :county_id
      t.string    :name

      t.boolean   :active, :default => true
      t.timestamps
    end
  end
end
