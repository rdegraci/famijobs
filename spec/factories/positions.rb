# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :position do
    title 'Title'
    description 'Description'
    rate 1.00
    open true
    
    factory :rails_dev do
      title 'Rails Developer'
      description 'Rails developer develops Rails apps'
      rate 45.00
      open true
    end
    
    factory :php_dev do
      title 'PHP Developer'
      description 'PHP developer develops PHP apps'
      rate 35.00
      open true
    end
    
    factory :perl_dev do
      title 'Perl Developer'
      description 'Perl developer develops Perl apps'
      rate 25.00
      open true
    end
  end
end
