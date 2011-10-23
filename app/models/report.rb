class Report < ActiveRecord::Base
  has_many  :involvements
  has_many  :contacts,    :through => :involvements

  # has_many  :vehicle_involvements
  # has_many  :vehicles,  :through => :vehicle_involvements

  belongs_to  :location
  belongs_to  :offense

end
