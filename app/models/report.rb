class Report < ActiveRecord::Base
  has_many  :involvements
  has_many  :contacts,    :through => :involvements

  # has_many  :vehicle_involvements
  # has_many  :vehicles,  :through => :vehicle_involvements

  belongs_to  :report_type
  belongs_to  :how_reported
  belongs_to  :address
  belongs_to  :location
  belongs_to  :offense

  class << self
    # Find the reports that were most recently entered into the system
    def recent(lmt = 15); 
      limit(lmt).order("updated_at DESC").includes(:report_type)
    end
  end
  
end
