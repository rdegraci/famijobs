class DashboardController < ApplicationController
  
  def index

      @open_positions = Position.open_positions
      @job_seekers = Profile.find_all_by_available(true) || []
      
      if current_user == nil
        @applied_positions = [] 
        @unapplied_positions = []
      else

          @applied_positions = current_user.applications 
          @unapplied_positions = Position.unapplied_by(current_user)

      end 

  end
  
end
