class Position < ActiveRecord::Base
  belongs_to :user
  has_many :job_applicants
  has_many :applicants, :through => :job_applicants, :source => :user
  
  # Business Rules
  def self.open_positions
    Position.find_all_by_open(true) || []
  end
  
end
