require 'spec_helper'

describe Position do
 
 it "is valid with valid attributes" do
   Position.new.should be_valid
 end
 
 it "is not valid without a title" do
   position = Position.new :title => nil
 end
 
 # Business Rules
 
 describe "#open_positions" do
   it "returns positions that are open" do
     p1 = FactoryGirl.create(:php_dev)
     p2 = FactoryGirl.create(:rails_dev, :open => false)
     p3 = FactoryGirl.create(:perl_dev)
     open_positions = Position.open_positions
     open_positions.should == [p1, p3]
   end
 end
 
end
