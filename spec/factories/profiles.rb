# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    firstname "Rodney"
    lastname "Degracia"
    address1 "123 A Street"
    address2 "Apt 1"
    city "Orlando"
    state "FL"
    zipcode "32821"
    phone "571-482-9809"
    available true
    jobtitle "iOS Developer"
    skills "Ruby, C++, Objective-C"
    
    factory :profile1 do
      firstname "Alvin"
      lastname "Armand"
      address1 "123 A Street"
      address2 "Apt 2"
      city "Orlando"
      state "FL"
      zipcode "32821"
      phone "123-456-8790"
      available true
      jobtitle "C Programmer"
      skills "C, gcc"
    end
    
    factory :profile2 do
      firstname "Bob"
      lastname "Bulward"
      address1 "123 B Street"
      address2 "Apt 2"
      city "Orlando"
      state "FL"
      zipcode "32821"
      phone "123-654-7890"
      available true
      jobtitle "C++ Developer"
      skills "C++, cpp"
    end
  end
end
