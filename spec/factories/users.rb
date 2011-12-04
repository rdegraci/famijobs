# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'rdegraci@gmail.com'
    password '123456'
    profile
    
    factory :user1 do
      email 'alvin@alvin.com'
      association :profile, :factory => :profile1
    end
    
    factory :user2 do
      email 'bob@bob.com'
      association :profile, :factory => :profile2
    end
    
  end
end
