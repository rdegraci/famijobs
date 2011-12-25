require 'spec_helper'

describe User do

  it "is valid with valid attributes" do

    # email password and password_confirmation are virtual attributes
    # and are required if we want to save the User in the DB
    profile = User.create(  {   :email => "e@mail.com",
                                :password => "123456",
                                :password_confirmation => "123456" } )
                                
    profile.should be_valid
  end

end
