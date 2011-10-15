class County < ActiveRecord::Base
  belongs_to  :state
  has_many    :cities

  validates :state, :associated => true, :presence => true 
end
