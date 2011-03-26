print "Seeding contact types..."
ContactType.delete_all
%w(F.I. Warning Citation Arrest Suspect Victim Witness).each do |type|
  ContactType.create(:name => type, :active => true)
end
puts "done"

print "Seeding NCIC Region codes..."
Region.delete_all
open(File.join(Rails.root, "db", "seeds", "NCICRegionCodes.txt")) do |regions|
  regions.read.each_line do |region|
    value, code = region.chomp.split('|')
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


################
# TESTING DATA #
################
print "Seeding Addresses..."
Address.delete_all
(1..100).each do |address|
  Address.create(:street_number => Faker::Base.numerify('#####'), 
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
type_count = ContactType.count
(1..100).each do |contact|
  Contact.create(:contact_type => ContactType.find(rand(type_count)+1),
    :first_name => Faker::Name.first_name,
    :last_name  => Faker::Name.last_name,
    :addresses  => [Address.find(rand(100)+1), Address.find(rand(100)+1)],
    :race       => Race.find_by_code(%w[A B I O U W].rand),
    :active     => true
  )
end
puts "done"