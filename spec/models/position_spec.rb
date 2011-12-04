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
 
 describe "#apply" do
   it "applies the current user to a collection of jobs" do
     
     current_user = FactoryGirl.create :bob
     
     p1 = FactoryGirl.create(:php_dev)
     p2 = FactoryGirl.create(:rails_dev)
     p3 = FactoryGirl.create(:perl_dev)
     
     positions = [p1, p3]
     result = Position.apply(positions, current_user)
     result.should == positions
     
     applied = Position.applied_by(current_user)
     applied.should == [p1, p3]
   end
   
   it "will handle if the positions is empty and the current_user is nil" do
     current_user = nil
     positions = []
     result = Position.apply(positions, current_user)
     result.should == positions
     
     applied = Position.applied_by(current_user)
     applied.should == []
   end
   
 end
 
end
