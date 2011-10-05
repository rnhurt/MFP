class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :email,               :null => false
      t.string    :crypted_password,    :default => nil
      t.string    :salt,                :default => nil
      t.integer   :failed_logins_count, :default => 0
      t.integer   :lock_expires_at,     :default => nil
      t.string    :remember_me_token,   :default => nil
      t.datetime  :remember_me_token_expires_at,  :default => nil

      t.string    :first_name,    :default => ""
      t.string    :last_name,     :default => ""
      t.string    :badge_number,  :default => nil

      t.boolean   :active,  :default => true
      t.timestamps
    end

    add_index :users, :remember_me_token
  end

  def self.down
    drop_table :users
  end
end