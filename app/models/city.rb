class City < ActiveRecord::Base
  belongs_to  :county

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end
  default_scope where(:active => true)

  # FIXME: Once we get a better City2County mapping file then we
  # can turn this back on.  :/
  # validates :county, :associated => true, :presence => true 
end
