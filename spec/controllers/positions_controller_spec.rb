require 'spec_helper'

describe PositionsController do
    
  # devise rspec, see #spec/spec_helper.rb
  # allows subject.current_user to exist within the controller spec
  login_user
  
  describe "PUT apply" do
    it "applies the current user to open positions" do
      
      owner = FactoryGirl.create :bob
      
      p1 = FactoryGirl.create :php_dev, :user => owner
      p2 = FactoryGirl.create :rails_dev, :user => owner
      p3 = FactoryGirl.create :perl_dev, :user => owner
      open_positions = [p1, p2, p3]
      
      Position.stub(:apply).with(open_positions, subject.current_user).and_return(open_positions)
      applied = Position.apply(open_positions, subject.current_user)
      
      # apply to all three positions
      put :apply, {"position"=>{"1"=>{"apply"=>"1"}, "2"=>{"apply"=>"1"}, "3"=>{"apply"=>"1"}} }
      
      assigns(:applied).should eql(applied)
      response.should redirect_to(root_path)
    end
  end
  
  describe "PUT unapply" do
    it "unapplies the current user from applied positions" do
      
      owner = FactoryGirl.create :bob
      
      p1 = FactoryGirl.create :php_dev, :user => owner
      p2 = FactoryGirl.create :rails_dev, :user => owner
      p3 = FactoryGirl.create :perl_dev, :user => owner
      applied_positions = [p1, p2, p3]
      
      Position.stub(:unapply).with(applied_positions, subject.current_user).and_return(applied_positions)
      unapplied =  Position.unapply(applied_positions, subject.current_user)
      
      # unapply from all three positions
      put :unapply, {"position"=>{"1"=>{"unapply"=>"1"}, "2"=>{"unapply"=>"1"}, "3"=>{"unapply"=>"1"}} }
      
      assigns(:unapplied).should eql(unapplied)
      response.should redirect_to(root_path)
    end
  end
  
end
