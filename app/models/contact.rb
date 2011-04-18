class Contact < ActiveRecord::Base

  belongs_to  :contact_type
  belongs_to  :race
  belongs_to  :gender
  has_many    :locations #, :as => :addressable
  has_many    :addresses, :through => :locations

  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
    def recent(lmt = 15); limit(lmt).order("incident_timestamp DESC"); end
  end
  
  # Show the contact's full name
  def full_name
    "#{first_name} #{last_name}"
  end
 
  # Change the case of these elements if the system is configured for case sensitivity
  def first_name;   changecase(:first_name); end
  def last_name;    changecase(:last_name); end

  # Define the search functionality of this class
  def self.search(search)
    if search
      where('first_name LIKE :search OR last_name LIKE :search', {:search => "%#{search}%"})
    else
      all
    end
  end

  private

  # Change the case of the attribute if the user wants to see ALL UPPER CASE
  def changecase(attribute)
    (StaticData::upcase && self[attribute]) ? self[attribute].upcase : self[attribute]
  end
end
