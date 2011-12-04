require 'spec_helper'

describe PositionsController do
    
  describe "PUT apply" do
    it "applies the current user to open positions" do
      
      current_user = FactoryGirl.create :bob
      
      p1 = FactoryGirl.create :php_dev
      p2 = FactoryGirl.create :rails_dev
      p3 = FactoryGirl.create :perl_dev
      open_positions = [p1, p2, p3]
      
      # We stub different return values, depending on the input values
      Position.stub(:apply).with([], nil).and_return([])
      Position.stub(:apply).with(open_positions, current_user).and_return(open_positions)

      put :apply
      
      Position.apply(open_positions, current_user)
      
      response.should redirect_to(root_path)
    end
  end
  
  describe "PUT unapply" do
    it "unapplies the current user from applied positions" do
    end
  end
  
end
