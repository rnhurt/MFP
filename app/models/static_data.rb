# This class handles all the static data in the application.  It allows us to
# efficiently use the same data in different parts of the application and persist
# it to the database as needed.
class StaticData < ActiveRecord::Base
  # validates :name, :value, :length => {:maximum => 40}

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end

    # Should we display everything in uppercase?
    def upcase?
      @@upcase ||= StaticData.active.find_by_name("UPCASE").value == "f" ? false : true
    end
    
    # What is the name of this site?
    def site_name
      @@site_name ||= StaticData.active.find_by_name("SITE_NAME").value
    end

    # Where is the this site located?
    def region_code
      @@region_code ||= StaticData.active.find_by_name("REGION_CODE").value
    end
  end
end
