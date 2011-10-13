class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string    :code
      t.string    :local_code
      t.string    :abbreviation
      t.string    :name

      t.boolean   :active, :default => true
      t.timestamps
    end
  end
end
