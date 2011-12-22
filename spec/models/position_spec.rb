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
 
 describe "#unapply" do
   it "unapplies the current user to a collection of jobs" do
     
     current_user = FactoryGirl.create :bob
     
     p1 = FactoryGirl.create(:php_dev)
     p2 = FactoryGirl.create(:rails_dev)
     p3 = FactoryGirl.create(:perl_dev)
     
     positions = [p1, p3]
     result = Position.unapply(positions, current_user)
     result.should eql(positions)
     
     unapplied = Position.unapplied_by(current_user)
     unapplied.should eql([])
   end
   
   it "will handle if the positions is empty and the current_user is nil" do
     current_user = nil
     positions = []
     result = Position.unapply(positions, current_user)
     result.should eql([])
     
     unapplied = Position.unapplied_by(current_user)
     unapplied.should == []
   end
   
 end
 
 describe "#unapplied_by" do
   it "returns positions that a current user has not applied to" do
     current_user = FactoryGirl.create :bob
     other_user = FactoryGirl.create :alvin
     
     p1 = FactoryGirl.create(:php_dev)
     p2 = FactoryGirl.create(:rails_dev)
     p3 = FactoryGirl.create(:perl_dev)
     
     p3.save
     
     other_user.positions << p1
     other_user.positions << p2
     other_user.positions << p3
     other_user.save
     
     current_user.applications << p1
     current_user.applications << p2
     
     current_user.save
     
     positions = Position.unapplied_by(current_user)
     positions.should eql([p3])
     
   end
 end
 
 
end
