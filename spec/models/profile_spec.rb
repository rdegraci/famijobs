require 'spec_helper'

describe Profile do

  it "is valid with valid attributes" do

    user = FactoryGirl.create :alvin

    profile = Profile.create(  {:firstname => "Firstname",
                                :lastname => "Lastname",
                                :address1 => "address1",
                                :address2 => "address2",
                                :city => "city",
                                :state => "FL",
                                :zipcode => "12345",
                                :phone => "123-456-7890",
                                :user => user,
                                :available => true,
                                :jobtitle => "Job Title",
                                :skills => "Skill1, Skill2, Skill3" } )
                                
    profile.should be_valid
  end

  it "is not valid without a first name" do
    position = Profile.new :firstname => nil
    position.should_not be_valid
  end

  it "is not valid without a last name" do
    position = Profile.new :lastname => nil
    position.should_not be_valid
  end

  it "is not valid without a phone" do
    position = Profile.new :phone => nil
    position.should_not be_valid
  end
  
  it "is not valid without a User" do
    position = Profile.new :user => nil
    position.should_not be_valid
  end
  
end


