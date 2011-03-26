class Contact < ActiveRecord::Base
  belongs_to  :contact_type
  belongs_to  :race
  has_many    :addresses, :as => :addressable
  
  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
    def recent(lmt = 15); limit(lmt).order("created_at DESC"); end
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
