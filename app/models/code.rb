class Code < ActiveRecord::Base

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end

  def value; self[:value].upcase if self[:value]; end
  
end
