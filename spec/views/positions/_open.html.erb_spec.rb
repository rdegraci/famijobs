require 'spec_helper'

describe 'positions/_open.html.erb' do
  
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
