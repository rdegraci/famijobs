When /^the User creates a Position$/ do
  visit new_position_path
  fill_in 'Title', :with => 'Burger Flipper'
  fill_in 'Description', :with => 'Flips burgers'
  fill_in 'Rate', :with => '10.0'
  check 'Open'
  click_button "Create Position"
  page.should have_content('Position was successfully created')
end

Then /^the Position is listed in the Users Positions$/ do
  visit positions_path
  page.should have_content('Burger Flipper')
end