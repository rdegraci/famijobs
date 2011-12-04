When /^a User has registered$/ do
  visit new_user_registration_path
  fill_in 'Email', :with => 'rdegraci@gmail.com'
  fill_in 'Password', :with => '123456'
  fill_in 'Password confirmation', :with => '123456'
  click_button "Sign up"
  page.should have_content('You have signed up successfully.')
end

Then /^the dashboard will display open positions$/ do
  position = FactoryGirl.create(:rails_dev)
  visit root_path
  page.should have_content('Rails Developer')
end

Then /^the dashboard will display available job seekers$/ do
  user = User.find_by_email('rdegraci@gmail.com')
  user.profile = FactoryGirl.create(:profile)
  user.profile.save!
  visit root_path
  page.should have_content('iOS Developer')
end