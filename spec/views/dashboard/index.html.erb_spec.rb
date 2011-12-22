require 'spec_helper'

describe 'dashboard/index.html.erb' do
    
  it "displays job seekers" do
    seeker1 = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    seeker2 = mock_model(Profile, :firstname => 'Bob', :lastname => 'Silva', :jobtitle => 'Rails Developer')

    @job_seekers = [seeker1, seeker2]
    render :partial => "profiles/job_seekers", :locals => {:job_seekers => @job_seekers}
    
    rendered.should =~ /Alvin/
    rendered.should =~ /Bob/
        
  end

  it "displays jobs that the current user has not applied to" do
    current_user = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0', :job_applicants => [])
        
    @unapplied_positions = [position1]
    
    render :partial => "positions/unapplied", :locals => {:unapplied_positions => @unapplied_positions}
    
    rendered.should =~ /PHP Developer/    
  end
  
  it "displays jobs that the current user has applied to" do
    current_user = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0', :job_applicants => [current_user])
    
    @applied_positions = [position1]
    
    render :partial => "positions/applied", :locals => {:applied_positions => @applied_positions}
    
    rendered.should =~ /PHP Developer/
  end
  
  it "displays open jobs" do
    current_user = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0', :user_id => current_user, :open => true)
    
    other_user = mock_model(Profile, :firstname => 'Bob', :lastname => "Barker", :jobtitle => 'Rails Developer')
    position2 = mock_model(Position, :title => "Perl Developer", :description => 'Perl Developer', :rate => '1.0', :user_id => other_user, :open => true)
    
    @open_positions = [position1, position2]
    
    render :partial => "positions/open", :locals => {:open_positions => @open_positions}
    
    rendered.should =~ /PHP Developer/
    rendered.should =~ /Perl Developer/
  end
    
end
