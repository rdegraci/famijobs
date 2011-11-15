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
  end
end
