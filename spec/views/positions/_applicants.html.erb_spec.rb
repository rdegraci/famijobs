require 'spec_helper'

describe 'positions/_applicants.html.erb' do
  
  it "displays applicants for a position" do
    
    employer = mock_model(User)
    
    applicant1 = mock_model(User)
    profile1 = mock_model(Profile, :firstname => 'Joe', :lastname => "Jobs", :title => 'PHP Developer', :skills => "PHP, HTML", :phone => "123-456-7890")
    applicant1.stub(:profile).and_return(profile1)
    
    applicant2 = mock_model(User)
    profile2 = mock_model(Profile, :firstname => 'Moe', :lastname => "Massey", :title => 'PHP Developer', :skills => "PHP, HTML", :phone => "123-555-3456")
    applicant2.stub(:profile).and_return(profile2)
    
    position1 = mock_model(Position, :title => "Rails Developer", :description => 'Rails Developer to write a Rails App', :rate => '1.0')

    position1.stub(:applicants).and_return([applicant1, applicant2])
    
    render(:partial => 'positions/applicants', :locals => { :position => position1})
    
    rendered.should contain(profile1.firstname)
    rendered.should contain(profile2.firstname)
  end

end