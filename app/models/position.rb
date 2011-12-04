class Position < ActiveRecord::Base
  belongs_to :user
  has_many :job_applicants
  has_many :applicants, :through => :job_applicants, :source => :user
  
  # Business Rules
  def self.open_positions
    Position.find_all_by_open(true) || []
  end
  
  def self.apply(positions, user)
    return [] if !user || positions.empty? == true
    positions.each do |position|
      position.applicants << user
      position.save
    end
  end
  
  def self.applied_by(user)
    return [] if !user
    user.applications
  end
  
end
