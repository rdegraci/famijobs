When /^a User has registered$/ do
  visit new_user_registration_path
  fill_in 'Email', :with => 'rdegraci@gmail.com'
  fill_in 'Password', :with => '123456'
  fill_in 'Password confirmation', :with => '123456'
  click_button "Sign up"
  page.should have_content('You have signed up successfully.')
end

Then /^the dashboard will display open positions$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the dashboard will display available job seekers$/ do
  pending # express the regexp above with the code you wish you had
end