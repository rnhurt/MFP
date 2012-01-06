class Contact < ActiveRecord::Base
  belongs_to  :race
  belongs_to  :gender
  belongs_to  :hair_color
  belongs_to  :eye_color
  has_many    :locations #, :as => :addressable
  has_many    :addresses, :through => :locations
  has_many    :aliases
  belongs_to  :contact_type
  has_many    :involvements, :foreign_key => 'involved_id'
  has_many    :reports, :through => :involvements

  accepts_nested_attributes_for :addresses
  
  default_scope where(:active => true)


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
    
    # Find the contacts that were most recently entered into the system
    def recent(lmt = 14);
      limit(lmt).order("updated_at DESC").includes(:contact_type, [{:addresses => [:city, :state]}], :race, :gender)
    end

    # Group all contacts by type and count the number of incidents for each one.
    # OPTIMIZE: I'm sure this is hokey and could probably be better.
    def type_counts
      types = ContactType.all
      type_hash = {}
      Contact.count(:all, :group => "contact_type_id").map{|k,v| type_hash[types.select{|i| i.id == k}[0].name] = v }
      type_hash
    end

    # Define the search functionality of this class
    # OPTIMIZE: This is horrible and can probably be done much better
    def search(terms)
      unless terms.blank?
        where('first_name LIKE :terms OR last_name LIKE :terms', {:terms => "%#{terms}%"})
      else
        all
      end
    end
  end
  

  # Show the contact's full name
  def full_name
    "#{first_name} #{last_name}"
  end
 
 end
