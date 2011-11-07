# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'rdegraci@gmail.com'
    password '123456'
  end
end
