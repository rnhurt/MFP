class Code < ActiveRecord::Base
  belongs_to  :state

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end

end
