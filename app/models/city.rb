class City < ActiveRecord::Base
  belongs_to  :county

  default_scope where(:active => true)

  # FIXME: Once we get a better City2County mapping file then we
  # can turn this back on.  :/
  # validates :county, :associated => true, :presence => true 
end
