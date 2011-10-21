class Contact < ActiveRecord::Base

  belongs_to  :race
  belongs_to  :gender
  belongs_to  :hair_color
  belongs_to  :eye_color
  has_many    :locations #, :as => :addressable
  has_many    :addresses, :through => :locations
  has_many    :aliases
  belongs_to  :contact_type


  # Let's do some tricky relationship management here.  These relationships allow us to bind Contacts together
  # by type [Family, Aliases, Neighbors, Acquaintances, etc.] and make it easy to build graphs and show how
  # Contacts might know each other.
  # Set up the outbound relationships
  has_many :relationships_out, :class_name => "Relationship", :foreign_key => "contact_id"
  has_many :relationship_out, :through => :relationships_out, :source => "contact_target",  :foreign_key => "contact_id"
  # Set up the inbound relationships
  has_many :relationships_in, :class_name => "Relationship", :foreign_key => "contact_id_target"
  has_many :relationship_in, :through => :relationships_in, :source => "contact", :foreign_key => "contact_id_target"
  # Build some convenience classes
  def relationships; Relationship.related(self.id); end      


  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
    def recent(lmt = 15); limit(lmt).order("incident_timestamp DESC"); end
  end
  

  # Show the contact's full name
  def full_name
    "#{first_name} #{last_name}"
  end
 
  # Define the search functionality of this class
  # FIXME: This is horrible and can probably be done much better
  def self.search(search)
    if search
      where('first_name LIKE :search OR last_name LIKE :search', {:search => "%#{search}%"})
    else
      all
    end
  end

 end
