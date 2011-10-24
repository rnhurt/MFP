class Type < ActiveRecord::Base

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end

  default_scope where(:active => true)
end
