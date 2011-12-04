require 'spec_helper'

describe DashboardController do
  describe "GET index" do
    it "gets open positions" do
      
      p1 = FactoryGirl.create :php_dev
      p2 = FactoryGirl.create :rails_dev
      p3 = FactoryGirl.create :perl_dev
      open_positions = [p1, p2, p3]
      
      Position.stub(:open_positions).and_return(open_positions)
      Position.should_receive(:open_positions).and_return(open_positions)  
      
      get :index
      open_positions = Position.open_positions
      assigns(:open_positions).should eql(open_positions)
      
      response.should render_template(root_path)
    end
    
    it "gets job seekers" do
    end
    
    it "gets positions applied" do
    end
    
    it "gets positions not applied" do
    end
  end
end
