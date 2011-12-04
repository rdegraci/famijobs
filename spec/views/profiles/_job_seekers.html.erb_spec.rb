require 'spec_helper'

describe 'profiles/_job_seekers.html.erb' do
  
  it "displays job seekers" do
    seeker1 = mock_model(Profile, :firstname => 'Alvin', :lastname => "Alva", :jobtitle => 'PHP Developer')
    seeker2 = mock_model(Profile, :firstname => 'Bob', :lastname => 'Silva', :jobtitle => 'Rails Developer')
    @job_seekers = [seeker1, seeker2]
    
    render(:partial => 'profiles/job_seekers', :locals => { :job_seekers => @job_seekers})
    
    rendered.should contain('PHP Developer')
    rendered.should contain('Rails Developer')
  end

end
