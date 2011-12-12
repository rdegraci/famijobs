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
  
  it "does not display applied jobs" do
    current_user = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0', :job_applicants => [current_user])
    
    @applied_positions = [position1]
    
    render :partial => "positions/applied", :locals => {:applied_positions => @applied_positions}
    
    rendered.should !~ /PHP Developer/
  end
  
end


# @positions = [position1, position2, position3]
# 
# render(:partial => 'positions/open', :locals => { :positions => @positions})
# 
# rendered.should contain("PHP Developer")