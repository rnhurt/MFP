class User < ActiveRecord::Base
  authenticates_with_sorcery!
    
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :badge_number

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, :first_name, :last_name, :presence => true, :uniqueness => true
end
