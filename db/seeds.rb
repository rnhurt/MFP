# Offical Locale codes
############################
print "Seeding Country codes..."
Country.delete_all
open(File.join(Rails.root, "db", "seeds", "ISOCountryCodes.txt")) do |countries|
  countries.read.each_line do |country|
    code, abbr, name = country.chomp.split("|")
    Country.create!(:code => code, :abbreviation => abbr, :name => name)
  end
end
puts "done"

print "Seeding State codes..."
State.delete_all
us = Country.find_by_abbreviation("US")
open(File.join(Rails.root, "db", "seeds", "ANSIStateCodes.txt")) do |states|
  states.read.each_line do |state|
    code, abbr, name = state.chomp.split("|")
    State.create!(:code => code, :abbreviation => abbr, :name => name.titleize, :country => us)
  end
end
puts "done"

print "Seeding County codes..."
County.delete_all
open(File.join(Rails.root, "db", "seeds", "ANSICountyCodes.txt")) do |counties|
  counties.read.each_line do |county|
    state_code, code, name = county.chomp.split("|")
    state = State.find_by_code(state_code)
    County.create!(:code => code, :name => name.titleize, :state => state)
  end
end
puts "done"

print "Seeding City(KY) codes..."
# First, build a hash to map between cities and counties
city2county = {}
open(File.join(Rails.root, "db", "seeds", "City2CountyMap-KY.txt")) do |mapping|
  mapping.read.each_line do |line|
    city, county = line.chomp.split("|")
    city2county.store(city.titleize, county.titleize)
  end
end
# Now, populate the database using the hash as a lookup
City.delete_all
open(File.join(Rails.root, "db", "seeds", "FIPSCityCodes-KY.txt")) do |cities|
  cities.read.each_line do |city|
    code, name = city.chomp.split("|")
    county = County.find_by_name(city2county[name.titleize])
    City.create!(:code => code, :name => name, :county => county)
  end
end
puts "done"

state = State.find_by_abbreviation("KY")
puts "Seeding Street(#{state.abbreviation}) codes..."
counties = state.counties.order("name asc")
StreetName.delete_all
Dir.glob(File.join(Rails.root, "db", "seeds", "StreetCodes-#{state.abbreviation}", "*.*")) do |file|
  puts "  loading file '#{File.basename(file)}'..."
  open(file) do |streets|
    streets.read.each_line do |street|
      name, code = street.chomp.split("  ").delete_if{|i| i.length < 1}
      StreetName.create!(:code => code.strip[0..4], :name => name.titleize, :county => counties[code.strip[0..2].to_i - 1])
    end
  end
end
puts "done"


# Dingo specific codes
############################
COUNTRY = Country.find_by_abbreviation("US")
STATE   = State.find_by_abbreviation("KY")

print "Seeding static data..."
StaticData.delete_all
StaticData.create(:name => "UPCASE",      :value => true)
StaticData.create(:name => "SITE_NAME",   :value => "Metro County")
StaticData.create(:name => "STATE_ID",    :value => STATE.id)
puts "done"

print "Seeding Admin User..."
User.delete_all
User.create(:email => "admin@example.com", :password => "admin", :first_name => "Admin", :last_name => "User")
puts "done"

print "Seeding Contact Types..."
ContactType.delete_all
%w(F.I. Warning Citation Arrest Suspect Victim Witness).each do |type|
  ContactType.create(:name => type)
end
puts "done"

print "Seeding Relationship Types..."
RelationshipType.delete_all
%w(Alias Family Neighbor Gang).each do |type|
  RelationshipType.create(:name => type)
end
puts "done"



# Offical NCIC codes
############################
print "Seeding NCIC Offense codes..."
Offense.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICOffenseCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Offense.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Property Type codes..."
PropertyType.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICPropertyTypeCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    PropertyType.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Race codes..."
Race.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICRaceCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Race.create(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Gender codes..."
Gender.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICGenderCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Gender.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Vehicle Make codes..."
VehicleMake.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleMakeCodes.txt")) do |vcodes|
  vcodes.read.each_line do |vcode|
    code, value = vcode.chomp.split("|")
    VehicleMake.create!(:state => STATE, :code => code, :value => value.titleize)
  end
end
puts "done"

print "Seeding NCIC Vehicle Model codes..."
VehicleModel.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleModelCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, abbr, value = code_line.chomp.split("|")
    VehicleModel.create!(:state => STATE, :code => code, :value => value.titleize)
  end
end
puts "done"

print "Seeding NCIC Vehicle Color codes..."
VehicleColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    VehicleColor.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Eye Color codes..."
EyeColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICEyeColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    EyeColor.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"

print "Seeding NCIC Hair Color codes..."
HairColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICHairColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    HairColor.create!(:state => STATE, :code => code, :value => value)
  end
end
puts "done"


puts " * Inserting Testing Data *"
#######################################################
# TESTING DATA                                        #
# This should be removed before moving to production  #
#######################################################
print "Seeding Addresses..."
Address.delete_all
(1..100).each do |r|
  Address.create(:id => r,
    :street_number => Faker::Base.numerify("#####"), 
    :street_name  => Faker::Address.street_name,
    :state        => State.find_by_abbreviation(Faker::Address.state_abbr), 
    :county       => County.first, 
    :city         => City.first, 
    :postal_code  => Faker::Address.postcode,
    :active       => true
  )
end
puts "done"

print "Seeding Contacts..."
Contact.delete_all
contact_type_count  = ContactType.count
address_count       = Address.count

(1..100).each do |r|
  # Give every contact some address information
  addresses = []
  (0..rand(5)).each{ |i| addresses << Address.find(:first, :offset => (address_count * rand).to_i) }

  # Build the contact...
  Contact.create(
    :contact_type       => ContactType.find(:first, :offset => (contact_type_count * rand).to_i),
    :incident_timestamp => Date.today - rand(2000000).minutes,
    :first_name         => Faker::Name.first_name,
    :last_name          => Faker::Name.last_name,
    :dob                => Date.today - (rand(20000)+3000).days,
    :addresses          => addresses,
    :race               => Race.find_by_code(%w[A B I O U W].rand),
    :gender             => Gender.find_by_code(%w[M F U].rand),
    :active             => true
  )
end
puts "done"