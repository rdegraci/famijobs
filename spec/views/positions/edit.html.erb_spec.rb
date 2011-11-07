require 'spec_helper'

describe "positions/edit.html.erb" do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      :title => "MyString",
      :description => "MyText",
      :rate => 1.5,
      :open => false
    ))
  end

  it "renders the edit position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path(@position), :method => "post" do
      assert_select "input#position_title", :name => "position[title]"
      assert_select "textarea#position_description", :name => "position[description]"
      assert_select "input#position_rate", :name => "position[rate]"
      assert_select "input#position_open", :name => "position[open]"
    end
  end
end
