class DashboardController < ApplicationController
  
  def index
      @positions = Position.find_all_by_open(true) || []
      @jobseekers = Profile.find_all_by_available(true) || []
  end
  
end
