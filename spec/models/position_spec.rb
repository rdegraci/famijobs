require 'spec_helper'

describe Position do
 
 it "is valid with valid attributes" do
   
   u = FactoryGirl.create :alvin
   
   position = Position.create(:title => "Title", :description => "Description", :rate => 1.23, :open => true, :user => u) 
          
   position.should be_valid
  
 end
 
 it "is not valid without a title" do
   position = Position.new :title => nil
   position.should_not be_valid
 end
  
 it "is not valid without a description" do
   position = Position.new :description => nil
    position.should_not be_valid
 end
 
 it "is not valid without a rate" do
   position = Position.new :rate => nil
    position.should_not be_valid
 end
  
 
 # Business Rules
 
 describe "#open_positions" do
   it "returns positions that are open" do
     
     owner = FactoryGirl.create :bob
     
     p1 = FactoryGirl.create(:php_dev, :user => owner)
     p2 = FactoryGirl.create(:rails_dev, :user => owner, :open => false)
     p3 = FactoryGirl.create(:perl_dev, :user => owner)
     
     open_positions = Position.open_positions
     open_positions.should == [p1, p3]
   end
 end
 
 describe "#apply" do
   it "applies the current user to a collection of jobs" do
     
     owner = FactoryGirl.create :bob
     p1 = FactoryGirl.create(:php_dev, :user => owner)
     p2 = FactoryGirl.create(:rails_dev, :user => owner)
     p3 = FactoryGirl.create(:perl_dev, :user => owner)
     
     current_user = FactoryGirl.create :alvin
     
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
     
     owner = FactoryGirl.create :alvin
     p1 = FactoryGirl.create(:php_dev, :user => owner)
     p2 = FactoryGirl.create(:rails_dev, :user => owner)
     p3 = FactoryGirl.create(:perl_dev, :user => owner)
     
     p1.applicants << current_user
     p1.save
     
     p3.applicants << current_user
     p3.save
     
     positions = [p1, p3]
     
     result = Position.unapply(positions, current_user)
     result.should eql(positions)
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
   it "returns all positions not applied by the current user" do
    
     current_user = FactoryGirl.create :bob
     
     owner = FactoryGirl.create :alvin
     p1 = FactoryGirl.create(:php_dev, :user => owner)
     p2 = FactoryGirl.create(:rails_dev, :user => owner)
     p3 = FactoryGirl.create(:perl_dev, :user => owner)
          
     unapplied = Position.unapplied_by(current_user)
     unapplied.should eql([p1, p2, p3])
     
   end
 end
 
 
end
