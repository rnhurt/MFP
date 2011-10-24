class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string    :number,  :null => false
      t.integer   :report_type_id
      t.integer   :how_reported_id
      t.integer   :offense_id
      t.integer   :address_id
      t.timestamp :date_start
      t.timestamp :date_end
      t.timestamp :reported_at
      t.timestamp :dispatched_at
      t.timestamp :arrived_at
      t.timestamp :cleared_at
      t.text      :narrative

      t.boolean :active,  :default => true
      t.timestamps
    end
  end
end
