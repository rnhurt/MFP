class County < ActiveRecord::Base
  belongs_to  	:state
  has_many    	:cities
  has_many		:street_names

  validates :state, :associated => true, :presence => true 
end
