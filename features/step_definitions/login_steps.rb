When /^a User has registered$/ do
  visit new_user_registration_path
  fill_in 'Email', :with => 'capybara@elvenlabs.com'
  fill_in 'Password', :with => '123456'
  fill_in 'Password confirmation', :with => '123456'
  click_button "Sign up"
  page.should have_content('You have signed up successfully.')
end

Then /^the dashboard will display open positions$/ do
  page.should have_content('Rails Developer')
end

Then /^the dashboard will display available job seekers$/ do  
  page.should have_content('Rodney Degracia')
end


When /^the User has created a profile$/ do
  visit new_profile_path
  fill_in 'Firstname', :with => 'Rodney'
  fill_in 'Lastname', :with => 'Degracia'
  fill_in 'Phone', :with => '123-555-1234'
  click_button "Create Profile"
  page.should have_content('Firstname: Rodney')
  visit root_path
end

When /^there are positions$/ do  
  FactoryGirl.create :php_dev
  FactoryGirl.create :rails_dev
  FactoryGirl.create :perl_dev
end

Given /^the user visits the Dashboard$/ do
  visit root_path
end

Then /^the User will log out$/ do
  visit root_path
  click_link 'Sign out'
end