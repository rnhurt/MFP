class Relationship < ActiveRecord::Base
    belongs_to :contact
    belongs_to :contact_target, :class_name => "Contact", :foreign_key => "contact_id_target"        # the target of the friend relationship 

    validates_presence_of :contact, :contact_target

    class << self
      def active; where(:active => true); end
      def inactive; where(:active => false); end
      def related(id); where("contact_id = (?) OR contact_id_target = (?)", id, id); end
    end

end
