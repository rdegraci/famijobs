require 'spec_helper'

describe PositionsHelper do
  describe "#extract_apply" do
    it "extracts an array of positions from a hash of positions" do
      p1 = FactoryGirl.create :rails_dev
      p2 = FactoryGirl.create :php_dev
      p3 = FactoryGirl.create :perl_dev
    
      # {"1"=>{"apply"=>"1"}, "2"=>{"apply"=>"0"}, "3"=>{"apply"=>"0"}}
      positions_hash = {"#{p1.id}"=>{"apply"=>"1"}, "#{p2.id}"=>{"apply"=>"0"}, "#{p3.id}"=>{"apply"=>"1"}}
      result = [p1, p3]
      helper.extract_apply(positions_hash).should == result 
  
    end
  end
  
  describe "#extract_unapply" do
    it "extracts an array of positions from a hash of positions" do
      p1 = FactoryGirl.create :rails_dev
      p2 = FactoryGirl.create :php_dev
      p3 = FactoryGirl.create :perl_dev
    
      # {"1"=>{"unapply"=>"1"}, "2"=>{"unapply"=>"0"}, "3"=>{"unapply"=>"0"}}
      positions_hash = {"#{p1.id}"=>{"unapply"=>"1"}, "#{p2.id}"=>{"unapply"=>"0"}, "#{p3.id}"=>{"unapply"=>"1"}}
      result = [p1, p3]
      helper.extract_unapply(positions_hash).should == result 
  
    end
  end
end