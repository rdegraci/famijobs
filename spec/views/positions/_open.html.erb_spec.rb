require 'spec_helper'

describe 'positions/_open.html.erb' do
  
  it "displays open job positions" do
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0')
    position2 = mock_model(Position, :title => "Rails Developer", :description => 'Rails Developer', :rate => '1.0')
    position3 = mock_model(Position, :title => "Perl Developer", :description => 'Perl Developer', :rate => '1.0')
    @open_positions = [position1, position2, position3]
    
    render(:partial => 'positions/open', :locals => { :open_positions => @open_positions})
    
    rendered.should contain("PHP Developer")
    rendered.should contain("Rails Developer")
    rendered.should contain("Perl Developer")
  end

end
