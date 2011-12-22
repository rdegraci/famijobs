require 'spec_helper'

describe 'positions/_unapplied.html.erb' do
  
  it "displays unapplied positions" do
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0')
    position2 = mock_model(Position, :title => "Rails Developer", :description => 'Rails Developer', :rate => '1.0')
    position3 = mock_model(Position, :title => "Perl Developer", :description => 'Perl Developer', :rate => '1.0')
    @unapplied_positions = [position1, position2, position3]
    
    render(:partial => 'positions/unapplied', :locals => { :unapplied_positions => @unapplied_positions})
    
    rendered.should contain("PHP Developer")
    rendered.should contain("Rails Developer")
    rendered.should contain("Perl Developer")
  end
  
  it "displays does not display applied positions" do
    position1 = mock_model(Position, :title => "PHP Developer", :description => 'PHP Developer', :rate => '1.0')
    position2 = mock_model(Position, :title => "Rails Developer", :description => 'Rails Developer', :rate => '1.0')
    position3 = mock_model(Position, :title => "Perl Developer", :description => 'Perl Developer', :rate => '1.0')
    @unapplied_positions = [position1, position2, position3]
    
    render(:partial => 'positions/unapplied', :locals => { :unapplied_positions => @unapplied_positions})
    
    rendered.should contain("PHP Developer")
    rendered.should contain("Rails Developer")
    rendered.should contain("Perl Developer")
  end

end
