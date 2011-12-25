

Given /^a user has logged in$/ do
  visit root_path
  click_link 'Sign in'
  fill_in 'Email', :with => 'capybara@elvenlabs.com'
  fill_in 'Password', :with => '123456'
  click_button "Sign in"
end

When /^the User applies for the first unapplied position$/ do
  visit root_path
  check 'position[1][apply]'
  click_button 'Apply'
end

Then /^the position is not listed in the unapplied positions$/ do
  find("#unapplied_positions_table").should have_no_content('PHP Developer')
end

Then /^the position is listed in the applied positions$/ do
  find("#applied_positions_table").should have_content('PHP Developer')
end
