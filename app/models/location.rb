class Location < ActiveRecord::Base
  belongs_to  :contact
  belongs_to  :address

  has_many	:reports
  # has_many    :addresses #, :as => :addressable
  # has_many    :contacts, :through => :addresses

  default_scope where(:active => true)

end
