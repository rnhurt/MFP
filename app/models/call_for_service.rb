class CallForService < ActiveRecord::Base
  default_scope where(:active => true)
end
