class Search# < ActiveRecord::Base
  class << self
    # def recent(lmt = 15); limit(lmt).order("incident_timestamp DESC"); end
    
    def find(terms)
      results = {}
      results[:contacts]  = Contact.recent.search(terms)
      results[:addresses] = Address.recent.search(terms)
      results
    end
  end

end
