Given /^there are positions$/ do
  user1 = FactoryGirl.create :alvin
  
  pos1 = FactoryGirl.create :php_dev
  pos2 = FactoryGirl.create :rails_dev
  pos3 = FactoryGirl.create :perl_dev 
  
  user1.positions << pos1 << pos2 << pos3
  user1.save
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
