require 'spec_helper'

describe PositionsHelper do
  it "extracts an array of positions from a hash of positions" do
    p1 = FactoryGirl.create :rails_dev
    p2 = FactoryGirl.create :php_dev
    p3 = FactoryGirl.create :perl_dev
    
    positions_hash = {"#{p1.id}"=>{"applied"=>"1"}, "#{p2.id}"=>{"applied"=>"0"}, "#{p3.id}"=>{"applied"=>"1"}}
    result = [p1, p3]
    helper.extract(positions_hash).should == result 
  
  end
end