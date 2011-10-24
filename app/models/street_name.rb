class StreetName < ActiveRecord::Base
  belongs_to	:county

  default_scope where(:active => true)
end
