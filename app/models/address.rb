class Address < ActiveRecord::Base
  # belongs_to  :addressable, :polymorphic => true
  belongs_to  :country
  belongs_to  :state
  belongs_to  :county
  belongs_to  :city
  belongs_to  :address_type
  belongs_to  :street_direction
  has_many    :locations #, :as => :addressable
  has_many    :contacts, :through => :locations
  has_many    :reports

  default_scope where(:active => true)
  class << self
    def active; where(:active => true); end
    def inactive; where(:active => false); end
    def recent(lmt = 15); limit(lmt).order("created_at DESC"); end
    def search(terms)
      where('street_number LIKE :search OR street_name LIKE :search', {:search => "%#{terms}%"})
    end
  end

  def street_address
    "#{street_number} #{street_name}"
  end

  def full_address
    "#{street_address}, #{city} #{state} #{postal_code}"
  end

end
