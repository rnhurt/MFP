print "Seeding static data..."
StaticData.delete_all
StaticData.create(:name => "UPCASE",    :value => true,           :active => true)
StaticData.create(:name => "SITE_NAME", :value => "Metro County", :active => true)
puts "done"

print "Seeding users..."
User.delete_all
User.create(:email => "admin@example.com", :password => "admin", :first_name => "Admin", :last_name => "User")
puts "done"


print "Seeding contact types..."
ContactType.delete_all
%w(F.I. Warning Citation Arrest Suspect Victim Witness).each do |type|
  ContactType.create(:name => type)
end
puts "done"

print "Seeding relationship types..."
RelationshipType.delete_all
%w(Alias Family Neighbor Gang).each do |type|
  RelationshipType.create(:name => type)
end
puts "done"

print "Seeding NCIC Region codes..."
Region.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICRegionCodes.txt")) do |regions|
  regions.read.each_line do |region|
    value, code = region.chomp.split("|")
    Region.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Race codes..."
Race.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICRaceCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Race.create(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Offense codes..."
Offense.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICOffenseCodes.txt")) do |ocodes|
  ocodes.read.each_line do |ocode|
    code, value = ocode.chomp.split("|")
    Offense.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Vehicle Make codes..."
VehicleMake.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleMakeCodes.txt")) do |vcodes|
  vcodes.read.each_line do |vcode|
    code, value = vcode.chomp.split("|")
    VehicleMake.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Vehicle Model codes..."
VehicleModel.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleModelCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    VehicleModel.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Eye Color codes..."
EyeColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICEyeColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    EyeColor.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Hair Color codes..."
HairColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICHairColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    HairColor.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Vehicle Color codes..."
VehicleColor.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICVehicleColorCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    VehicleColor.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Gender codes..."
Gender.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICGenderCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Gender.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"

print "Seeding NCIC Property Type codes..."
PropertyType.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICPropertyTypeCodes.txt")) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    PropertyType.create!(:code => code, :value => value, :active => true)
  end
end
puts "done"


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
    :city         => Faker::Address.city, 
    :region       => Region.find_by_code(Faker::Address.state_abbr), 
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