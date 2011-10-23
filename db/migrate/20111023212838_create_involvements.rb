class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
      # t.string  :type
      t.integer :report_id
      t.integer :contact_id
      t.integer :role_id

      t.boolean :active, 	default: true
      t.timestamps
    end
  end
end
