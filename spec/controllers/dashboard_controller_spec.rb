require 'spec_helper'

describe DashboardController do
  
  # devise rspec, see #spec/spec_helper.rb
  # allows subject.current_user to exist within the controller spec
  login_user
  
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
      profile1 = FactoryGirl.create :alvin_profile
      profile2 = FactoryGirl.create :bob_profile
      job_seekers = [subject.current_user.profile, profile1, profile2]
      
      Profile.stub(:job_seekers).and_return(job_seekers)
      Profile.should_receive(:job_seekers).and_return(job_seekers)
      
      get :index
      
      job_seekers = Profile.job_seekers
      assigns(:job_seekers).should eql(job_seekers)
      
      response.should render_template(root_path)
    end
    
    it "gets positions the current user has applied to" do
            
      p1 = FactoryGirl.create :php_dev
      subject.current_user.applications << p1
      
      p2 = FactoryGirl.create :rails_dev
      
      p3 = FactoryGirl.create :perl_dev
      subject.current_user.applications << p3
      
      applied_positions = [p1, p3]
               
      get :index
      
      assigns(:applied_positions).should eql(applied_positions)
      
      response.should render_template(root_path)
    end
    
    it "gets positions the current user has not applied" do
      
      other_user = FactoryGirl.create :bob
      
      p1 = FactoryGirl.create :php_dev
      subject.current_user.applications << p1
      
      p2 = FactoryGirl.create :rails_dev
      other_user.positions << p2
      other_user.save
      
      p3 = FactoryGirl.create :perl_dev
      subject.current_user.applications << p3
      subject.current_user.save
      
      applied_positions = [p1, p3]

       Position.stub(:unapplied).with(subject.current_user).and_return([p2])
       Position.should_receive(:unapplied).and_return([p2])
               
      get :index
      
      unapplied_positions = Position.unapplied(subject.current_user)
      assigns(:unapplied_positions).should eql(unapplied_positions)
      
      response.should render_template(root_path)
    end
  end
end
