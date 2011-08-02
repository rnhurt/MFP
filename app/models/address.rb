class Address < ActiveRecord::Base
  # belongs_to  :addressable, :polymorphic => true
  belongs_to  :region
  has_many    :locations #, :as => :addressable
  has_many    :contacts, :through => :locations

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
    "#{street_address}, #{city} #{region.try(:code)} #{postal_code}"
  end

  def street_name;  changecase(:street_name); end
  def city;         changecase(:city); end

  private

  # Change the case of the attribute if the user wants to see ALL UPPER CASE
  def changecase(attribute)
    (StaticData::upcase && self[attribute]) ? self[attribute].upcase : self[attribute]
  end
end
