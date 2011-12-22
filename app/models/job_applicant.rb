class JobApplicant < ActiveRecord::Base
  belongs_to :position
  validates_associated :position
  
  belongs_to :user
  validates_associated :user
end
