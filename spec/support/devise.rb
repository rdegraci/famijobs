# Add Devise support to rspec
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end