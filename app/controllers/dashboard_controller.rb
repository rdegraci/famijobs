class DashboardController < ApplicationController
  
  def index
      @positions = Position.find_all_by_open(true) || []
  end
  
end
