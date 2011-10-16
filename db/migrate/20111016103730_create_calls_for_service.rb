class CreateCallsForService < ActiveRecord::Migration
  def change
    create_table :calls_for_service do |t|

      t.boolean     :active,    :default => true
      t.timestamps
    end
  end
end
