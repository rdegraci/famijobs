require 'spec_helper'

describe "profiles/index.html.erb" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone => "Phone"
      ),
      stub_model(Profile,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
