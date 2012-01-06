class State < ActiveRecord::Base
  belongs_to  :country
  has_many    :counties
  has_many    :codes

  validates :country, :associated => true, :presence => true 

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end
  default_scope where(:active => true)
end
