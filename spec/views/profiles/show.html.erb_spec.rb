require 'spec_helper'

describe "profiles/show.html.erb" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lastname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zipcode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
  end
end
