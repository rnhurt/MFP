class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string    :code
      t.string    :local_code
      t.integer   :country_id
      t.string    :name
      t.string    :abbreviation

      t.boolean     :active, :default => true
      t.timestamps
    end
  end
end
