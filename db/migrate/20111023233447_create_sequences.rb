class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.integer   :offense_id

      t.timestamps
    end
  end
end
