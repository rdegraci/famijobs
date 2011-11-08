require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :firstname => "MyString",
      :lastname => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_firstname", :name => "profile[firstname]"
      assert_select "input#profile_lastname", :name => "profile[lastname]"
      assert_select "input#profile_address1", :name => "profile[address1]"
      assert_select "input#profile_address2", :name => "profile[address2]"
      assert_select "input#profile_city", :name => "profile[city]"
      assert_select "input#profile_state", :name => "profile[state]"
      assert_select "input#profile_zipcode", :name => "profile[zipcode]"
      assert_select "input#profile_phone", :name => "profile[phone]"
    end
  end
end
