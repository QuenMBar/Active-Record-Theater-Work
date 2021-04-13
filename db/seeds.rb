# require 'pry'

Audition.delete_all
Role.delete_all

myArray = []
[*1..10].each { |item| myArray << Role.create(character_name: Faker::TvShows::BojackHorseman.character) }
myArray.each do |myRole|
    [*1..rand(10)].each do |item|
        Audition.create(
            actor: Faker::Name.name,
            location: Faker::Address.street_address,
            phone: Faker::PhoneNumber.cell_phone_in_e164,
            hired: false,
            role: myRole,
        )
    end
end

binding.pry
