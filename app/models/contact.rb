class Contact < ActiveRecord::Base
  belongs_to  :contact_type
  belongs_to  :race
  belongs_to  :gender
  has_many    :locations #, :as => :addressable
  has_many    :addresses, :through => :locations
  
  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
    def recent(lmt = 15); limit(lmt).order("created_at DESC"); end
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
