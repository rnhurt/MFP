class County < ActiveRecord::Base
  belongs_to  	:state
  has_many    	:cities
  has_many		:street_names

  default_scope where(:active => true)

  validates :state, :associated => true, :presence => true 
end
