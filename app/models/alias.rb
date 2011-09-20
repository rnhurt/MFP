class Alias < ActiveRecord::Base
  belongs_to  :contact

  validates :name, :presence => true
end
