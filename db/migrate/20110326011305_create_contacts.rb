class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer   :contact_type_id
      t.datetime  :incident_timestamp
      t.string  :ol_number
      t.integer :ol_state_id
      t.string  :title
      t.string  :first_name
      t.string  :middle_name
      t.string  :last_name
      t.string  :suffix
      t.string  :ssn
      t.date    :dob
      t.integer :race_id
      t.integer :gender_id
      t.integer :height
      t.integer :weight
      t.integer :eye_color_id
      t.integer :hair_color_id

      t.boolean :active,  default: true
      t.timestamps
    end
  end
end
