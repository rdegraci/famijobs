# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    title 'Rails Developer'
    description 'Rails developer develops rails apps'
    rate 25.00
    open true
  end
end
