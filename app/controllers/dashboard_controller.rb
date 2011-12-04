class DashboardController < ApplicationController
  
  def index
      @open_positions = Position.open_positions
      @job_seekers = Profile.find_all_by_available(true) || []
  end
  
end
