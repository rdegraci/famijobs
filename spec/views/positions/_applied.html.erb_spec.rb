require 'spec_helper'

describe 'positions/_applied.html.erb' do
  
  it "displays jobs positions that have been applied to" do
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0')
    position2 = mock_model(Position, :title => "Rails Developer", :description => 'Rails Developer', :rate => '1.0')
    position3 = mock_model(Position, :title => "Perl Developer", :description => 'Perl Developer', :rate => '1.0')
    @applied_positions = [position1, position2, position3]
    
    render(:partial => 'positions/applied', :locals => { :applied_positions => @applied_positions})
    
    rendered.should contain("PHP Developer")
    rendered.should contain("Rails Developer")
    rendered.should contain("Perl Developer")
  end

end
