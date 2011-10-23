class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
      t.string  :type
      t.integer :report_id
      t.integer :involved_id
      t.integer :role_id

      t.boolean :active
      t.timestamps
    end
  end
end
