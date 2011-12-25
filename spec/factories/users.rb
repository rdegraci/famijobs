# Read about factories at http://github.com/thoughtbot/factory_girl

# Due to validations, to create a User you must do:
#
# profile = FactoryGirl.create :profile
# then use:  profile.user 
#
FactoryGirl.define do
  factory :user do
    email 'rdegraci@gmail.com'
    password { '123456' }
       
    factory :alvin do
      email 'alvin@alvin.com'
      password { '123456' }
    end
    
    factory :bob do
      email 'bob@bob.com'
      password { '123456' }
    end
    
    factory :charlie do
      email 'charly@charlie.com'
      password { '123456' }
    end
    
  end
end
