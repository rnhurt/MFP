class Address < ActiveRecord::Base
  belongs_to  :addressable, :polymorphic => true
  belongs_to  :region

  def address
    "#{street_number} #{street_name}, #{city} #{region} #{postal_code}"
  end
end
