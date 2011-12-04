# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'rdegraci@gmail.com'
    password '123456'
    profile
    
    factory :alvin do
      email 'alvin@alvin.com'
      association :profile, :factory => :alvin_profile
    end
    
    factory :bob do
      email 'bob@bob.com'
      association :profile, :factory => :bob_profile
    end
    
    factory :charlie do
      email 'charly@charlie.com'
      association :profile, :factory => :charlie_profile
    end
    
  end
end
