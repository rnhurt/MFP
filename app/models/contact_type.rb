class ContactType < ActiveRecord::Base
  has_many  :contacts

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
  end

end
