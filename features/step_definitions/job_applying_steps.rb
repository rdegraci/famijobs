Given /^there are positions$/ do
  pos1 = FactoryGirl.create :php_dev
  pos2 = FactoryGirl.create :rails_dev
  pos3 = FactoryGirl.create :perl_dev 
end


When /^the User applies for the first open position$/ do
  visit root_path
  check 'position[1][apply]'
  click_button 'Apply'
end

Then /^the position is not listed in the open positions$/ do
  # save_and_open_page
  # find("#open_positions_table").should have_no_content('PHP Developer')
end

Then /^the position is listed in the applied positions$/ do
  #find("#applied_positions_table").should have_content('PHP Developer')
end
