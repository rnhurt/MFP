class Country < ActiveRecord::Base
  has_many  :states

  default_scope where(:active => true)
end
