# This class handles all the static data in the application.  It allows us to
# efficiently use the same data in different parts of the application and persist
# it to the database as needed.
class StaticData < ActiveRecord::Base
  # validates :name, :value, :length => {:maximum => 40}

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end

  # Should we display everything in uppercase?
  def self.upcase
    @@upcase ||= StaticData.active.find_by_name("UPCASE").value == "f" ? false : true
  end
  
end
