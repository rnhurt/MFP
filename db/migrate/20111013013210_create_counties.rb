class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string    :code
      t.string    :local_code
      t.integer   :state_id
      t.string    :name

      t.boolean   :active, :default => true
      t.timestamps
    end
  end
end
